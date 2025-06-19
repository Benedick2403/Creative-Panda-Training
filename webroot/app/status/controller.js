app.controller("StatusController", function ($scope, Select, Status) {


  $scope.load = function (options) {
    options = options || {};

    Status.query(options, function (e) {
      if (e.ok) {
        $scope.status = e.data; // This is your table data
        $scope.paginator = e.paginator;
        $scope.pages = paginator($scope.paginator, 5);
      }
    });
  };
  $scope.load();

  $scope.search = function (search) {
    search = typeof search !== "undefined" ? search : "";

    if (search.length > 0) {
      $scope.load({
        search: search,
      });
    } else {
      $scope.load();
    }
  };

  $scope.remove = function (data) {
    bootbox.confirm(
      "Are you sure you want to delete " + data.name + " ?",
      function (c) {
        if (c) {
          Status.remove({ id: data.id }, function (e) {
            if (e.ok) {
              $.gritter.add({
                title: "Successful!",

                text: e.msg,
              });
              $scope.load();
            }
          });
        }
      }
    );
  };
});

app.controller("StatusAddController", function ($scope, Status) {
  $("#form").validationEngine("attach");

  $scope.data = {
    Crud: {},
    Beneficiary: [],
  };

  $scope.save = function () {
    valid = $("#form").validationEngine("validate");

    if (valid) {
      Status.save($scope.data, function (e) {
        if (e.ok) {
          $.gritter.add({
            title: "Successful!",

            text: e.msg,
          });

          window.location = "#/status";
        } else {
          $.gritter.add({
            title: "Warning!",

            text: e.msg,
          });
        }
      });
    }
  };
});

app.controller("StatusViewController", function ($scope, $routeParams, Status) {
  $scope.data = {
    CrudStatus: [],
  };

  $scope.id = $routeParams.id;

  $scope.load = function () {
    Status.query(function (res) {
      if (res && res.data) {
        $scope.data.CrudStatus = res.data;
      }
    });
  };

  $scope.load();

  // remove
  $scope.remove = function (data) {
    bootbox.confirm(
      "Are you sure you want to remove " + data.name + " ?",
      function (c) {
        if (c) {
          Status.remove({ id: data.id }, function (e) {
            if (e.ok) {
              $.gritter.add({
                title: "Successful!",

                text: e.msg,
              });

              window.location = "#/cruds";
            }
          });
        }
      }
    );
  };
});

app.controller("StatusEditController", function ($scope, $routeParams, Status) {
  $scope.status = {};

  $scope.id = $routeParams.id;

  $scope.load = function () {
    Status.get({ id: $scope.id }, function (e) {
      if (e && e.data) {
        $scope.status = e.data;
      }
    });
  };

  $scope.load();

  $("#form").validationEngine("attach");

  $scope.update = function () {
    valid = $("#form").validationEngine("validate");

    if (valid) {
      Status.update({ id: $scope.id }, $scope.status, function (e) {
        if (e.ok) {
          $.gritter.add({
            title: "Successful!",
            text: e.msg,
          });
          window.location = "#/status";
        } else {
          $.gritter.add({
            title: "Warning!",
            text: e.msg,
          });
        }
      });
    }
  };
});
