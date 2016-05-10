materialAdmin.controller("listArticleCtrl", [ '$scope', '$http', '$state',
		'growlService', function($scope, $http, $state, growlService) {

			$scope.listProduct = [];
			$scope.limit = 10;
			$scope.page = 1;

			loadListArticle($scope, $http)

		} ]);

function loadListArticle($scope, $http) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/articles"
	});
	arequest.success(function(response) {

	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}
