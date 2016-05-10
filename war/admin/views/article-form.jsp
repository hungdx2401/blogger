<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btn-icon-2{
		border-radius: 50%;
		width: 40px;
		height: 40px;
		padding: 0px;
		text-align: center;
		position: absolute;
		top: -5px;
		left: 185px;
	}
</style>
<div class="container">
    <div class="block-header">
        <h2>Tạo mới sản phẩm</h2>       
    </div>

    <div class="card">
        <div class="card-header">
            <h2>Điền thông tin sản phẩm vào form bên dưới.</h2>
        </div>

        <div class="card-body card-padding">
        	<p class="c-black f-500 m-b-5">Tên sản phẩm.</p>           	
           	<div class="row">
           		<div class="col-sm-8">
                    <div class="form-group">
                        <div class="fg-line">
                            <input type="text" class="form-control" placeholder="" ng-model="product.name">
                        </div>
                    </div>
                </div>
           	</div>         
           	<p class="c-black f-500 m-b-5">Mô tả sản phẩm.</p>     	
           	<div class="form-group">
                <div class="fg-line">
                    <textarea class="form-control" rows="5" placeholder="" ng-model="product.description"></textarea>
                </div>
            </div>
            <p class="f-500 c-black m-b-20">Ảnh sản phẩm</p>
            <div class="row" ng-show="product.listPhoto.length>0">
            
            	<div class="col-sm-6 col-md-3" ng-repeat="photo in product.listPhoto">
                    <div class="thumbnail">
                        <img ng-src="{{photo}}" alt="">
                        <button class="btn btn-default btn-icon-2 waves-effect" ng-show="{{photo.length>0}}" ng-click="product.listPhoto.splice($index, 1)">
                        	<i class="md md-close"></i>
                       	</button>
                    </div>
                </div>                                         
            </div>
            <div id="fileuploader">Upload Image</div>
            
           	<br><br>
           	<div class="row">
           		<div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Giá nhập (VND).</p>                    
                    <div class="form-group">
                        <div class="fg-line">
                            <input type="text" class="form-control" placeholder="" ng-model="product.buyPrice">
                        </div>
                    </div>
                </div>    
                <div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Giá bán (VND).</p>
                    <div class="form-group">
                        <div class="fg-line">
                            <input type="text" class="form-control" ng-model="product.unitPrice">
                        </div>
                    </div>
                </div> 
           	</div> 
           	
           	<div class="row">
           		<div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Số lượng.</p>                    
                    <div class="form-group">
                        <div class="fg-line">
                            <input type="text" class="form-control" ng-model="product.stockQuantity">
                        </div>
                    </div>
                </div>                    
           	</div> 
           	       	
            <div class="row">
            	<div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Danh mục.</p>
                   	<div class="form-group">
                        <div class="fg-line">
                            <div class="select">
                                <select class="form-control" ng-model="product.categoryId">
                                    <option value="0">Vui lòng chọn</option>
                                    <option ng-repeat="category in listCategories" value="{{category.id}}">{{category.name}}</option>
                                </select>
                            </div>
                        </div>
                    </div>                    
                </div>    
                <div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Bộ sưu tập.</p>
                    <div class="form-group">
                        <div class="fg-line">
                            <div class="select">
                                <select class="form-control" ng-model="product.collectionId">
                                    <option value="0">Vui lòng chọn</option>
                                    <option ng-repeat="collection in listCollections" value="{{collection.id}}">{{collection.name}}</option>
                                </select>
                            </div>
                        </div>
                    </div>                      
                </div>            	
            </div>       
            <br>       
            <div class="row">
            	<div class="col-sm-5 m-b-25">
                    <p class="c-black f-500 m-b-5">Nhà cung cấp.</p>
                    <div class="form-group">
                        <div class="fg-line">
                            <div class="select">
                                <select class="form-control" ng-model="product.supplierId">
                                    <option value="0">Vui lòng chọn</option>
                                    <option ng-repeat="supplier in listSuppliers" value="{{supplier.id}}">{{supplier.name}}</option>
                                </select>
                            </div>
                        </div>
                    </div>                     
                </div>                             
            </div>  
            <br>
            
            <p class="f-500 c-black m-b-20">Chi tiết sản phẩm.</p>
            <div data-html-editor id="htmlEditor"></div>            
            
            <br>
            <button type="button" class="btn btn-primary btn-sm m-t-10" ng-click="saveProduct()" >Submit</button>
            <button type="reset" class="btn btn-default btn-sm m-t-10">Reset</button>                      
        </div>
    </div>       
</div>
