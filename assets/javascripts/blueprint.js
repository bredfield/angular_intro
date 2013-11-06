(function() {
  var app;

  app = angular.module("Sneeze", []);

  app.controller("mainCtrl", function($scope, Employees) {
    $scope.totalSneezes = 0;
    $scope.sneezes = [];
    $scope.pushupModifier = 10;
    $scope.employees = Employees;
    $scope.addSneeze = function() {
      var count;
      count = parseInt($scope.sneezeCount);
      $scope.sneezes.push({
        name: $scope.sneezeName,
        count: count
      });
      return $scope.totalSneezes += count;
    };
    return $scope.deleteSneeze = function(whichSneeze) {
      var index;
      $scope.totalSneezes = $scope.totalSneezes - whichSneeze.count;
      index = $scope.sneezes.indexOf(whichSneeze);
      return $scope.sneezes.splice(index, 1);
    };
  });

  app.directive("submitClear", function() {
    return {
      restrict: "A",
      link: function(scope, el, attrs) {
        var $el;
        $el = $(el);
        return $el.on("submit", function() {
          return $el.find("input[type='text']").val('');
        });
      }
    };
  });

  app.factory("Employees", function() {
    return ["Andrew", "Ben", "Brian", "Eric", "Steve", "Rob", "Heather", "John", "Derek", "Roarke", "Zach"];
  });

}).call(this);
