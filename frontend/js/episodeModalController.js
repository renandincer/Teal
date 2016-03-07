yellow.controller('episodeModalController', function ($scope, $location, $uibModalInstance,$log,  episode) {
  $scope.episode = episode;

  $scope.save = function () {
    $scope.episode.$save(function () {
      $uibModalInstance.close();
    });
  };

  $scope.delete = function () {
    $scope.episode.$remove(function () {
      $uibModalInstance.close();
      $location.path('/programs/' + $scope.episode.program_shortname);
    });
  };

  $scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
});