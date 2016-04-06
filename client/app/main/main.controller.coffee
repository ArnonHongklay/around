'use strict'

angular.module 'aroundThailandApp'
.controller 'MainCtrl', ($scope, $http, socket) ->

  $http.get('/api/contents').success (contents) ->
    console.log contents
    $scope.contents = []
    $scope.contents.push(contents[0],contents[2],contents[3],contents[4],contents[5],contents[1])
    #$scope.contents = contents
    $('.parallax').parallax();
    $('.slider').slider({indicators: false})

