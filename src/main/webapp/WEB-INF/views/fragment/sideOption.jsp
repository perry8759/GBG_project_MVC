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
            <a href="${pageContext.request.contextPath}/"><i class="fa fa-home" aria-hidden="true"></i>回首頁</a>
            <a href="${pageContext.request.contextPath}/member/memberInformation"><i class="fa fa-home" aria-hidden="true"></i>會員主頁</a>
            <a href="${pageContext.request.contextPath}/member/memberEdit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>修改資料</a>
            <a href="${pageContext.request.contextPath}/member/editPasswordForm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>更改密碼</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>比賽管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>推播管理</a>
            <a href="${pageContext.request.contextPath}/order/queryMemberOrders"><i class="fa fa-home" aria-hidden="true"></i>訂單查詢</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>收藏清單</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>管理商品評論</a>
        </nav>
        <label for="side-menu-switch">
            <i class="fa fa-angle-right"></i>
        </label>
    </div>
</body>
</html>