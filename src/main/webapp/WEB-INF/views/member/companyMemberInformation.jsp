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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Mainpage_Style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <div class="box">
        <!-- <c:forEach var='member' items='${member}'></c:forEach> -->
        <div class="signup">    
        <form class="form">
        <h2>單位會員主頁</h2>
        <div class="all-group">
            <div class="group">
                帳號:<br>
                    <!-- <input type="member_account" class="form-control" name="member_account" value=""> -->
                    ${LoginOK.member_account}<br><br>
                單位名稱:<br>
                    <!-- <input type=" member_real_name" class="form-control" name=" member_real_name" value=""> -->
                    ${LoginOK.member_real_name}<br><br>
                暱稱:<br>
                    <!-- <input type="member_user_name" class="form-control" name="member_user_name"> -->
                    ${LoginOK.member_user_name}<br><br>
                統一編號:<br>
                    <!-- <input type="member_tax_id_number" class="form-control" name="member_tax_id_number" value=""> -->
                    ${LoginOK.member_tax_id_number}<br><br>
                    <!-- <input type="member_member_image" class="form-control" name="member_member_image" value="">  -->
                    <img class="preview" width='300px' height='500px' src="<c:url value='getPicture' />" />
            </div>
            <div class="group1">
                地址:<br>
                    <!-- <input type="member_address" class="form-control" name="member_address" value="">  -->
                    ${LoginOK.member_address}<br><br>
                聯絡人性別:<br>
                    <!-- <input type="member_sex_id" class="form-control" name="member_sex_id"> -->
                    ${LoginOK.member_sex_id.member_sex_name}<br><br>
                聯絡人電子信箱:<br>
                    <!-- <input type="member_email" class="form-control" name=" member_email">  -->
                    ${LoginOK.member_email}<br><br>
                聯絡人手機號碼:<br>
                    <!-- <input type="member_mobile_phone" class="form-control" name="member_mobile_phone"> -->
                    ${LoginOK.member_mobile_phone}<br><br>
<!--                 聯絡人市話號碼: -->
                    <!-- <input type="member_fixed_line_telephone" class="form-control" name="member_fixed_line_telephone">  -->
<%--                     <p>${LoginOK.member_fixed_line_telephone}</p> --%>
            </div> 
        </div>    
        </form>
    </div>
    </div>
</body>
</html>