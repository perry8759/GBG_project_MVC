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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">

 




 
<title>Insert title here</title>
</head>
<body>
<!-- 導覽列bootstrap -->
<nav class="navbar px-md-0 navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand" href="<c:url value='/' />"><img src="${pageContext.request.contextPath}/images/logo-1.png" width="180" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="<c:url value='/' />" class="nav-link">首頁</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">賽事</a></li>
                    <li class="nav-item"><a href="practice-areas.html" class="nav-link">商城</a></li>
                    <li class="nav-item"><a href="<c:url value='/DOS/DOS_Index' />" class="nav-link">場地</a></li>
                    <c:choose>
                    <c:when test="${LoginOK.member_perm_id.member_perm_id==3 }">
                    <li class="nav-item"><a href="<c:url value='/Back_index' />" class="nav-link">後台管理</a></li>
                    </c:when>
                    </c:choose>
                  
                                   
                </ul>
                <div class="user">
                    <c:if test="${empty LoginOK}">
                    <a href="<c:url value='/member/loginForm' />" class="user-btn"><img src="${pageContext.request.contextPath}/images/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                    </c:if>
                    <c:if test="${! empty LoginOK}">
                    <a href="<c:url value='/member/logout' />" class="user-btn"><img src="${pageContext.request.contextPath}/images/user.png" alt="user" class="user-btn-img">
                        <span>登出</span>
                    </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
    
    
    
    
    
</body>
</html>