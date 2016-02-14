'use strict'

angular.module 'aroundThailandApp'
.controller 'MainCtrl', ($scope, $http, socket) ->

  $http.get('/api/contents').success (contents) ->
    $scope.contents = contents

