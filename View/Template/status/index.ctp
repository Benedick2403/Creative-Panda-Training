<div class="panel panel-primary">
    <div class="panel-heading"><i class="fa fa-dot-circle-o"></i> STATUS </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-4 pull-right">
                <input type="text" class="form-control search" placeholder="SEARCH HERE" ng-model="strSearch" ng-enter="search(strSearch)">
                <sup style="font-size:10px;color:gray">Press Enter to search</sup>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-3">
                <a href="#/status/add" class="btn btn-primary btn-sm btn-block"><i class="fa fa-plus"></i> ADD STATUS </a>
            </div>

            <div class="clearfix"></div>
        </div>


        <hr>

        <table class="table table-bordered center">
            <thead>
                <tr>
                    <th class="w30px">#</th>
                    <th>Status</th>
                    <th class="w100px"></th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="data in status | filter:{visible:1}">
                    <td class="text-center"> {{ $index + 1}}</td>
                    <td>{{data.name}}</td>
                    <td>
                        <div class="btn-group btn-group-xs">
                            <a href="#/status/edit/{{ data.id }}" class="btn btn-primary" title="EDIT" ><i class="fa fa-edit"></i></a>
                            <a href="javascript:void(0)" ng-click="remove(data)" class="btn btn-danger" title="DELETE" ><i class="fa fa-trash"></i></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>


        <ul class="pagination pull-right">
            <li class="pagination-page">
                <a href="javascript:void(0)" ng-click="load({ page: 1, search: searchTxt })"><sub>&laquo;&laquo;</sub></a>
            </li>
            <li class="prevPage {{ !paginator.prevPage? 'disabled':'' }}">
                <a href="javascript:void(0)" ng-click="load({ page: paginator.page - 1, search: searchTxt })">&laquo;</a>
            </li>
            <li ng-repeat="page in pages" class="pagination-page {{ paginator.page == page.number ? 'active':''}}">
                <a href="javascript:void(0)" class="text-center" ng-click="load({ page: page.number, search: searchTxt })">{{ page.number }}</a>
            </li>
            <li class="nextPage {{ !paginator.nextPage? 'disabled':'' }}">
                <a href="javascript:void(0)" ng-click="load({ page: paginator.page + 1, search: searchTxt })">&raquo;</a>
            </li>
            <li class="pagination-page">
                <a href="javascript:void(0)" ng-click="load({ page: paginator.pageCount, search: searchTxt })"><sub>&raquo;&raquo;</sub> </a>
            </li>
        </ul>

        <div class="clearfix"></div>
    </div>
</div>