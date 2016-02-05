(function() {
  'use strict';
  angular.module('aroundThailandApp').config(function($stateProvider) {
    return $stateProvider.state('content', {
      url: '/content',
      templateUrl: 'app/content/content.html',
      controller: 'ContentCtrl'
    }).state('new', {
      url: '/content/new',
      templateUrl: 'app/content/new/new.html',
      controller: 'ContentNewCtrl'
    });
  });

  'use strict';

  angular.module('aroundThailandApp').controller('ContentCtrl', function($scope, Auth, $location, $window, $http) {
    console.log("ContentCtrl");
    return $http.get('/api/contents').success(function(contents) {
      return $scope.contents = contents;
    });
  });

}).call(this);

//# sourceMappingURL=content.js.map
