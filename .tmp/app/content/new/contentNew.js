(function() {
  'use strict';
  angular.module('aroundThailandApp').controller('ContentNewCtrl', function($scope, Auth, $location, $window) {
    console.log("ContentNew");
    return $scope.previewContent = function() {
      $('.body-preview').html($scope.contentBody);
      return console.log($scope.contentBody);
    };
  });

}).call(this);

//# sourceMappingURL=contentNew.js.map
