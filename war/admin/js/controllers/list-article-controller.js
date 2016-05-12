materialAdmin.controller("listArticleCtrl", [ '$scope', '$http', '$state',
		'growlService', function($scope, $http, $state, growlService) {
			$scope.limit = 10;
			$scope.page = 1;
			loadListArticle($scope, $http)

			$scope.changePage = function(page) {
				$scope.page = page;
				loadListArticle($scope, $http);
			}
		} ]);

function loadListArticle($scope, $http) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/articles?page=" + $scope.page + "&limit=" + $scope.limit
	});
	arequest.success(function(response) {
		$scope.listArticle = response.data;
		$scope.limit = response.meta.limit;
		$scope.page = response.meta.page;
		$scope.totalPage = response.meta.totalPage;
		$scope.totalItem = response.meta.totalItem;
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}
