(function() {
  'use strict';
  angular.module('aroundThailandApp').config(function($stateProvider) {
    return $stateProvider.state('main', {
      url: '/',
      templateUrl: 'app/main/main.html',
      controller: 'MainCtrl'
    });
  });

  'use strict';

  angular.module('aroundThailandApp').controller('MainCtrl', function($scope, $http, socket) {
    $scope.awesomeThings = [];
    $http.get('/api/things').success(function(awesomeThings) {
      $scope.awesomeThings = awesomeThings;
      return socket.syncUpdates('thing', $scope.awesomeThings);
    });
    $scope.addThing = function() {
      if ($scope.newThing === '') {
        return;
      }
      $http.post('/api/things', {
        name: $scope.newThing
      });
      return $scope.newThing = '';
    };
    $scope.deleteThing = function(thing) {
      return $http["delete"]('/api/things/' + thing._id);
    };
    $scope.$on('$destroy', function() {
      return socket.unsyncUpdates('thing');
    });
    return $scope.previewContent = function() {
      $('.body-preview').html($scope.contentBody);
      return console.log($scope.contentBody);
    };
  });

}).call(this);

//# sourceMappingURL=main.js.map
