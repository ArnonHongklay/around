
var http = require('http');
var express = require('express');

var app = express();

// app.configure(function(){

// });

var api = require('instagram-node').instagram();
// api.use({ access_token: 'YOUR_ACCESS_TOKEN' });
api.use({ client_id: '5b345701583145cc843448d3c55c3361',
         client_secret: '405431fc426047c5af2b04ebd81fa2f1' });


api.location('213634987', function(err, result, remaining, limit) {
  console.log(err);
  console.log(result);
  console.log(remaining);
  console.log(limit);
});


api.location_media_recent('213634987', function(err, result, pagination, remaining, limit) {
  console.log(result);
});
