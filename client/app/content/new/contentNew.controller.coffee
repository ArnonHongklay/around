'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentNewCtrl', ($scope, Auth, $location, $window, $http) ->
  console.log "ContentNew"
  $('select').material_select()

  $scope.previewContent = ->
    $('.body-preview').html $scope.content.content
    return


  $scope.saveContent = ->
    console.log($scope.content)
    return if $scope.newThing is ''
    $http.post '/api/contents', $scope.content

  $scope.preview = (input) ->

