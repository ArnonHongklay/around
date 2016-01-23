'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentNewCtrl', ($scope, Auth, $location, $window) ->
  console.log "ContentNew"

  $scope.previewContent = ->
    $('.body-preview').html $scope.contentBody
    console.log $scope.contentBody
