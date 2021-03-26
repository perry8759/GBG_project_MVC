<!-- header 03.24 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css_index/animation.css">
<title>Header</title>
</head>

<body>
	<nav
		class="navbar px-md-0 navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container-fluid px-md-5">
			<a class="navbar-brand" href="<c:url value='/' />"><img
				src="${pageContext.request.contextPath}/images_index/logo-1.png" width="180" alt="logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse header_menu" id="ftco-nav">

				<ul class="header_mean navbar-nav ml-auto ">
					<li class="nav-item"><a href="<c:url value='/' />" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="<c:url value='/ACT/chooseSport' />" class="nav-link">賽事</a>
						<ul class="header_drop">
							<li><a href="#">查看賽事</a></li>
							<li><a href="#">參加賽事</a></li>
							<li><a href="#">我的賽事</a></li>
						</ul></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/product/index" class="nav-link">商城</a>
						<ul class="header_drop">
                            <li><a href="${pageContext.request.contextPath}/shoppingCart/shoppingCart">購物車</a></li>
                            <c:if test="${!empty LoginOK}">
                            	<li><a href="${pageContext.request.contextPath}/order/queryMemberOrders">訂單查詢</a></li>
                            </c:if>
                        </ul></li>
					<li class="nav-item"><a href="<c:url value='/DOS/DOS_Index' />" class="nav-link">場地</a>
						<ul class="header_drop">
							<li><a href="#">場地清單</a></li>
							<li><a href="#">附近場地</a></li>
							<li><a href="#">管理場地</a></li>
						</ul></li>


				</ul>
				<div class="user">
				<c:if test="${empty LoginOK}">
					<a href="<c:url value='/member/loginForm' />" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png"
						alt="user" class="user-btn-img"> <span>登入</span> </a>
				</c:if>
					<c:if test="${!empty LoginOK}">
					<a href="#" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png"
						alt="user" class="user-btn-img"></a>
					<ul class="header_drop">
						<c:choose>
							<c:when test="${LoginOK.member_perm_id.member_perm_id==3 }">
								<li><a href="<c:url value='/Back_index' />">後臺管理</a></li>
							</c:when>
							<c:when
								test="${LoginOK.member_perm_id.member_perm_id==1 || LoginOK.member_perm_id.member_perm_id==2}">
								<li><a href="<c:url value='/member/memberInformation' />">會員中心</a></li>
							</c:when>
						</c:choose>
						<li><a href="<c:url value='/member/logout' />">登出</a></li>
					</ul>
					</c:if>
				</div>
			</div>

		</div>
	</nav>
</body>
</html>
