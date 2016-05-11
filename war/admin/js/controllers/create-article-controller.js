materialAdmin.controller("createArticleCtrl", [
		'$scope',
		'$http',
		'$state',
		'growlService',
		'jsonApiWrapper',
		function($scope, $http, $state, growlService, jsonApiWrapper) {
			loadUploader($scope, $http);
			$scope.saveArticle = function() {
				$scope.article = {};
				$scope.article.content = $("#htmlEditor").code();
				$scope.article.title = "This is title";
				var requestData = jsonApiWrapper.wrap($scope.article,
						"Article", "this-is-id");
				requestData.included = []
				requestData.included.push(jsonApiWrapper.wrap($scope.article,
						"Brticle", "this-is-id-2").data);
				createArticle($scope, $http, requestData);
			}
		} ]);

function createArticle($scope, $http, requestData) {

	var arequest = $http({
		method : "POST",
		url : "/_admin/articles",
		data : angular.toJson(requestData)
	});
	arequest.success(function(response) {

	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}

function loadUploader($scope, $http) {
	if (!$scope.loadedUploader) {
		var arequest = $http({
			method : "GET",
			url : "/_blobstore/get-upload-url"
		});
		arequest.success(function(response) {
			var uploadObj = $('#fileuploader').uploadFile({
				url : response,
				fileName : 'logo',
				multiple : true,
				showStatusAfterSuccess : false,
				onSuccess : function(files, data, xhr) {
					$scope.photo = data;
					$scope.$apply(function() {
					});
				},
				onError : function(files, status, errMsg) {
					alert(JSON.stringify(errMsg));
				}
			});
			$scope.loadedUploader = true;
		});
		arequest.error(function(data, status, headers, config) {

		});

	}
}
