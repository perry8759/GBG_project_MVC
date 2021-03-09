<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>單位會員主頁</title>
    <link rel="stylesheet" href="/GBG_project_mvc/css/Menu_style.css">
    <link rel="stylesheet" href="/GBG_project_mvc/css/Mainpage_Style1.css">
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
                <li><a href="/GBG_project_mvc/member/memberInformation">會員</a></li>
                <div class="user">
                    <a href="/GBG_project_mvc/member/loginForm" class="user-btn"><img src="/GBG_project_mvc/images/user.png" alt="user" class="user-btn-img">
                        <span>登入</span>
                    </a>
                </div>
            </ul>
        </nav>
    </div>

    <input type="checkbox" name="" id="side-menu-switch">
    
    <div class="side-menu">

        <nav class="nav">
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>回首頁</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>會員主頁</a>
            <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>修改資料</a>
            <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>更改密碼</a>
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
    <div class="box">
        <!-- <c:forEach var='member' items='${member}'></c:forEach> -->
        <div class="signup">    
        <form class="form">
        <h2>單位會員主頁</h2>
        <div class="all-group">
            <div class="group">
                帳號:
                    <!-- <input type="member_account" class="form-control" name="member_account" value=""> -->
                    <p>${LoginOK.member_account}</p>
                單位名稱:
                    <!-- <input type=" member_real_name" class="form-control" name=" member_real_name" value=""> -->
                    <p>${LoginOK.member_real_name}</p>
                暱稱:
                    <!-- <input type="member_user_name" class="form-control" name="member_user_name"> -->
                    <p>${LoginOK.member_user_name}</p>
                統一編號:
                    <!-- <input type="member_tax_id_number" class="form-control" name="member_tax_id_number" value=""> -->
                    <p>${LoginOK.member_tax_id_number}</p>
                頭貼照片:
                    <!-- <input type="member_member_image" class="form-control" name="member_member_image" value="">  -->
                    <img width='100' height='200' src="<c:url value='getPicture' />" />
            </div>
            <div class="group1">
                地址:
                    <!-- <input type="member_address" class="form-control" name="member_address" value="">  -->
                    <p>${LoginOK.member_address}</p>
                聯絡人性別:
                    <!-- <input type="member_sex_id" class="form-control" name="member_sex_id"> -->
                    <p>${LoginOK.member_sex_id.member_sex_name}</p>
                聯絡人電子信箱:
                    <!-- <input type="member_email" class="form-control" name=" member_email">  -->
                    <p>${LoginOK.member_email}</p>
                聯絡人手機號碼:
                    <!-- <input type="member_mobile_phone" class="form-control" name="member_mobile_phone"> -->
                    <p>${LoginOK.member_mobile_phone}</p>
                聯絡人市話號碼:
                    <!-- <input type="member_fixed_line_telephone" class="form-control" name="member_fixed_line_telephone">  -->
                    <p>${LoginOK.member_fixed_line_telephone}</p>
            </div> 
        </div>    
        </form>
    </div>
    </div>
</body>
</html>