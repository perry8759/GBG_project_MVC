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
                <li class="active"><a href="#">首頁</a></li>
                <li><a href="#">賽事</a></li>
                <li><a href="#">商城</a></li>
                <li><a href="#">論壇</a></li>
                <li><a href="#">會員</a></li>
                <div class="user">
                    <a href="#" class="user-btn"><img src="${pageContext.request.contextPath}/images_member/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                </div>
            </ul>
        </nav>
    </div>
    <div class="login">
        <form class="form" action="login" method="POST">
            <h2>會員登入</h2>
            <div class="group">
                <label for="user_id">帳號</label>
                <input type="text" name="userId" id="user_id">
                ${AccountEmptyError}
            </div>
            <div class="group">
                <label for="user_password">密碼</label>
                <input type="password" name="pswd" id="user_password">
                ${PasswordEmptyError}
            </div>
            <div class="text-group">
                <div class="left">
                    <label><input id="remember" class="text-info" type="checkbox">記住密碼</label>
                </div>
                <div class="right">
                    <a href="#">忘記密碼 ?</a>
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