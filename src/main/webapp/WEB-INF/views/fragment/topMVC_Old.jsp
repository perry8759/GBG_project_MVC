<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>會員註冊</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;500;&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Header_style.css">
</head>
<body>
	<input type="checkbox" name="" id="menu_control">
    <div class="header">
        <a href="#" class="logo"><img src="${pageContext.request.contextPath}/images_member/logo-1.png" width="180" alt="logo"></a>
        <label for="menu_control" class="menu_btn">
            <span>選單</span>
        </label>
        <nav class="menu">
            <ul class="menu_ul">
                <div class="search">
                    <input type="text" class="search-bar" id="search" placeholder="Search">
                    <button class="search-btn"><i class="fas fa-search"></i></button>
                </div>
                <li class="active"><a href="${pageContext.request.contextPath}/">首頁</a></li>
                <li><a href="#">賽事</a></li>
                <li><a href="#">商城</a></li>
                <li><a href="#">論壇</a></li>
                <li><a href="${pageContext.request.contextPath}/member/memberInformation">會員</a></li>
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
            </ul>
        </nav>
    </div>
</body>
</html>