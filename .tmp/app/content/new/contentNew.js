(function() {
  angular.module('aroundThailandApp').controller('ContentNewCtrl', function($scope, Auth, $location, $window, $http, $state) {
    console.log("ContentNew");
    $scope.content = {
      content: "",
      image: {
        data: '',
        path: ''
      }
    };
    $('select').material_select();
    $scope.previewContent = function() {
      $('.body-preview').html($scope.content.content);
    };
    $scope.saveContent = function() {
      console.log($scope.content);
      if ($scope.content.content === '') {
        return;
      }
      return $http.post('/api/contents', $scope.content).success(function(content) {
        console.log(content);
        return $state.go($state.current, {}, {
          reload: true
        });
      });
    };
    return $scope.preview = function(input) {
      var reader;
      if (input.files && input.files[0]) {
        reader = new FileReader;
        reader.onload = function(e) {
          console.log(e.target.result);
          $('#preview-img').attr('src', e.target.result);
          $scope.content.imageData = e.target.result;
          $scope.content.imageType = input.files[0].type;
          $scope.content.imageSize = input.files[0].size;
        };
        reader.readAsDataURL(input.files[0]);
      }
    };
  });

}).call(this);

//# sourceMappingURL=contentNew.js.map
