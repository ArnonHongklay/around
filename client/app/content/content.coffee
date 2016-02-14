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

  .state 'show',
    url: '/content/:id'
    templateUrl: 'app/content/show/show.html'
    controller: 'ContentShowCtrl'
    resolve:
      content: ($http, $stateParams) ->
        console.log $stateParams.id
        $http.get('/api/contents/'+$stateParams.id).success (content) ->
          content

