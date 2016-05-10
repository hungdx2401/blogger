materialAdmin.controller("listProductController", [ '$scope', '$http',
		'$state', 'growlService',
		function($scope, $http, $state, growlService) {

			$scope.listProduct = [];
			$scope.limit = 10;
			$scope.page = 1;

			loadListProduct($scope, $http);

			$scope.changePage = function(page) {
				$scope.page = page;
				loadListProduct($scope, $http);
			}

			$scope.deleteProduct = function(product) {
				$scope.action = "delete";
				var saveData = {
					"action" : $scope.action,
					"product" : product,
				};
				swal({
					title : "Are you sure want to delete?",
					text : "This action can't be undo!",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : true,
					confirmButtonText : "Delete",
					cancelButtonText : "Cancel"
				}, function() {
					var arequest = $http({
						method : "POST",
						url : "/admin/product/process",
						data : saveData
					});
					arequest.success(function(response) {
						$("#modalDefault").modal("hide");
						loadListProduct($scope, $http);
						growlService.growl('Action success!', 'success');
					});
					arequest.error(function(data, status, headers, config) {

					});
				});
			}

		} ]);

function loadListProduct($scope, $http) {
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
