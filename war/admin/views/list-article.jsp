<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <div class="block-header">
        <h2>Quản lý Sản phẩm &nbsp;<button class="btn btn-default btn-icon" data-ui-sref="product.create" data-ng-click="mactrl.sidebarStat($event)"><i class="md md-add"></i></button></h2>        
    </div>

    <div class="card" ng-show="listProduct.length>0">
        <div class="card-header">
            <span>
            	<h2>Danh sách danh mục sản phẩm.</h2>
            	
            </span>
        </div>

        <table class="table table-striped table-vmiddle">
            <thead>
                <tr>
                	<th>STT</th>
                	<th>Ảnh đại diện</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Ngày cập nhật</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="product in listProduct">
                	<td>{{((page-1)*limit + 1) + $index}}</td>
                	<td>
                		<div class="col-xs-6 col-md-3">                    
	                		<a class="thumbnail" href="#/product/edit?id={{product.id}}">
	                        	<img alt="" ng-src="{{product.listPhoto[0]}}">
	                    	</a>
                    	</div>
                    </td>
                    <td>{{product.name}}</td>
                    <td>{{product.stockQuantity}}</td>
                    <td>{{product.updated | date:'dd/MM/yyyy HH:mm'}}</td>
                    <td>
                    	<a href="#/product/edit?id={{product.id}}"><button class="btn btn-icon command-edit" type="button"><span class="md md-edit"></span></button></a>
                    	<a href=""><button class="btn btn-icon command-delete" type="button" ng-click="deleteProduct(product)"><span class="md md-delete"></span></button></a>
                    </td>
                </tr>                    
            </tbody>
        </table>
        <div id="undefined-footer" class="bootgrid-footer container-fluid">
        	<div class="row">
        		<div class="col-sm-6">
        			<ul class="pagination" ng-show="listProduct.length>0">        				
        				<li class="prev {{page>1?'':'disabled'}}" ng-click="changePage(page-1)"><a href="#prev" class="button"><i class="md md-chevron-left"></i></a></li>
        				<li class="page-1 disabled active"><a href="#1" class="button">{{page}}</a></li>
        				<li class="next {{hasNextPage?'':'disabled'}}" ng-click="changePage(page+1)"><a href="#next" class="button"><i class="md md-chevron-right"></i></a></li>        				
       				</ul></div><div class="col-sm-6 infoBar">
       				<div class="infos">Hiển thị từ {{((page-1)*limit + 1)}} đến {{(page-1)*limit + listProduct.length}}</div>
        		</div>
        	</div>
       	</div>
    </div>
    
     <div class="card" ng-show="listProduct.length==0">
        <div class="card-header">
            <span>
            	<h2><small>Hiện tại hệ thống không có sản phẩm nào. Vui lòng <a href="" data-ui-sref="product.create" data-ng-click="mactrl.sidebarStat($event)">tạo mới</a></small></h2>            	
            </span>
        </div>
     </div>            
  
</div>