<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.btn-icon-2 {
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
		<h2>Bài viết mới</h2>
	</div>

	<div class="card">

		<div class="card-body card-padding">
			<p class="c-black f-500 m-b-5">Tiêu đề</p>
			<div class="row">
				<div class="col-sm-8">
					<div class="form-group">
						<div class="fg-line">
							<input type="text" class="form-control" placeholder="" ng-model="obj.title">
						</div>
					</div>
				</div>
			</div>
			<p class="f-500 c-black m-b-20">Ảnh đại diện</p>
			<div class="row" ng-show="obj.photos.length>0">
				<div class="col-sm-6 col-md-3" ng-repeat="photo in obj.photos">
					<div class="thumbnail">
						<img ng-src="{{photo}}" alt="">
						<button class="btn btn-default btn-icon-2 waves-effect" ng-show="{{photo.length>0}}" ng-click="obj.photos.splice($index, 1)">
							<i class="md md-close"></i>
						</button>
					</div>
				</div>
			</div>
			<div id="fileuploader">Upload ảnh</div>
			<br> <br>
			<div class="row">
				<div class="col-sm-5 m-b-25">
					<p class="c-black f-500 m-b-5">Danh mục.</p>
					<div class="form-group">
						<div class="fg-line">
							<div class="select">
								<select class="form-control" ng-model="obj.categoryId">
									<option value="0">Vui lòng chọn</option>
									<option ng-repeat="category in listCategories" value="{{category.id}}">{{category.name}}</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-5 m-b-25">
					<p class="c-black f-500 m-b-5">Sự kiện</p>
					<div class="form-group">
						<div class="fg-line">
							<div class="select">
								<select class="form-control" ng-model="obj.eventId">
									<option value="0">Vui lòng chọn</option>
									<option ng-repeat="collection in listCollections" value="{{collection.id}}">{{collection.name}}</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<p class="c-black f-500 m-b-5">Mô tả</p>
			<div class="form-group">
				<div class="fg-line">
					<textarea class="form-control" rows="3" placeholder="" ng-model="obj.description"></textarea>
				</div>
			</div>
			<p class="f-500 c-black m-b-20">Nội dung</p>
			<div data-html-editor id="htmlEditor"></div>

			<br>
			<button type="button" class="btn btn-primary btn-sm m-t-10" ng-click="saveArticle()">Submit</button>
			<button type="reset" class="btn btn-default btn-sm m-t-10">Reset</button>
		</div>
	</div>
</div>
