<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>單位會員註冊</title>
    <link rel="stylesheet" href="/GBG_project_mvc/css/SignUp_Style1.css">
    <link rel="stylesheet" href="/GBG_project_mvc/css/Header_style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
    <!-- -------------------------------------------------------------------------------------------------- -->
    <div class="signup">
		<form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
			<h2>單位會員註冊</h2>
			<div class="all-group">
				<div class="group">
					帳號: <form:input path="member_account" class="form-control"/>
					<span style="color: red"><form:errors path="member_account" cssClass="error"/></span><br>
					密碼: <form:password path="member_pw" class="form-control"/>  
					<span style="color: red"><form:errors path="member_pw" cssClass="error"/></span><br>
					確認密碼:<form:password path="again_pw" class="form-control"/>
					<span style="color: red"><form:errors path="again_pw" cssClass="error"/></span><br>
					單位名稱:<form:input path="member_real_name" class="form-control"/>
					<span style="color: red"><form:errors path="member_real_name" cssClass="error"/></span><br>
					統一編號:<form:input path="member_tax_id_number" class="form-control"/>
					<span style="color: red"><form:errors path="member_tax_id_number" cssClass="error"/></span><br>
					地址:<form:input path="member_address" class="form-control"/>
					<span style="color: red"><form:errors path="" cssClass="error"/></span><br>
					頭貼照片:<form:input path="productImage" type="file" accept=".png" class="form-control" style="width: 190px;"/>
					<span style="color: red"><form:errors path="productImage" cssClass="error"/></span><br>
				</div>
				<div class="group1">
					暱稱:<form:input path="member_user_name" class="form-control"/>
					<span style="color: red"><form:errors path="member_user_name" cssClass="error"/></span><br>
					聯絡人姓名:<form:input path="member_cp_name" class="form-control"/>
					<span style="color: red"><form:errors path="member_cp_name" cssClass="error"/></span><br>
					
					聯絡人性別:<form:select path="member_sex_id.member_sex_id" class="form-control" style="width: 190px;">
						<form:option value="-1" label="請挑選" />
						<form:options  items="${sexList}"
				   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
					</form:select>
					<span style="color: red"><form:errors path="member_sex_id" cssClass="error"/></span><br>
					
					聯絡人電子信箱:<form:input path="member_email" class="form-control"/>
					<span style="color: red"><form:errors path="member_email" cssClass="error"/></span><br>
					聯絡人手機號碼:<form:input path="member_mobile_phone" class="form-control"/>
					<span style="color: red"><form:errors path="member_mobile_phone" cssClass="error"/></span><br>
					聯絡人市話號碼:<form:input path="member_fixed_line_telephone" class="form-control"/>
					<span style="color: red"><form:errors path="member_fixed_line_telephone" cssClass="error"/></span><br>
					<input type="submit" class="btn" value="送出">
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>