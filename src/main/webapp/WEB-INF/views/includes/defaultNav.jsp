<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Main header start -->
<header class="main-header">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navigation" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
 
 <!-- 	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<form action="#" class="menu_search_form">
				<input type="text" class="menu_search_input" placeholder="Search" required="required">
				<button class="menu_search_button"><i class="fa fa-search" aria-hidden="true"></i></button>
			</form>
			<ul>
				<li class="menu_item"><a href="index.html">Home</a></li>
				<li class="menu_item"><a href="#">About us</a></li>
				<li class="menu_item"><a href="#">Services</a></li>
				<li class="menu_item"><a href="news.html">News</a></li>
				<li class="menu_item"><a href="contact.html">Contact</a></li>
			</ul>
		</div>
		<div class="menu_social">
			<ul>
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div> -->
<%--             <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="/hospital/list" tabindex="0" data-submenu="" aria-expanded="false">
                            	검색</a></li>
                	 <c:if test="${not empty sessionScope.user}">
                	<li class="dropdown">
                        <a href="/favorite/foruser" tabindex="0" data-submenu="" aria-expanded="false">
                            	즐겨찾기</a></li>
                      </c:if>  
                	 <c:if test="${not empty sessionScope.hospital}">
                	<li class="dropdown">
                        <a href="/favorite/forhospital" tabindex="0" data-submenu="" aria-expanded="false">
                            	즐겨찾기</a></li>
                      </c:if>      	
                     <li class="dropdown">
                        <a href="/faq/faqList" tabindex="0" data-submenu="" aria-expanded="false">
                            	FAQ</a></li>
                    <c:if test="${not empty sessionScope.user}">
                        <li class="dropdown">
                        	<a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            	반려동물 관리<span class="caret"></span></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/pet/list">반려동물 목록</a></li>
	                            <li><a href="/pet/register">반려동물 등록</a></li>
	                        </ul>
                    	</li>
                    	<li class="dropdown">
                        	<a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            	마이페이지<span class="caret"></span></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/member/modifyForm">개인정보 수정</a></li>
	                            <li><a href="/userAppointment/list">예약내역 목록</a></li>
	                        </ul>
                    	</li>
              		</c:if>
              		<c:if test="${not empty sessionScope.hospital}">
                    	<li class="dropdown">
                        	<a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            	마이페이지<span class="caret"></span></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/hospital/modifyForm">개인정보 수정</a></li>
	                            <li><a href="/appointment/list">예약내역 목록</a></li>
	                        </ul>
                    	</li>
              		</c:if>                   
                 </ul>     
                 
            </div> --%>

            <!-- /.navbar-collapse -->
            <!-- /.container -->
        </nav>
    </div>
</header>

<!-- Main header end -->