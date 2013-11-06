app = angular.module("Sneeze",[])

app.controller "mainCtrl", ($scope, Employees)->
  $scope.totalSneezes = 0
  $scope.sneezes = []
  $scope.pushupModifier = 10
  $scope.employees = Employees

  $scope.addSneeze = ()->
    count = parseInt($scope.sneezeCount)

    $scope.sneezes.push
      name:$scope.sneezeName
      count:count

    $scope.totalSneezes += count

  $scope.deleteSneeze = (whichSneeze)->
    $scope.totalSneezes = $scope.totalSneezes - whichSneeze.count
    index = $scope.sneezes.indexOf(whichSneeze)
    $scope.sneezes.splice(index,1)

app.directive "submitClear", ()->
  return {
    restrict:"A"
    link:(scope, el, attrs)->
      $el = $(el)
      $el.on "submit", ()->
        $el.find("input[type='text']").val('')
  }

app.factory "Employees", ()->
  return ["Andrew", "Ben", "Brian", "Eric", "Steve", "Rob", "Heather", "John", "Derek", "Roarke", "Zach"]