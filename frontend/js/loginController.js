yellow.controller('loginController', function (teal, $scope, $location, $uibModal, $route, $log, $http) {
  $scope.login = function (email) {
    $http({
      method: 'POST',
      url: teal + '/login',
      data: JSON.stringify({ "email": email }),
      headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
      }).then(function successCallback(response) {
          // this callback will be called asynchronously
          // when the response is available
          if (response.data == "Already logged in"){
            $location.path('/programs');
          } else {
            $scope.alerts = [{ type: 'success', msg: response.data},];
          }

          
        }, function errorCallback(response) {
          // called asynchronously if an error occurs
          // or server returns response with an error status.

          $scope.alerts = [
            { type: 'warning', msg: response.data || "Communication Failed"},
          ];
    });
  };

  $scope.checkifloggedin = function () {
    $http.get( teal + '/whoami').then(function successCallback(response) {
          // this callback will be called asynchronously
          // when the response is available
          $scope.email = response.data;
        }, function errorCallback(response) {
    });
  };


});