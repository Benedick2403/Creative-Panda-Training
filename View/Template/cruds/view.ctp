<div class="panel panel-primary">
  <div class="panel-heading"><i class="fa fa-dot-circle-o"></i>VIEW</div>
  <div class="panel-body">
    <div class="row">
      <div class="col-md-6">
        <dl class="dl-horizontal dl-data dl-bordered">
          <dt>Name:</dt>
          <dd class="uppercase">{{ data.Crud.name }}</dd>

          <dt>Age:</dt>
          <dd>{{ data.Crud.age }}</dd>

          <dt>Birthday:</dt>
          <dd>{{ data.Crud.birthdate | date : m/d/y }}</dd>

          <dt>Role:</dt>
          <dd>{{ data.CrudStatus.name }}</dd>

          <dt>Character:</dt>
          <dd>{{ data.Crud.charac }}</dd>

        </dl>
      </div>

      <div class="col-md-6">
        <label>Uploaded Files</label>
        <ul class="list-group">
          <li class="list-group-item" ng-repeat="file in data.CrudFile" ng-if="file.visible != 0">
            <a href="{{file.file_path}}" target="_blank">{{ file.file_name }}</a>
            <a ng-click="confirmDownload(file)" class="file-name pull-right" style="cursor:pointer;">
              <i class="fa fa-download"></i>
            </a>
          </li>
          <li class="list-group-item text-center" ng-if="data.CrudFile.length <= 0">
            No file uploaded
          </li>
        </ul>
      </div>

      <div class="col-md-12">
        <table class="table table-bordered table-striped table-hover">
          <thead>
            <tr>
              <th class="w30px text-center">#</th>
              <th class="text-center">NAME</th>
              <th class="text-center">BIRTHDATE</th>
              <th class="text-center">AGE</th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="datax in data.Beneficiary" ng-if="datax.visible == 1">
              <td class="text-center">{{ $index + 1 }}</td>
              <td class="uppercase text-left">{{ datax.name }}</td>
              <td class="text-center">{{ datax.birthdate}}</td>
              <td class="text-center">{{ datax.age}}</td>
            </tr>
            <tr ng-if="data.Beneficiary == ''">
              <td colspan="6" class="text-center">No data available</td>
            </tr>
          </tbody>
        </table>
        <div class="btn-group pull-right" role="group">
          <button type="button" class="btn"
            ng-class="{'btn-success': data.Crud.conditionId == 1, 'btn-default': data.Crud.conditionId != 1}"
            ng-click="setCondition(1)">
            Approved
          </button>


          <button type="button" class="btn"
            ng-class="{'btn-danger': data.Crud.conditionId == 2, 'btn-default': data.Crud.conditionId != 2}"
            ng-click="setCondition(2)">
            Disapproved
          </button>

          <button type="button" class="btn"
            ng-class="{'btn-warning': data.Crud.conditionId == 3, 'btn-default': data.Crud.conditionId != 3}"
            ng-click="setCondition(3)">
            Pending
          </button>
        </div>

        <div>
          <a href="/Training/print/print_one/{{ data.Crud.id }}" target="_blank" class="btn btn-danger" ng-disabled="enablePrint()">
            <i class="fa fa-file-pdf-o"></i> Print
          </a>
        </div>
        <div class="clearfix"></div>
        <div class="row">

          <hr>


          <div class="col-md-12">
            <div class="btn-group btn-group-sm pull-right btn-min">
              <a href="#/crud/edit/{{ data.Crud.id }}" class="btn btn-primary btn-min" ng-disabled="disableButton()"><i class="fa fa-edit"></i> EDIT</a>
              <button class="btn btn-danger btn-min" ng-click="remove(data.Crud)" ng-disabled="disableButton()"><i class="fa fa-trash"></i> DELETE</button>
            </div>
          </div>
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