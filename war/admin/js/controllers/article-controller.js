materialAdmin.controller("articleCtrl",
		[
				'$scope',
				'$http',
				'$location',
				'$state',
				'growlService',
				'jsonApiWrapper',
				function($scope, $http, $location, $state, growlService,
						jsonApiWrapper) {
					var idString = $location.search().id;
					if (angular.isDefined(idString) && idString.length > 0) {
						loadArticle($scope, $http, idString);
					} else {
						initialize($scope);
					}
					loadUploader($scope);
					$scope.clickSaveArticle = function() {
						$scope.obj.content = $("#htmlEditor").code();
						var requestData = jsonApiWrapper.wrap($scope.obj,
								"Article", "");
						saveArticle($scope, $http, requestData, growlService);
					}
				} ]);

function initialize($scope) {
	$scope.obj = {
		photos : []
	};
}

function loadArticle($scope, $http, idString) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/articles/" + idString
	});
	arequest.success(function(response) {
		$scope.obj = {};
		console.log(response);
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}

function saveArticle($scope, $http, requestData, growlService) {
	var arequest = $http({
		method : "POST",
		url : "/_admin/articles",
		data : angular.toJson(requestData)
	});
	arequest.success(function(response) {
		growlService.growl('Lưu bài viết thành công.', 'success');
		window.location.replace("/_admin#/article/list");
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}

function loadUploader($scope) {
	setTimeout(function() {
		var uploadObj = $('#fileuploader').uploadFile({
			fileName : 'logo',
			multiple : true,
			showStatusAfterSuccess : false,
			onSuccess : function(files, resp, xhr) {
				$scope.obj.photos.push(resp);
				$scope.$apply(function() {
				});
			},
			onError : function(files, status, errMsg) {
				alert(JSON.stringify(errMsg));
			}
		});
	}, 100);
}
