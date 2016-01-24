'use strict';

// Use local.env.js for environment variables that grunt will set when the server starts locally.
// Use for your api keys, secrets, etc. This file should not be tracked by git.
//
// You will need to set these on the server you deploy to.

module.exports = {
  DOMAIN:           'http://localhost:9000',
  SESSION_SECRET:   'aroundthailand-secret',

  FACEBOOK_ID:      '534110523426496',
  FACEBOOK_SECRET:  '1f2df379347e01f31e12612e4b8deac8',

  TWITTER_ID:       'dvb0vCPzVYDduMgrH0qEI7zNW',
  TWITTER_SECRET:   '4HyMNqPnTmLbt98b1U0WrzBtVbNt7gJEpVYB65blmqnikeIiUx',

  GOOGLE_ID:        'app-id',
  GOOGLE_SECRET:    'secret',

  // Control debug level for modules using visionmedia/debug
  DEBUG: ''
};
