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
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/login_style.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images_member/joey-huang-1_R0BMGwiZI-unsplash.jpg');background-size: 100% 100%;">
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	<section class="hero-image"
		style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');"
		data-stellar-background-ratio="0.5">
	</section>
	<div class="login" style="margin-top: 200px">
        <form class="form" action="login" method="POST">
            <h2>會員登入</h2>
            <div class="group">
                <label for="user_id">帳號</label>
                <input type="text" name="userId" id="user_id" value="${requestScope.userId}">
                <span style="color: red;">${AccountEmptyError}</span>
                
            </div>
            <div class="group">
                <label for="user_password">密碼</label>
                <input type="password" name="pswd" id="user_password" value="${requestScope.pswd}">
                <span style="color: red;">${PasswordEmptyError}</span>
                <span style="color: red;">${LoginError}</span>
            </div>
            <div class="text-group">
                <div class="left">
                    <label><input name="rm" id="remember" class="text-info" type="checkbox" value="true" ${requestScope.rememberMe}>記住密碼</label>
                </div>
                <div class="right">
                    <a href="forgotPassword">忘記密碼 ?</a>
                </div>
            </div>
            <div class="btn-group">
<!--                 <button class="btn" onclick="location.href='https://charliechou88.pixnet.net/blog/post/165110501'">註冊</button> -->
                <input class="btn" type="button" value="註冊" onclick="location.href='permSelect'">
                <input class="btn" type="submit" value="登入">
            </div>
        </form>
    </div>
    <!-- loader -->
  <script src="${pageContext.request.contextPath}/js_index/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js_index/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/main.js"></script>
</body>
</html>
