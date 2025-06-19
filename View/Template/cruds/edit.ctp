<div>
  <div class="panel panel-primary">
    <div class="panel-heading"><i class="fa fa-dot-circle-o"></i> EDIT CRUD </div>
    <div class="panel-body">
      <div class="col-md-12">
        <form id="form" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Name<i class="required">*</i></label>
                <input type="text" class="form-control" ng-model="data.Crud.name" data-validation-engine="validate[required]">
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Birthday <i class="required">*</i></label>
                <input type="text" class="form-control datepicker" ng-model="data.Crud.birthdate" ng-change="ageCompute(data.Crud.birthdate)" data-validation-engine="validate[required]" placeholder="yyyy/mm/dd">
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Age <i class="required">*</i></label>
                <input type="text" number class="form-control" ng-model="data.Crud.age" readonly data-validation-engine="validate[required]">
              </div>
            </div>


            <div class="col-md-6">
              <div class="form-group">
                <label>Status <i class="required">*</i></label>
                <select class="form-control" ng-model="data.Crud.crudStatusID" ng-options="opt.id as opt.value for opt in status" data-validation-engine="validate[required]">
                  <option value=""></option>
                </select>
              </div>
            </div>


            <div class="col-md-12">
              <div class="form-group">
                <label>Character <i class="required">*</i></label>
                <textarea type="text" class="form-control" ng-model="data.Crud.charac" data-validation-engine="validate[required]"></textarea>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Add New File</label>
                <input type="file" ngf-select ng-model="files" name="file" multiple class="form-control" />
              </div>
            </div>

            <div class="col-md-6">
              <label>Uploaded Files</label>
              <ul class="list-group">
                <li class="list-group-item" ng-repeat="file in data.CrudFile" ng-if="file.visible != 0">
                  <a ng-href="{{file.file_path}}" target="_blank" download="{{ file.file_name }}" class="file-name">{{ file.file_name }}</a>
                  <div class="btn-group btn-group-xs pull-right">
                    <a href="javascript:void(0)" ng-click="removeFile(file)" class="btn btn-danger" title="DELETE">
                      <i class="fa fa-trash"></i>
                    </a>
                  </div>
                </li>
                <li class="list-group-item text-center" ng-if="data.CrudFile == ''">
                  No file uploaded
                </li>
              </ul>
            </div>

            <div class="clearfix"></div>
            <hr>

            <div class="col-md-3 pull-left">
              <a class="btn btn-warning btn-sm btn-block" id="save" ng-click="addBeneficiary()">ADD BENEFICIARY</a><br />
            </div>

            <div class="clearfix"></div>

            <div class="col-md-12">
              <table class="table table-bordered table-striped table-hover">
                <thead>
                  <tr>
                    <th class="w30px text-center">#</th>
                    <th class="text-center">NAME</th>
                    <th class="text-center">BIRTHDATE</th>
                    <th class="text-center">AGE</th>
                    <th class="w100px"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr ng-repeat="datax in data.Beneficiary" ng-if="datax.visible != 0">
                    <td class="text-center">{{ $index + 1}}</td>
                    <td class="text-left">{{ datax.name }}</td>
                    <td class="text-center">{{ datax.birthdate}}</td>
                    <td class="text-center">{{ datax.age }}</td>
                    <td class="text-center">
                      <div class="btn-group btn-group-xs">
                        <a href="javascript:void(0)" ng-click="editBeneficiary($index,datax)" class="btn btn-success" title="EDIT"><i class="fa fa-edit"></i></a>
                        <a href="javascript:void(0)" ng-click="removeBeneficiary(datax, $index)" class="btn btn-danger" title="DELETE"><i class="fa fa-trash"></i></a>
                      </div>
                    </td>
                  </tr>
                </tbody>
                <tbody ng-if="data.Beneficiary.visible == 0 || data.Beneficiary == ''">
                  <td colspan="6" class="text-center">No data available</td>
                </tbody>
              </table>
            </div>
        </form>
        <div class="clearfix"></div>
        <hr>

        <div class="modal fade" id="add-beneficiary-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">ADD BENEFICIARY </h4>
              </div>
              <div class="modal-body">
                <form id="add_beneficiary">

                  <div class="col-md-12">
                    <div class="form-group">
                      <label>NAME<i class="required">*</i></label>
                      <input class="form-control" type="text" ng-model="adata.name">
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <label> BIRTHDATE <i class="required">*</i></label>
                      <input type="text" class="form-control datepicker" ng-model="adata.birthdate" data-validation-engine="validate[required]" ng-change="beneficiaryAgeCompute(adata.birthdate)">
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <label>AGE<i class="required">*</i></label>
                      <input type="text" class="form-control" readonly ng-model="adata.age" data-validation-engine="validate[required]">
                    </div>
                  </div>

                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-min" data-dismiss="modal">CANCEL</button>
                <button type="button" class="btn btn-primary btn-sm btn-min" ng-click="saveBeneficiary(adata)">SAVE</button>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="edit-beneficiary-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">EDIT BENEFICIARY </h4>
              </div>
              <div class="modal-body">
                <form id="edit_beneficiary">

                  <div class="col-md-12">
                    <div class="form-group">
                      <label>NAME<i class="required">*</i></label>
                      <input type="text" class="form-control" ng-model="adata.name" data-validation-engine="validate[required]">
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <label> BIRTHDATE <i class="required">*</i></label>
                      <input type="text" class="form-control datepicker" ng-model="adata.birthdate" data-validation-engine="validate[required]" ng-change="beneficiaryAgeCompute(adata.birthdate)">
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>AGE<i class="required">*</i></label>
                      <input type="text" class="form-control" number readonly ng-model="adata.age" readonly data-validation-engine="validate[required]"></textarea>
                    </div>
                  </div>

                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-min" data-dismiss="modal">CANCEL</button>
                <button type="button" class="btn btn-primary btn-sm btn-min" ng-click="updateBeneficiary(adata)">SAVE</button>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-3 pull-right">
            <button class="btn btn-primary btn-sm btn-block" ng-click="update()">UPDATE</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $('#form').validationEngine('attach');
</script>