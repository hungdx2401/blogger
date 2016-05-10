materialAdmin.controller("listArticleCtrl", [ '$scope', '$http', '$state',
		'growlService', function($scope, $http, $state, growlService) {

			$scope.listProduct = [];
			$scope.limit = 10;
			$scope.page = 1;

		} ]);

function loadListArticle($scope, $http) {
	var arequest = $http({
		method : "GET",
		url : "/admin/product/process?page=" + $scope.page + "&limit="
				+ $scope.limit
	});
	arequest.success(function(response) {
		$scope.listProduct = response.listProduct;
		$scope.page = response.page;
		$scope.limit = response.limit;
		$scope.hasNextPage = response.hasNextPage;
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}
