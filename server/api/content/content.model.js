'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ContentSchema = new Schema({
  title: String,
  description: String,
  created_by: String,
  location: String,
  content: String,
  imagePreview: String,
  created_at: Date
});

module.exports = mongoose.model('Content', ContentSchema);