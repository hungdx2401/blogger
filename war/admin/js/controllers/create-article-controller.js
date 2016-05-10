materialAdmin.controller("createArticleCtrl", [ '$scope', '$http', '$state',
		'growlService', function($scope, $http, $state, growlService) {

		} ]);

function createArticle($scope, $http) {
	var arequest = $http({
		method : "POST",
		url : "/_admin/articles"
	});
	arequest.success(function(response) {

	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
	});
}
