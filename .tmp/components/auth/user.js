(function() {
  'use strict';
  angular.module('aroundThailandApp').factory('User', function($resource) {
    return $resource('/api/users/:id/:controller', {
      id: '@_id'
    }, {
      changePassword: {
        method: 'PUT',
        params: {
          controller: 'password'
        }
      },
      get: {
        method: 'GET',
        params: {
          id: 'me'
        }
      }
    });
  });

}).call(this);

//# sourceMappingURL=user.js.map
