app.controller("CrudController", function ($scope, Crud) {
  // load data

  $scope.load = function (options) {
    options = typeof options !== "undefined" ? options : {};

    if ($scope.currentTab !== null) {
      options.condition = $scope.currentTab;
    }

    Crud.query(options, function (e) {
      if (e.ok) {
        $scope.cruds = e.data;
        $scope.paginator = e.paginator;
        $scope.pages = paginator($scope.paginator, 5);
      }
    });
  };

  $scope.setTab = function (item) {
    $scope.currentTab = item;
    $scope.load();
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

  // remove

  $scope.remove = function (data) {
    bootbox.confirm(
      "Are you sure you want to delete " + data.name + " ?",
      function (c) {
        if (c) {
          Crud.remove({ id: data.id }, function (e) {
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

app.controller("CrudAddController", function ($scope, Select, Upload) {
  $("#form").validationEngine("attach");

  Select.get({ code: "crud-status" }, function (e) {
    $scope.status = (e.data || []).filter(function (item) {
      return item.visible == 1;
    });
  });

  $(".datepicker").datepicker({
    format: "yyyy/mm/dd",

    autoclose: true,

    todayHighlight: true,
  });

  $scope.data = {
    Crud: {},
    Beneficiary: [],
  };

  $scope.ageCompute = function (date_value) {
    if (date_value) {
      birthDate = new Date(date_value);
      today = new Date();
      age = today.getFullYear() - birthDate.getFullYear();
      m = today.getMonth() - birthDate.getMonth();

      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }

      if (age >= 0) {
        $scope.data.Crud.age = age;
      } else {
        $.gritter.add({
          title: "Warning!",
        });
      }
    }
  };

  $scope.beneficiaryAgeCompute = function (date_value) {
    if (date_value) {
      const birthDate = new Date(date_value);
      const today = new Date();
      let age = today.getFullYear() - birthDate.getFullYear();
      const m = today.getMonth() - birthDate.getMonth();

      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }

      if (age >= 0) {
        $scope.adata.age = age;
      } else {
        $.gritter.add({
          title: "Warning!",
        });
      }
    }
  };

  $scope.getBeneficiary = function (id) {
    if ($scope.beneficiaries.length > 0) {
      $.each($scope.beneficiaries, function (key, val) {
        if (id == val.id) {
          $scope.adata.beneficiaries = val.value;
        }
      });
    }
  };

  $scope.addBeneficiary = function () {
    $("#add_beneficiary").validationEngine("attach");

    $scope.adata = {};

    $("#add-beneficiary-modal").modal("show");
  };

  $scope.saveBeneficiary = function (data) {
    valid = $("#add_beneficiary").validationEngine("validate");

    if (valid) {
      $scope.data.Beneficiary.push(data);
      $("#add-beneficiary-modal").modal("hide");
    }
  };

  $scope.editBeneficiary = function (index, data) {
    $("#edit_beneficiary").validationEngine("attach");

    data.index = index;

    $scope.adata = data;

    $("#edit-beneficiary-modal").modal("show");
  };

  $scope.updateBeneficiary = function (data, index) {
    valid = $("#edit_beneficiary").validationEngine("validate");

    if (valid) {
      $scope.data.Beneficiary[data.index] = data;

      $("#edit-beneficiary-modal").modal("hide");
    }
  };

  $scope.removeBeneficiary = function (data, index) {
    bootbox.confirm(
      "Are you sure you want to delete " + data.name + " ?",
      function (c) {
        if (c) {
          $scope.data.Beneficiary.splice(index, 1);
          $scope.$apply();
        }
      }
    );
  };

  $scope.save = function () {
    valid = $("#form").validationEngine("validate");
    emailRegex =
      /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

    if (!emailRegex.test($scope.data.Crud.email)) {
      $.gritter.add({
        title: "Invalid Email",
        text: "Please enter a valid email address.",
      });
      return;
    }

    if (valid) {
      Upload.upload({
        url: "/Training/cruds/add",
        data: {
          Crud: $scope.data.Crud,
          Beneficiary: $scope.data.Beneficiary,
          file: $scope.files,
        },
      }).then(function (resp) {
        var e = resp.data;
        if (e && e.ok) {
          $.gritter.add({
            title: "Successful!",
            text: e.msg,
          });
          window.location = "#/cruds";
        } else {
          $.gritter.add({
            title: "Warning!",
            text: (e && e.msg) || "An error occurred while saving.",
          });
        }
      });
    }
  };
});

app.controller(
  "CrudViewController",
  function ($scope, $routeParams, Crud, Select) {
    $(".datepicker").datepicker({
      format: "yyyy/mm/dd",

      autoclose: true,

      todayHighlight: true,
    });

    Select.get({ code: "conditions" }, function (e) {
      $scope.conditions = e.data;
    });

    $scope.id = $routeParams.id;

    $scope.load = function () {
      Crud.get({ id: $scope.id }, function (e) {
        $scope.data = e.data;
      });
    };

    $scope.load();

    //change the status or conditionsId
    $scope.setCondition = function (id) {
      bootbox.confirm(
        "Do you want to update the status to " +
          (id == 1 ? "Approved" : id == 2 ? "Disapproved" : "Pending") +
          " ?",
        function (c) {
          if (c) {
            $scope.data.Crud.conditionId = id;
            Crud.update(
              { id: $scope.data.Crud.id },
              { Crud: $scope.data.Crud },
              function (e) {
                if (e.ok) {
                  $.gritter.add({
                    title: "Successful!",

                    text: e.msg,
                  });

                  window.location = "#/cruds";
                }
              }
            );
          }
        }
      );
    };

    //disable the button when approve or disapprove
    $scope.disableButton = function () {
      return (
        $scope.data &&
        $scope.data.Crud &&
        ($scope.data.Crud.conditionId == 1 || $scope.data.Crud.conditionId == 2)
      );
    };

    $scope.enablePrint = function () {
      return (
        $scope.data && $scope.data.Crud && $scope.data.Crud.conditionId != 1
      );
    };

    $scope.confirmDownload = function (file) {
      bootbox.confirm(
        "Do you want to download " + file.file_name + "?",
        function (result) {
          if (result) {
            link = document.createElement("a");
            link.href = file.file_path;
            link.download = file.file_name;
            link.target = "_blank";
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
          }
        }
      );
    };

    // remove
    $scope.remove = function (data) {
      bootbox.confirm(
        "Are you sure you want to remove " + data.name + " ?",
        function (c) {
          if (c) {
            Crud.remove({ id: data.id }, function (e) {
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
  }
);

app.controller(
  "CrudEditController",
  function ($scope, $routeParams, Crud, Select, Upload) {
    Select.get({ code: "crud-status" }, function (e) {
      $scope.status = e.data;
    });

    $scope.data = {
      Crud: {},
      Beneficiary: [],
    };

    $(".datepicker").datepicker({
      format: "yyyy/mm/dd",

      autoclose: true,

      todayHighlight: true,
    });

    $scope.id = $routeParams.id;

    $("#form").validationEngine("attach");

    // load

    $scope.load = function () {
      Crud.get({ id: $scope.id }, function (e) {
        $scope.data = e.data;
      });
    };

    $scope.load();

    $scope.ageCompute = function (date_value) {
      if (date_value) {
        const birthDate = new Date(date_value);
        const today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        const m = today.getMonth() - birthDate.getMonth();

        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
          age--;
        }

        if (age >= 0) {
          $scope.data.Crud.age = age;
        } else {
          $.gritter.add({
            title: "Warning!",
          });
        }
      }
    };

    $scope.beneficiaryAgeCompute = function (date_value) {
      if (date_value) {
        const birthDate = new Date(date_value);
        const today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        const m = today.getMonth() - birthDate.getMonth();

        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
          age--;
        }

        if (age >= 0) {
          $scope.adata.age = age;
        } else {
          $.gritter.add({
            title: "Warning!",
          });
        }
      }
    };

    $scope.getBeneficiary = function (id) {
      if ($scope.beneficiaries.length > 0) {
        $.each($scope.beneficiaries, function (key, val) {
          if (id == val.id) {
            $scope.adata.beneficiaries = val.value;
          }
        });
      }
    };

    $scope.putIndex = function () {
      if ($scope.data.Beneficiary.length > 0) {
        index = 0;

        $.each($scope.data.Beneficiary, function (key, val) {
          if (val.visible != 0) {
            index += 1;

            $scope.data.Beneficiary[key].index = index;
          }
        });
      }
    };

    $scope.putIndexFile = function () {
      if ($scope.data.CrudFile.length > 0) {
        index = 0;

        $.each($scope.data.CrudFile, function (key, val) {
          if (val.visible != 0) {
            index += 1;

            $scope.data.CrudFile[key].index = index;
          }
        });
      }
    };

    $scope.addBeneficiary = function () {
      $("#add_beneficiary").validationEngine("attach");

      $scope.adata = {};

      $("#add-beneficiary-modal").modal("show");
    };
    //di ako gumawa neto
    $scope.saveBeneficiary = function (data) {
      var valid = $("#add_beneficiary").validationEngine("validate");

      if (valid) {
        $scope.data = $scope.data || {};
        $scope.data.Beneficiary = $scope.data.Beneficiary || [];

        $scope.data.Beneficiary.push(data);

        $("#add-beneficiary-modal").modal("hide");
      }
    };

    $scope.editBeneficiary = function (index, data) {
      $("#edit_beneficiary").validationEngine("attach");

      data.index = index;

      $scope.adata = data;

      $("#edit-beneficiary-modal").modal("show");
    };

    $scope.updateBeneficiary = function (data, index) {
      valid = $("#edit_beneficiary").validationEngine("validate");

      if (valid) {
        $scope.data.Beneficiary[data.index] = data;

        $scope.putIndex();
        $("#edit-beneficiary-modal").modal("hide");
      }
    };

    $scope.removeBeneficiary = function (data, index) {
      bootbox.confirm(
        "Are you sure you want to delete " + data.name + " ?",
        function (c) {
          if (c) {
            $scope.data.Beneficiary[index].visible = 0;

            $scope.putIndex();
            $scope.$apply();
          }
        }
      );
    };

    $scope.removeFile = function (file) {
      bootbox.confirm(
        "Are you sure you want to delete " + file.file_name + " ?",
        function (c) {
          if (c) {
            idx = $scope.data.CrudFile.indexOf(file);
            if (idx !== -1) {
              $scope.data.CrudFile[idx].visible = 0;

              $scope.putIndexFile();
              $scope.$apply();
            }
          }
        }
      );
    };

    $scope.update = function () {
      valid = $("#form").validationEngine("validate");

      if (valid) {
        Upload.upload({
          url: "/Training/cruds/edit",
          data: {
            Crud: $scope.data.Crud,
            Beneficiary: $scope.data.Beneficiary,
            CrudFile: $scope.data.CrudFile,
            file: $scope.files,
          },
        }).then(function (resp) {
          var e = resp.data;
          if (e && e.ok) {
            $.gritter.add({
              title: "Successful!",
              text: e.msg,
            });
            window.location = "#/cruds";
          } else {
            $.gritter.add({
              title: "Warning!",
              text: (e && e.msg) || "An error occurred while saving.",
            });
          }
        });

        // Crud.update({ id: $scope.id }, $scope.data, function (e) {
        //   if (e.ok) {
        //     $.gritter.add({
        //       title: "Successful!",

        //       text: e.msg,
        //     });

        //     window.location = "#/cruds";
        //   } else {
        //     $.gritter.add({
        //       title: "Warning!",

        //       text: e.msg,
        //     });
        //   }
        // });
      }
    };
  }
);
