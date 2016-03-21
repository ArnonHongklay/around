'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentCtrl', ($scope, Auth, $location, $window, $http, $state) ->
  console.log "ContentCtrl"

  $scope.currentFilter = 'all'

  $scope.filterContent =(filter)->
    $scope.currentFilter = filter

  $scope.checkFilter =(type)->
    console.log JSON.stringify(type)
    return true if $scope.currentFilter == "all"
    return false if !type
    return JSON.stringify(type).indexOf($scope.currentFilter) > 0

  $http.get('/api/contents').success (contents) ->
    $scope.contents = contents


