<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>會員註冊</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;500;&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/GBG_project_mvc/css/NVG_SignUp_style.css">
    <link rel="stylesheet" href="/GBG_project_mvc/css/Header_style.css">
</head>
<body>
    <input type="checkbox" name="" id="menu_control">
    <div class="header">
        <a href="#" class="logo"><img src="/GBG_project_mvc/images/logo-1.png" width="180" alt="logo"></a>
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
                    <a href="#" class="user-btn"><img src="/GBG_project_mvc/images/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                </div>
            </ul>
        </nav>
    </div>
    <div class="wrap">
        <div class="item">
            <img src="/GBG_project_mvc/images/normalMember.jpg" width="400px" height="600px"> 
            <div class="txt" onclick="location.href='registered/normal'">
                <h2>一般會員</h2>
                <p>參加比賽，第一時間掌握比賽時間，結交志同道的朋友。</p>
                <br>
<!--                 <a href="./EBM_SignUp.html">點我前往註冊</a> -->
            </div>
        </div>
        
        <div class="item" onclick="location.href='registered/company'">
            <img src="/GBG_project_mvc/images/companyMember.jpg" width="400px" height="600px">
            <div class="txt">
                <h2>單位會員</h2>
                <p>輕鬆舉辦比賽，宣傳、報名、場地一手包辦。</p>
                <br>
<!--                 <a href="./DWM_SignUp.html">點我前往註冊</a> -->
            </div>
        </div>
    </div>
    
</body>
</html>