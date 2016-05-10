<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="header-inner">
    <li id="menu-trigger" data-target="mainmenu" data-toggle-sidebar data-model-left="mactrl.sidebarToggle.left" data-ng-class="{ 'open': mactrl.sidebarToggle.left === true }">
        <div class="line-wrap">
            <div class="line top"></div>
            <div class="line center"></div>
            <div class="line bottom"></div>
        </div>
    </li>

    <li class="logo hidden-xs">
        <a href="index.html">Trang quản trị {{ layoutSS }}</a>
    </li>

    <li class="pull-right">
     	<ul class="top-menu">
                                  
            <li class="hidden-xs">
                <a class="" href=""></a>
            </li>
            <li id="toggle-width">
                <div class="toggle-switch">
                    <input id="tw-switch" type="checkbox" hidden="hidden" data-change-layout="mactrl.layoutType"> 
                    <label for="tw-switch" class="ts-helper"></label>
                </div>
            </li>
        </ul>   
    </li>
</ul>
