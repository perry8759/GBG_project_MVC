<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <title>Hello, world!</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Header_style_new.css">
</head>
<body>
	<nav class="navbar px-md-0 navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images_member/logo-1.png" width="180" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <div class="collapse navbar-collapse header_menu" id="ftco-nav">

                <ul class="header_mean navbar-nav ml-auto ">
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">賽事</a>
                        <ul class="header_drop">
                            <li><a href="#">查看賽事</a></li>
                            <li><a href="#">參加賽事</a></li>
                            <li><a href="#">我的賽事</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="case.html" class="nav-link">商城</a>
                        <ul class="header_drop">
                            <li><a href="${pageContext.request.contextPath}/shoppingCart/shoppingCart">購物車</a></li>
                            <li><a href="${pageContext.request.contextPath}/product/index">商城主頁</a></li>
                            <li><a href="${pageContext.request.contextPath}/order/queryMemberOrders">訂單查詢</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="case.html" class="nav-link">場地</a>
                        <ul class="header_drop">
                            <li><a href="#">場地清單</a></li>
                            <li><a href="#">附近場地</a></li>
                            <li><a href="#">管理場地</a></li>
                        </ul>
                    </li>


                </ul>
                <div class="user">
                    <a href="#" class="user-btn"><img src="${pageContext.request.contextPath}/images_member/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                    <ul class="header_drop">
                        <li><a href="${pageContext.request.contextPath}/member/memberInformation">會員中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/member/logout">登出</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
</body>
<!-- 	<input type="checkbox" name="" id="menu_control"> -->
<!--     <div class="header"> -->
<%--         <a href="#" class="logo"><img src="${pageContext.request.contextPath}/images_member/logo-1.png" width="180" alt="logo"></a> --%>
<!--         <label for="menu_control" class="menu_btn"> -->
<!--             <span>選單</span> -->
<!--         </label> -->
<!--         <nav class="menu"> -->
<!--             <ul class="menu_ul"> -->
<!--                 <div class="search"> -->
<!--                     <input type="text" class="search-bar" id="search" placeholder="Search"> -->
<!--                     <button class="search-btn"><i class="fas fa-search"></i></button> -->
<!--                 </div> -->
<%--                 <li class="active"><a href="${pageContext.request.contextPath}/">首頁</a></li> --%>
<!--                 <li><a href="#">賽事</a></li> -->
<!--                 <li><a href="#">商城</a></li> -->
<!--                 <li><a href="#">論壇</a></li> -->
<%--                 <li><a href="${pageContext.request.contextPath}/member/memberInformation">會員</a></li> --%>
<!--                 <div class="user"> -->
<%--                     <c:if test="${empty LoginOK}"> --%>
<%--                     <a href="<c:url value='/member/loginForm' />" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png" alt="user" class="user-btn-img"> --%>
<!--                         <span>登入</span> -->
<!--                     </a> -->
<%--                     </c:if> --%>
<%--                     <c:if test="${! empty LoginOK}"> --%>
<%--                     <a href="<c:url value='/member/logout' />" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png" alt="user" class="user-btn-img"> --%>
<!--                         <span>登出</span> -->
<!--                     </a> -->
<%--                     </c:if> --%>
<!--                 </div> -->
<!--             </ul> -->
<!--         </nav> -->
<!--     </div> -->
<!-- </body> -->
</html>