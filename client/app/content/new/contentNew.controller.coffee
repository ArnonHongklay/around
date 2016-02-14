angular.module 'aroundThailandApp'
.controller 'ContentNewCtrl', ($scope, Auth, $location, $window, $http, $state) ->
  console.log "ContentNew"
  $scope.content = {content: "", image:{data:'',path:''} }
  $('select').material_select()
  $scope.previewContent = ->
    $('.body-preview').html $scope.content.content
    return

  $scope.saveContent = ->
    console.log($scope.content)
    return if $scope.content.content is ''
    $http.post('/api/contents', $scope.content).success (content) ->
      console.log(content)
      $state.go($state.current, {}, {reload: true})

  $scope.preview = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        console.log(e.target.result)
        $('#preview-img').attr 'src', e.target.result
        $scope.content.imageData = e.target.result
        $scope.content.imageType = input.files[0].type
        $scope.content.imageSize = input.files[0].size
        return

      reader.readAsDataURL input.files[0]

    return
