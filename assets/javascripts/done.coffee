app = angular.module("Sneezes", [])

app.controller "mainCtrl", ($scope, Employees)->
  $scope.sneezeTotal = 0
  $scope.sneezes = []
  $scope.pushupModifier = 10
  $scope.employees = Employees

  $scope.addSneeze = ()->
    sneezeCount = parseInt($scope.countInput)
    
    $scope.sneezes.push
      name:$scope.nameInput
      count:sneezeCount

    $scope.sneezeTotal += sneezeCount

app.directive "submitClear", ()->
  return {
    restrict:"A"
    link:(scope, el, attrs)->
      $(el).on "submit", ()->
        $(@).find('input').each ()->
          $(@).val("")
  }

app.factory "Employees", ()->
  return ["Andrew", "Ben", "Brian", "Eric", "Steve", "Rob", "Heather", "John", "Derek", "Roarke", "Zach"]