<div class="panel panel-primary">
    <div class="panel-heading"><i class="fa fa-dot-circle-o"></i> CRUDS </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-3">
                <a href="#/crud/add" class="btn btn-primary btn-sm btn-block"><i class="fa fa-plus"></i> ADD </a>
            </div>

            <div class="col-md-4 pull-right">
                <input type="text" class="form-control search" placeholder="SEARCH NAME HERE" ng-model="strSearch" ng-enter="search(strSearch)">
                <sup style="font-size:10px;color:gray">Press Enter to search</sup>
            </div>

            <div class="clearfix"></div>

            <ul class="nav nav-tabs">
                <li ng-class="{active : currentTab == null}"> <a href="" ng-click="setTab(null)">ALL</a></li>
                <li ng-class="{active : currentTab == 1}"> <a href="" ng-click="setTab(1)">APPROVED</a></li>
                <li ng-class="{active : currentTab == 2}"> <a href="" ng-click="setTab(2)">DISAPPROVED</a></li>
                <li ng-class="{active : currentTab == 3}"> <a href="" ng-click="setTab(3)">PENDING</a></li>
            </ul>
        </div>

        <table class="table table-bordered center">
            <thead>
                <tr>
                    <th class="w30px">#</th>
                    <th>NAME</th>
                    <th>STATUS</th>
                    <th class="w150px"></th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="data in cruds">
                    <td class="text-center">{{ (paginator.page - 1) * paginator.limit + $index + 1}}</td>
                    <td>{{data.name}}</td>
                    <td ng-class="{'success' : data.condition == 1, 'danger' : data.condition == 2, 'warning' : data.condition == 3 || data.condition == NULL}">
                        {{data.condition == 1 ? 'APPROVED' : data.condition == 2 ? 'DISAPPROVED' : 'PENDING'}}
                    </td>
                    <td>
                        <div class="btn-group btn-group-xs">
                            <a href="#/crud/view/{{ data.id }}" class="btn btn-success" title="VIEW"><i class="fa fa-eye"></i></a>
                            <a href="#/crud/edit/{{ data.id }}" class="btn btn-primary" title="EDIT" ng-class="{'disabled' : data.condition == 1 || data.condition == 2 }"><i class="fa fa-edit"></i></a>
                            <a href="javascript:void(0)" ng-click="remove(data)" class="btn btn-danger" title="DELETE" ng-class="{'disabled' : data.condition == 1 || data.condition == 2 }"><i class="fa fa-trash"></i></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div>
            <a href="/Training/print/print_all?tab={{currentTab}}&search={{strSearch}}&page={{paginator.page}}" target="_blank" class="btn btn-danger">
                <i class="fa fa-file-pdf-o"></i> Print All
            </a>
        </div>

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