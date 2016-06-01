<!DOCTYPE html>
<html>
<head>
<?
	var keywords = "";	
	if(obj.getTags()!==null&&obj.getTags().size()>0){
		for (var i=0;i<obj.getTags().size();i++)
		{ 
			var split =  obj.getTags().get(i).split(',');
			if(split.length>1){
				keywords += split[1] + ",";
			}			
		}
	}
?>

<title><?=obj.getTitle()?></title>
<!-- All in One SEO Pack 2.1.6 by Michael Torbert of Semper Fi Web Design[584,680] -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="title" content="<?=obj.getTitle()?>"/>
<meta name="description" content="<?=obj.getDescription()?>" />
<meta name="keywords" content="<?=keywords?>" />

<link rel="canonical" href="<?=page_url?>" />
<meta property="og:title" content="<?=obj.getTitle()?>" />
<meta property="og:type" content="article" />
<meta property="og:url" content="<?=page_url?>" />
<meta property="og:image" content="<?=obj.getThumbnail()?>" />
<meta property="og:site_name" content="<?=setting.getSiteName()?>" />
<meta property="fb:admins" content="100000152425373" />
<meta property="og:description" content="<?=obj.getDescription()?>" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:description" content="<?=obj.getDescription()?>" />
<!-- /all in one seo pack -->

<link rel="stylesheet" type="text/css" href="/bulk-template/default/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/bulk-template/default/css/style.css" />
<script type='text/javascript' src='//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
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
                            <article>
                                <header>
                                    <div class="postDate">
                                        <time pubdate="" datetime="<?=obj.getDate()?>">
                                            <a href="/time/date-<?=obj.getMonth()?>-<?=obj.getDay()?>-<?=obj.getYear()?>" title="Date <?=obj.getDate()?>"><?=obj.getDate()?></a>
                                        </time>
                                    </div>
                                    <h2 class="title"><a href="/<?=obj.getAlias()?>.html"> <?=obj.getTitle()?></a></h2>
                                    <div class="meta">
                                        <div class="category">Posted in <a href="/category/<?=obj.getCategoryAlias()?>"><?=obj.getCategoryTitle()?></a></div>
                                        <div class="category">Tag : 
                                        <?
                                        	if(obj.getTags()!==null&&obj.getTags().size()>0){
	                                        	for (var i=0;i<obj.getTags().size();i++)
												{ 
													var split =  obj.getTags().get(i).split(',');
													if(split.length>1){
											?>
												<a href="/tag/<?=split[0]?>"><?=split[1]?></a>, 
											<?							
													}					
												}
											}
                                        ?>                                        
                                        </div>                                    
                                    </div>                                
                                </header>                                
                                <div class="postContent">
                                	<?=obj.getContent()?>
                                </div>
                            </article>        
                            
                            <div class="relatedPost">
	                            <div class="row-fluid">
	                            	<?
	                            		if(previous_obj!==null){
	                            	?>
	                            		<div class="span6">&larr; <a href="/<?=previous_obj.getAlias()?>.html"><?=previous_obj.getTitle()?></a></div>
	                            	<?
	                            		}
	                            	?>
	                            	<?
	                            		if(next_obj!==null){
	                            	?>
	                            		<div class="span6 content-right"><a href="/<?=next_obj.getAlias()?>.html"><?=next_obj.getTitle()?></a> &rarr;</div>
	                            	<?
	                            		}
	                            	?>
	                            </div>
                            </div>                    
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
                                             <?
            								    var imgUrl;
            									if(list_recent_view.get(i).getThumbnail().indexOf('images/thumb') === -1)
            									{
            							            imgUrl = list_recent_view.get(i).getThumbnail();
            									}else{
            								        imgUrl = "//commondatastorage.googleapis.com/static.tubeonfire.com/noimg.jpeg";
            									}
            								?>	
                                            <div class="span3">
                                                <img class="img-full-width" src="<?=imgUrl?>" />
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
                               			if(list_tag!==null&&list_tag.size()>0){
											for (var i=0;i<list_tag.size();i++)
											{
												var split =  list_tag.get(i).split(',');
												if(split.length>1){
									?>
												 <a href="/tag/<?=split[0]?>"><?=split[1]?></a>     
									<?
												}
											}
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