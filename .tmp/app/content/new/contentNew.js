(function() {
  'use strict';
  angular.module('aroundThailandApp').controller('ContentNewCtrl', function($scope, Auth, $location, $window, $http) {
    console.log("ContentNew");
    $('select').material_select();
    $scope.previewContent = function() {
      return $('.body-preview').html($scope.content.content);
    };
    $scope.saveContent = function() {
      console.log($scope.content);
      if ($scope.newThing === '') {
        return;
      }
      return $http.post('/api/contents', $scope.content);
    };
    return $scope.preview = function(input) {
      var reader;
      if (input.files && input.files[0]) {
        reader = new FileReader;
        reader.onload = function(e) {
          console.log(e.target.result);
          $('#preview-img').attr('src', e.target.result);
          $scope.content.image.data = e.target.result;
          $scope.content.image.path = 'content/preview';
        };
        reader.readAsDataURL(input.files[0]);
        $scope.newEvent.image.name = input.files[0].name;
        $scope.newEvent.image.type = input.files[0].type;
        $scope.newEvent.image.size = input.files[0].size;
      }
    };
  });

}).call(this);

//# sourceMappingURL=contentNew.js.map
