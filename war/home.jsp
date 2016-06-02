<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="java.util.List"%>
<html>
<head>

<title>Border Collie Việt Nam</title>
<meta name="title" content=" "/>			
<meta name="description" content=" "/>
<meta name="keywords" content=" "/>	
<meta name="generator" content=" "/>
	
<meta property="og:url" content=" "/>
<meta property="og:title" content=" "/>
<meta property="og:description" content=" "/>	
<meta property="og:image" content=" "/> 	
<meta property="og:site_name" content=" "/>
<meta property="fb:admins" content="100000152425373" name="100000152425373"/>	

<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
<script src="/js/bootstrap.min.js"></script>
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
         <jsp:include page="/includes/top.jsp"/>
 
 <%
 	List<Article> listArticle = (List<Article>)request.getAttribute("listArticle");
 	boolean hasNextPage = (Boolean)request.getAttribute("hasNextPage");
 	int currentPage = (Integer)request.getAttribute("page");
 %>                   
        <!-- main content
        ================================================== -->
        <div id="content">
        	<div class="container">
                <div class="row-fluid">
    
                    <!-- main content
                    ================================================== -->
                    <div id="mainContent" class="span8">
                    	<div id="mainContent_inner">                            
                            <%
                            	Calendar cal = Calendar.getInstance();
                            	for(Article article: listArticle){
                            		cal.setTimeInMillis(article.getUpdated());
                            %>									
									<article>
		                                <header>
		                                    <div class="postDate">
		                                        <time pubdate="" datetime="<%=article.getDoc()%>">
		                                            <a href="/time/date-<%=article.getDoc()%>" title="Date <%=article.getDoc()%>">
		                                            	Ngày <%=cal.get(Calendar.DATE)%> tháng <%=cal.get(Calendar.MONTH)%>, <%=cal.get(Calendar.YEAR)%>		                                            			                                            	
		                                            </a>
		                                        </time>
		                                    </div>
		                                    <h2 class="title"><a href="/articles/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></h2>
		                                    <div class="meta">
		                                        <div class="category">Đăng bởi <a href="/category/"><%=article.getCreatedBy().replace("@gmail.com", "") %></a></div>                                    
		                                    </div>                                
		                                </header>		                               
										<div class="postThumb"><a href="/articles/detail?id=<%=article.getId()%>">
											<%
												if(article.getPhotos()!=null&&article.getPhotos().size()>0){
											%>
												<img src="<%=article.getPhotos().get(0) %>" /></a>
											<%
												}
											%>											
										</div>
		                                <p class="postDesc"><%=article.getDescription() %></p>
		                            </article>																
							<%
                            	}
							%>
                            <ul class="pager">
                            	<%
                            		if(hasNextPage){
                            	%>
	                                <li class="previous">
	                                    <a href="/?page=<%=currentPage%>">&larr; Older Entries</a>
	                                </li>
                                <%
                            		}
                                %>
                                
                                <%
                                	if(currentPage>1){
                                %>
                                	 <li class="next">
	                                    <a href="/?page=<%=currentPage%>">Newer Entries &rarr;</a>	                                    
	                                </li> 
                                <%
                                	}
                                %>                            	         
                            </ul>
                        </div>
                    </div>
                    
                   	<!-- sidebar
					================================================== -->
					<jsp:include page="/includes/side-bar.jsp"/>
					
                </div>
            </div>
        </div>
        
        <!-- AddThis Smart Layers BEGIN -->
		<!-- Go to http://www.addthis.com/get/smart-layers to customize -->
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4df08bdf3f3b1b46"></script>
		<script type="text/javascript">
			  addthis.layers({
				'theme' : 'transparent',
				'share' : {
				  'position' : 'right',
				  'services' : 'facebook,twitter,google_plusone_share,tumblr,email,print,more'
	 
				}
			  });
		</script>
		<!-- AddThis Smart Layers END -->

		
        <?=setting.getAnalytic()?>
        
        <!-- footer
        ================================================== -->
        <footer>
            <div class="container">&copy; 2013 Copyright <a href="/"><?=domain_name?></a></div>
        </footer>		        
    </div>	
</body>
</html>
