<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();								
%>
<div class="sidebar-inner c-overflow">    
    <div class="profile-menu">
        <a href="" toggle-submenu>
            <div class="profile-pic">
                <img src="/admin/img/profile-pics/4.jpg" alt="">
            </div>

            <div class="profile-info">
                <%=user.getNickname()%>

                <i class="md md-arrow-drop-down"></i>
            </div>
        </a>

        <ul class="main-menu">            
            <li>
                <a href="<%=userService.createLogoutURL("/")%>"><i class="md md-history"></i> Đăng xuất</a>
            </li>
        </ul>
    </div>

    <ul class="main-menu">
        <li data-ui-sref-active="active">
            <a data-ui-sref="home" data-ng-click="mactrl.sidebarStat($event)"><i class="md md-home"></i> Trang chủ</a>
        </li>        
        <li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('product') }">
            <a href="" toggle-submenu><i class="md md-redeem"></i> Sản phẩm</a>

            <ul>                
                <li><a data-ui-sref-active="active" data-ui-sref="product.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách sản phẩm</a></li>
                <li><a data-ui-sref-active="active" data-ui-sref="product.create" data-ng-click="mactrl.sidebarStat($event)">Thêm sản phẩm mới</a></li>
                <li><a data-ui-sref-active="active" data-ui-sref="product.edit" data-ng-click="mactrl.sidebarStat($event)">Sửa sản phẩm</a></li>
            </ul>
        </li>    
        <li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('category') }">
            <a href="" toggle-submenu><i class="md md-view-list"></i> Danh mục sản phẩm</a>

            <ul>                
                <li><a data-ui-sref-active="active" data-ui-sref="category.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách danh mục</a></li>
            </ul>
        </li>   
        <li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('collection') }">
            <a href="" toggle-submenu><i class="md md-favorite"></i> Bộ sưu tập</a>

            <ul>                
                <li><a data-ui-sref-active="active" data-ui-sref="collection.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách bộ sưu tập</a></li>
            </ul>
        </li>  
        <li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('supplier') }">
            <a href="" toggle-submenu><i class="md md-store"></i> Nhà cung cấp</a>

            <ul>                
                <li><a data-ui-sref-active="active" data-ui-sref="supplier.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách nhà cung cấp</a></li>
            </ul>
        </li>      
        <li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('order') }">
            <a href="" toggle-submenu><i class="md md-event-note"></i> Đơn hàng</a>

            <ul>                
                <li><a data-ui-sref-active="active" data-ui-sref="order.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách đơn hàng</a></li>
            </ul>
        </li>   
    </ul>
</div>