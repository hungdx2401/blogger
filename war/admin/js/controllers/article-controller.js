materialAdmin.controller("articleCtrl", [ '$scope', '$http', '$location',
		'$state', 'growlService',
		function($scope, $http, $location, $state, growlService) {
			var idString = $location.search().id;
			$scope.action = 1;
			if (angular.isDefined(idString) && idString.length > 0) {
				loadArticle($scope, $http, growlService, idString);
			} else {
				$scope.obj = {
					attributes : {
						photos : []
					}
				};
				$scope.action = 1;
			}
			loadUploader($scope);
			$scope.clickSaveArticle = function() {
				$scope.obj.attributes.content = $("#htmlEditor").code();
				saveArticle($scope, $http, growlService);
			}
		} ]);

function loadArticle($scope, $http, growlService, idString) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/articles/" + idString
	});
	arequest
			.success(function(response) {
				if (angular.isDefined(response)
						&& angular.isDefined(response.data)) {
					$scope.obj = response.data;
					$("#htmlEditor").code($scope.obj.attributes.content);
					$scope.action = 2;
				} else {
					$scope.action = 1;
					growlService.growl('Không tìm thấy thông tin bài viết.',
							'warning');
					setTimeout(function() {
						window.location.replace("/_admin#/article/list");
					}, 2 * 1000);
				}
			});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		$scope.action = 1;
		growlService.growl('Không thể lấy thông tin bài viết.', 'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/article/list");
		}, 2 * 1000);
	});
}

function saveArticle($scope, $http, growlService) {
	$scope.obj.type = "Article";
	var method = "POST";
	if ($scope.action == 2) {
		method = "PUT";
	}
	var requestData = {
		data : $scope.obj
	}
	var arequest = $http({
		method : method,
		url : "/_admin/articles",
		data : angular.toJson(requestData)
	});
	arequest.success(function(response) {
		$scope.obj.id = response.data.id;
		$scope.action = 2;
		growlService.growl('Lưu bài viết thành công.', 'success');
	});
	arequest
			.error(function(data, status, headers, config) {
				growlService.growl(
						'Xảy ra lỗi trong quá trình lưu thông tin bài viết.',
						'danger');
				setTimeout(function() {
					window.location.replace("/_admin#/article/list");
				}, 2 * 1000);
			});
}

function loadUploader($scope) {
	setTimeout(function() {
		var uploadObj = $('#fileuploader').uploadFile({
			fileName : 'logo',
			multiple : true,
			showStatusAfterSuccess : false,
			onSuccess : function(files, resp, xhr) {
				$scope.obj.attributes.photos.push(resp);
				$scope.$apply(function() {
				});
			},
			onError : function(files, status, errMsg) {
				console.log(JSON.stringify(errMsg));
			}
		});
	}, 100);
}
