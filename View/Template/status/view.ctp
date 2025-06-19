<div class="panel panel-primary">
  <div class="panel-heading"><i class="fa fa-dot-circle-o"></i>VIEW</div>
  <div class="panel-body">
    <div class="row">


      <div class="col-md-12">
        <table class="table table-bordered table-striped table-hover">
          <thead>
            <tr>
              <th class="w30px text-center">#</th>
              <th class="text-center">NAME</th>
              <th class="w100px"></th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="datax in data.CrudStatus" ng-if="datax.visible == 1">
              <td class="t  ext-center">{{ $index + 1 }}</td>
              <td class="uppercase text-left">{{ datax.name }}</td>
            </tr>
          </tbody>
        </table>
        <div class="clearfix"></div>
        <div class="row">

          <hr>
        </div>
      </div>



    </div>
  </div>


  <style>
    .table-wrapper {
      width: 100%;
      height: 500px;
      overflow-y: auto;
    }
  </style>