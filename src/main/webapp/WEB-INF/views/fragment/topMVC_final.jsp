<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/ionicons.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_index/nice-select.css">
<title>Insert title here</title>
</head>
<body>
<!-- 導覽列bootstrap -->
<nav class="navbar px-md-0 navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand" href="<c:url value='/' />"><img src="${pageContext.request.contextPath}/images_index/logo-1.png" width="180" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="<c:url value='/' />" class="nav-link">首頁</a></li>
                    <li class="nav-item"><a href="<c:url value='${pageContext.request.contextPath}/ACT/chooseSport' />" class="nav-link">賽事</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/product/index" class="nav-link">商城</a></li>
                    <li class="nav-item"><a href="<c:url value='${pageContext.request.contextPath}/DOS/DOS_Index' />" class="nav-link">場地</a></li>
                    <li class="nav-item"><a href="<c:url value='/member/memberInformation' />" class="nav-link">會員</a></li>
                    <li class="nav-item"><a href="<c:url value='/${pageContext.request.contextPath}/Back_index' />" class="nav-link">後台管理</a></li>
                    <li class="nav-item"><a href="<c:url value='${pageContext.request.contextPath}/ACT/MemPage' />" class="nav-link">個人主頁</a></li>
<%--                     <c:choose> --%>
<%--                     <c:when test="${LoginOK.member_perm_id.member_perm_id==3 }"> --%>
<%--                     <li class="nav-item"><a href="<c:url value='/Back_index' />" class="nav-link">後台管理</a></li> --%>
<%--                     </c:when> --%>
<%--                     <c:when test="${LoginOK.member_perm_id.member_perm_id==1 || LoginOK.member_perm_id.member_perm_id==2}"> --%>
<%--                     <li class="nav-item"><a href="<c:url value='/ACT/MemPage' />" class="nav-link">個人主頁</a></li> --%>
<%--                     </c:when> --%>
<%--                     </c:choose> --%>
                  
                                   
                </ul>
                <div class="user">
                    <c:if test="${empty LoginOK}">
                    <a href="<c:url value='/member/loginForm' />" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                    </c:if>
                    <c:if test="${! empty LoginOK}">
                    <a href="<c:url value='/member/logout' />" class="user-btn"><img src="${pageContext.request.contextPath}/images_index/user.png" alt="user" class="user-btn-img">
                        <span>登出</span>
                    </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>