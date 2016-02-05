'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentCtrl', ($scope, Auth, $location, $window, $http) ->
  console.log "ContentCtrl"

  $http.get('/api/contents').success (contents) ->
    $scope.contents = contents


