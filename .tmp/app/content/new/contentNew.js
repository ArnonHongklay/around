(function() {
  'use strict';
  angular.module('aroundThailandApp').controller('ContentNewCtrl', function($scope, Auth, $location, $window, $http) {
    console.log("ContentNew");
    $('select').material_select();
    $scope.previewContent = function() {
      $('.body-preview').html($scope.content.content);
    };
    $scope.saveContent = function() {
      console.log($scope.content);
      if ($scope.newThing === '') {
        return;
      }
      return $http.post('/api/contents', $scope.content);
    };
    return $scope.preview = function(input) {};
  });

}).call(this);

//# sourceMappingURL=contentNew.js.map
