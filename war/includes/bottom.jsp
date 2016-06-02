<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
<script src="../js/bootstrap.min.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<script>
	$(document).ready(function() {
		$("#searchForm .icon-search").click(function(){		
			if($("#searchForm input, #searchForm .icon-search").hasClass("active")) {
				$("#searchForm input, #searchForm .icon-search").removeClass("active");
			} else {
				$("#searchForm input, #searchForm .icon-search").addClass("active");
			}	
		})
	});
</script>
</head>

<body>

	<!-- content
	================================================== -->
    <div id="master">
        	
        <!-- header
        ================================================== -->
         <header id="header">
            
            <!-- logo & slogan -->
            <hgroup>
                <h1 class="site-title"><a href="/" title="">Border Collie Việt Nam</a></h1>
                <h2 class="slogan">You've never owned a dog until you have owned a Border Collie</h2>
            </hgroup>
            
            <!-- navigation -->
            <nav>
            	<div class="container">
                    <ul id="mainMenu" class="clearafter">
                        <li><a href="/" title="Home Page">Home</a></li>
                        <li><a href="/rss" title="Stay updated via RSS">Rss</a></li>
                        <li><a href="/sitemap.xml" title="Site map">Site Map</a></li>                       
                        <li><a href="/about-us" title="About us">About Us</a></li>
                    </ul>
                </div>
            </nav>
        </header>