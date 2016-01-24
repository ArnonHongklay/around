// // Require the library
// var poller = require('poller');

// // Poll a file directory
// poller('/tmp/instagramPoller', function (err, poll) {

//     // Log every time a file is added into the folder
//     poll.on('add', function (filePath) {
//         console.log(filePath,'was added');
//     });

//     // Log every time a file is removed from the folder
//     poll.on('remove', function (filePath) {
//         console.log(filePath,'was removed');
//     });

//     // Stop polling the folder for file adds/removals
//     poll.close();

// });


// // Poll a file directory at an interval of 50ms (the default is 100ms)
// poller('/tmp/instagramPoller', {interval: 50}, function (err, poll) {


