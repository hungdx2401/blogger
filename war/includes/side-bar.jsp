<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
 	List<Category> listCategory = (List<Category>)request.getAttribute("listCategory"); 	
 %>    
<aside class="span4">
	<div id="sidebar">
		<div class="box">
			<form action="" method="get" onsubmit="location.href='/search/' + encodeURIComponent(this.search.value).replace(/ /g, '+'); return false;" class="form-inline">
				<input type="text" class="input-block-level" name="search" id="s" placeholder="Tìm kiếm">
			</form>
		</div>
		<div class="box postListing">
			<h3 class="boxTitle">Đang được theo dõi</h3>
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
							<a href="/<?=list_recent_view.get(i).getAlias()?>.html" class="title">
								<?=list_recent_view.get(i).getTitle()?>
							</a> <a class="published" href="/time/date-<?=list_recent_view.get(i).getMonth()?>-<?=list_recent_view.get(i).getDay()?>-<?=list_recent_view.get(i).getYear()?>"
								title="Date <?=list_recent_view.get(i).getDate()?>">
								<?=list_recent_view.get(i).getDate()?>
							</a>
						</div>
					</li>
					<?
											}
										?>
				</ul>
			</div>
		</div>
		
		<%
			if(listCategory!=null&&listCategory.size()>0){
		%>
		<div class="box categories">
			<h3 class="boxTitle">Danh mục</h3>
			<div class="boxContent">
				<ul class="clearafter">
					<%
						for(Category category: listCategory){
					%>
					<li>
						<a href="/category/<%=category.getId()%>">
							<%=category.getTitle() %>
						</a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		<%-- <div class="box tags">
			<h3 class="boxTitle">Tags</h3>
			<div class="boxContent clearafter">
				<?
										for (var i=0;i<list_tag.size();i++)
										{
											var split =  list_tag.get(i).split(',');
										?>
				<a href="/tag/<?=split[0]?>">
					<?=split[1]?>
				</a>
				<?
										}
									?>

			</div>
		</div> --%>
	</div>
</aside>