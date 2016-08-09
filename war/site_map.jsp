<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
  <%
  	if(listArticle!=null){
  		for(Article obj: listArticle){
  %>
		<url>
		  <loc>http://<%=request.getServerName() %>/<%=obj.getAlias() %>.html</loc>
		</url>
		<%
		}
	}
  %>
</urlset>