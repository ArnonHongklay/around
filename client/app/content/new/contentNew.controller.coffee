'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentNewCtrl', ($scope, Auth, $location, $window, $http) ->
  console.log "ContentNew"
  $('select').material_select()
  $scope.previewContent = ->
    $('.body-preview').html $scope.content.content

  $scope.saveContent = ->
    console.log($scope.content)
    return if $scope.newThing is ''
    $http.post '/api/contents', $scope.content

  $scope.preview = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        console.log(e.target.result)
        $('#preview-img').attr 'src', e.target.result
        $scope.content.image.data = e.target.result
        $scope.content.image.path = 'content/preview'
        return

      reader.readAsDataURL input.files[0]
      $scope.newEvent.image.name = input.files[0].name
      $scope.newEvent.image.type = input.files[0].type
      $scope.newEvent.image.size = input.files[0].size
    return
