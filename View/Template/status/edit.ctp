<div>
  <div class="panel panel-primary">
    <div class="panel-heading"><i class="fa fa-dot-circle-o"></i> EDIT CRUD </div>
    <div class="panel-body">
      <div class="col-md-12">
        <form id="form">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Status<i class="required">*</i></label>
                <input type="text" class="form-control" ng-model="status.CrudStatus.name" data-validation-engine="validate[required]">
              </div>
            </div>

            <div class="clearfix"></div>
            <hr>

            <div class="clearfix"></div>
        </form>
      </div>
      <div class="row">
        <div class="col-md-3 pull-right">
          <button class="btn btn-primary btn-sm btn-block" ng-click="update()">UPDATE</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $('#form').validationEngine('attach');
</script>