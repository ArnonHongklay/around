/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /things              ->  index
 * POST    /things              ->  create
 * GET     /things/:id          ->  show
 * PUT     /things/:id          ->  update
 * DELETE  /things/:id          ->  destroy
 */

'use strict';

var _ = require('lodash');

var Content = require('./content.model');

// Get list of things
exports.index = function(req, res) {
  Content.find(function (err, contents) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(contents);
  });
};

// Get a single thing
exports.show = function(req, res) {
  Content.findById(req.params.id, function (err, content) {
    if(err) { return handleError(res, err); }
    if(!content) { return res.status(404).send('Not Found'); }
    return res.json(content);
  });
};

// Creates a new thing in the DB.
exports.create = function(req, res) {
  console.log(req.body);

  var fs = require("fs");
  var base64Data = req.body.imageData.replace(/^data:image\/(png|jpeg);base64,/, "");
  var ImgType;

  if(req.body.imageType.toLowerCase().indexOf('jpeg') >=0 ) {
    ImgType = ".jpg"
  }else {
    ImgType = ".png"
  }

  var imageName = Math.random().toString(36).substring(7);
  req.body.imagePreview = "assets/images/preview/"+imageName+ImgType

  fs.writeFile("client/"+req.body.imagePreview, base64Data, 'base64', function(err) {
    console.log(err);
  });

  Content.create(req.body, function(err, content) {
    if(err) { return handleError(res, err); }

    return res.status(201).json(content);
  });
};

// Updates an existing thing in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Content.findById(req.params.id, function (err, content) {
    if (err) { return handleError(res, err); }
    if(!content) { return res.status(404).send('Not Found'); }
    var updated = _.merge(content, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(content);
    });
  });
};

// Deletes a thing from the DB.
exports.destroy = function(req, res) {
  Content.findById(req.params.id, function (err, content) {
    if(err) { return handleError(res, err); }
    if(!content) { return res.status(404).send('Not Found'); }
    content.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};

function handleError(res, err) {
  return res.status(500).send(err);
}
