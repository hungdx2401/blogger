 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Date <?=month?>/<?=day?>/<?=year?> - Page <?=current_page.toString()?> - <?=setting.getSiteName()?></title>
<meta name="title" content="Date <?=month?>/<?=day?>/<?=year?> - Page <?=current_page.toString()?> - <?=setting.getSiteName()?>"/>			
<meta name="description" content="Date <?=month?>/<?=day?>/<?=year?> - Page <?=current_page.toString()?> - <?=setting.getSiteTitle()?>"/>
<meta name="keywords" content="Date <?=month?>/<?=day?>/<?=year?>, <?=setting.getSiteKeyword()?>"/>	
<meta name="generator" content="Blogger 2.0"/>
	
<meta property="og:url" content="<?=page_url?>"/>
<meta property="og:title" content="Date <?=month?>/<?=day?>/<?=year?> - Page <?=current_page.toString()?> - <?=setting.getSiteTitle()?>"/>
<meta property="og:description" content="Date <?=month?>/<?=day?>/<?=year?> - Page <?=current_page.toString()?> - <?=setting.getSiteTitle()?>"/>	
<meta property="og:image" content="<?=setting.getSiteThumb()?>"/> 	
<meta property="og:site_name" content="<?=setting.getSiteName()?>"/>
<meta property="fb:admins" content="100000152425373" name="100000152425373"/>	

<link rel="stylesheet" type="text/css" href="/bulk-template/default/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/bulk-template/default/css/style.css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
<script src="/bulk-template/default/js/bootstrap.min.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
  <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
    <script src="//css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
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
                <h1 class="site-title"><a href="/" title="<?=setting.getSiteTitle()?>"><?=setting.getSiteName()?></a></h1>
                <h2 class="slogan"><?=setting.getSiteTitle()?></h2>
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
                    
                    
        <!-- main content
        ================================================== -->
        <div id="content">
        	<div class="container">
                <div class="row-fluid">
    
                    <!-- main content
                    ================================================== -->
                    <div id="mainContent" class="span8">
                    	<div id="mainContent_inner">
                    	<h2 class="heading">Date : <?=month?>/<?=day?>/<?=year?></h2>
                    	<?
							for (var i=0;i<list_article.size();i++)
							{ 
						?>
							<article>
                                <header>
                                    <div class="postDate">
                                        <time pubdate="" datetime="<?=list_article.get(i).getDate()?>">
                                            <a href="/time/date-<?=list_article.get(i).getMonth()?>-<?=list_article.get(i).getDay()?>-<?=list_article.get(i).getYear()?>" title="Date <?=list_article.get(i).getDate()?>"><?=list_article.get(i).getDate()?></a>
                                        </time>
                                    </div>
                                    <h2 class="title"><a href="/<?=list_article.get(i).getAlias()?>.html"><?=list_article.get(i).getTitle()?></a></h2>
                                    <div class="meta">
                                        <div class="category">Posted in <a href="/category/<?=list_article.get(i).getCategoryAlias()?>"><?=list_article.get(i).getCategoryTitle()?></a></div>                                    
                                    </div>                                
                                </header>
                                <?
								    var imgUrl;
											if(list_article.get(i).getThumbnail().indexOf('images/thumb') === -1)
											{
							           			imgUrl = list_article.get(i).getThumbnail();
											}else{
								        		imgUrl = "//commondatastorage.googleapis.com/static.tubeonfire.com/noimg.jpeg";
											}
										?>	
								<div class="postThumb"><a href="/<?=list_article.get(i).getAlias()?>.html"><img src="<?=imgUrl?>" /></a></div>
                                <p class="postDesc"><?=list_article.get(i).getDescription()?></p>
                            </article>							
						<?		
							}
						?>                    	                    	                                                       
                            <ul class="pager">
                            	<?	
                            		if(has_next_page)
                            		{
                            	?>
	                                <li class="previous">
	                                    <a href="/time/date-<?=month?>-<?=day?>-<?=year?>/?page=<?=(current_page+1).toString()?>">&larr; Older Entries</a>
	                                </li>
                                <?
                                	}
                                ?>
                                
                            	<?	
                            		if(current_page>1)
                            		{
                            	?>
	                                <li class="next">
	                                    <a href="/time/date-<?=month?>-<?=day?>-<?=year?>/?page=<?=(current_page-1).toString()?>">Newer Entries &rarr;</a>	                                    
	                                </li>
                                <?
                                	}
                                ?>                              
                            </ul>
                        </div>
                    </div>
                    
                    <!-- sidebar
                    ================================================== -->
                    <aside class="span4">
                        <div id="sidebar">
                            <div class="box">                                
                                <form action="" method="get" onsubmit="location.href='/search/' + encodeURIComponent(this.search.value).replace(/ /g, '+'); return false;" class="form-inline">   
		                            <input type="text" class="input-block-level" name="search" id="s" placeholder="search this site">
		                        </form>
                            </div>                 
                            <div class="box postListing">
                                <h3 class="boxTitle">Recent Views</h3>
                                <div class="boxContent">
                                    <ul>
                                    	<?
											for (var i=0;i<list_recent_view.size();i++)
											{ 
										?>
                                        <li class="row-fluid">
                                            <div class="span3">
                                                <img class="img-full-width" src="<?=list_recent_view.get(i).getThumbnail()?>" />
                                            </div>
                                            <div class="span9">
                                                <a href="/<?=list_recent_view.get(i).getAlias()?>.html" class="title"><?=list_recent_view.get(i).getTitle()?></a>
                                                <a class="published" href="/time/date-<?=list_recent_view.get(i).getMonth()?>-<?=list_recent_view.get(i).getDay()?>-<?=list_recent_view.get(i).getYear()?>" title="Date <?=list_recent_view.get(i).getDate()?>"><?=list_recent_view.get(i).getDate()?></a>                                                                                         
                                            </div>
                                        </li>   
                                        <?
											}
										?>                                                              
                                    </ul>
                                </div>                        
                            </div>
                            <div class="box categories">
                                <h3 class="boxTitle">Categories</h3>
                                <div class="boxContent">
                                    <ul class="clearafter">  
                                    	<?
											for (var i=0;i<list_category.size();i++)
											{ 
										?>
											 <li><a href="/category/<?=list_category.get(i).getAlias()?>"><?=list_category.get(i).getTitle()?></a></li>    
										<?
											}
										?>                                      
                                                                          
                                    </ul>
                                </div>
                            </div>
                            <div class="box tags">
                                <h3 class="boxTitle">Tags</h3>
                                <div class="boxContent clearafter">
                               		<?
										for (var i=0;i<list_tag.size();i++)
										{
											var split =  list_tag.get(i).split(',');
										?>
										 <a href="/tag/<?=split[0]?>"><?=split[1]?></a>     
									<?
										}
									?>                
                                                                      
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
        <!-- AddThis Smart Layers BEGIN -->
		<!-- Go to //www.addthis.com/get/smart-layers to customize -->
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4d6f3cdb1d190d60"></script>
		<script type="text/javascript">
		  addthis.layers({
		    'theme' : 'transparent',
		    'share' : {
		      'position' : 'left',
		      'numPreferredServices' : 5
		    }   
		  });
		</script>
		<!-- AddThis Smart Layers END -->
         <?=setting.getAnalytic()?>
        <!-- footer
        ================================================== -->
        <footer>
            <div class="container">&copy; 2014 Copyright <a href="/"><?=domain_name?></a></div>
        </footer>
    </div>        
</body>
</html>