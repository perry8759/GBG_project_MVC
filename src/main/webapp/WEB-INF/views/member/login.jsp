<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/login_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Header_style.css">
   
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images_member/joey-huang-1_R0BMGwiZI-unsplash.jpg');">
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <div class="login">
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
</body>
</html>