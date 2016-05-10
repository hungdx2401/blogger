materialAdmin
		.config(function($stateProvider, $urlRouterProvider) {
			$urlRouterProvider.otherwise("product/list");

			$stateProvider
					.state('product', {
						url : '/product',
						templateUrl : 'admin/views/common.jsp'
					})
					.state(
							'product.list',
							{
								url : '/list',
								templateUrl : 'admin/views/list-article.jsp',
								controller : 'listArticleCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid.min.css', ]
														},
														{
															name : 'vendors',
															files : [ 'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid-override.min.js' ]
														} ])
									}
								}
							})
		});
