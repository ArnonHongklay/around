'use strict'

angular.module 'aroundThailandApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'content',
    url: '/content'
    templateUrl: 'app/content/content.html'
    controller: 'ContentCtrl'

  .state 'new',
    url: '/content/new'
    templateUrl: 'app/content/new/new.html'
    controller: 'ContentNewCtrl'

'use strict'

angular.module 'aroundThailandApp'
.controller 'ContentCtrl', ($scope, Auth, $location, $window) ->
  console.log "ContentCtrl"
