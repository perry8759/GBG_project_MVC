<!-- 會員中心 側邊欄-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Menu_style.css">
</head>
<body>
	<input type="checkbox" name="" id="side-menu-switch">
    <div class="side-menu">
        <nav class="navs">
            <a href="<c:url value="/"/>"><i class="fa fa-home" aria-hidden="true"></i>回首頁</a>
            <a href="<c:url value='/ACT/Manager_ACT_list' />"><i class="fa fa-home" aria-hidden="true"></i>活動管理</a>
            <a href="<c:url value='/product/manageProducts' />"><i class="fa fa-home" aria-hidden="true"></i>商城管理</a>
            <a href="<c:url value='/DOS/DOS_list' />"><i class="fa fa-home" aria-hidden="true"></i>場地管理</a>
            <a href="<c:url value='/member/memberManager' />"><i class="fa fa-home" aria-hidden="true"></i>帳號管理</a>
        </nav>
        <label for="side-menu-switch">
            <i class="fa fa-angle-right"></i>
        </label>
    </div>
</body>
</html>
