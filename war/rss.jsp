
<?xml version="1.0" encoding="UTF-8"?>
  <rss version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">
	
    <channel>
    <title><![CDATA[<%=setting.getSiteTitle()%>]]></title>
    <link><%=request.getServerName()%></link>
    <description><![CDATA[<%=setting.getSiteDescription()%>]]></description>
    <dc:language>en-ca</dc:language>
    <dc:creator>google app engine</dc:creator>

    <dc:rights>Copyright 2013 bordercollie.vn</dc:rights>
    <admin:generatorAgent rdf:resource="<%=request.getServerName()%>" />
    	<%
    		if(listArticle!=null){
    			    	for(Article obj: listArticle){
    	%>
			       <item>
			          <title><![CDATA[<%=obj.getTitle()%>]]></title>
			          <link>http://<%=request.getServerName() %>/<%=obj.getAlias() %>.html</link>         
			          <comments>http://<%=request.getServerName() %>/<%=obj.getAlias() %>.html#comment</comments>	
			          <description><![CDATA[<%=obj.getDescription()%>]]></description>
			          <pubDate><%=obj.getDate()%></pubDate>
			       </item>
		      	<%
		   		}
    		}
       	%>
    </channel>
</rss>  	