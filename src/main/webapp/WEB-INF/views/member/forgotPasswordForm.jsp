<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>忘記密碼</title>
    <link rel="stylesheet" href="/GBG_project_mvc/css/AlterPwd_Style2.css">
    <link rel="stylesheet" href="/GBG_project_mvc/css/Menu_style.css">
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
    <!-- -------------------------------------------------------------------------------------------- -->
    <input type="checkbox" name="" id="side-menu-switch">
    <div class="side-menu">

        <nav class="nav">
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>回首頁</a>
            <a href="memberInformation"><i class="fa fa-home" aria-hidden="true"></i>會員主頁</a>
            <a href="memberEdit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>修改資料</a>
            <a href="editPasswordForm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>更改密碼</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>比賽管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>推播管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>訂單查詢</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>收藏清單</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>管理商品評論</a>
        </nav>
        <label for="side-menu-switch">
            <i class="fa fa-angle-right"></i>
        </label>

    </div>
    <!-- ----------------------------------------------------------------------------------------------------- -->
	<div class="box">
        <div class="signup">
			<form class="form" method="POST" action="editPasswordForm">
				<h2>忘記密碼</h2>
				<div class="group">
					請輸入Email信箱：<input type="text" name="email">
					${ErrorCode.EmailError}<br><br>
					
					請輸入帳號：<input type="text" name="account">
					${ErrorCode.AccountError}<br><br>
					${AccountEmailError}<br>
					<input type="submit" value="送出" class="btn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>