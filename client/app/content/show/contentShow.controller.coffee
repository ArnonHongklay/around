angular.module 'aroundThailandApp'
.controller 'ContentShowCtrl', ($scope, Auth, $location, $window, $http, $state, content) ->
  console.log "ContentShow"
  $scope.content = content.data
  console.log content
  $("#contentBody").html $scope.content.content
  window.scrollTo(0, 0)

