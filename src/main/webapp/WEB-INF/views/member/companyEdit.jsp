<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>修改會員資料</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/SignUp_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <!-- -------------------------------------------------------------------------------------------------- -->
	<div class="signup">
		<form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
			<h2>修改會員資料</h2>
			<div class="all-group">
				<div class="group">
					帳號: ${LoginOK.member_account}<br>
					暱稱: <form:input path="member_user_name" class="form-control"/>
					<form:errors path="member_user_name" cssClass="error"/><br>
					單位名稱: ${LoginOK.member_real_name}<br>
					統一編號: ${LoginOK.member_tax_id_number}<br>
					聯絡人姓名: <form:input path="member_cp_name" class="form-control"/>
					<form:errors path="member_cp_name" cssClass="error"/><br>
					聯絡人性別: <form:select path="member_sex_id.member_sex_id" class="form-control">
						<form:option value="-1" label="請挑選" style="width: 190px;"/>
						<form:options  items="${sexList}"
				   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
					</form:select>
					<form:errors path="member_sex_id" cssClass="error"/><br>
					頭貼照片: <form:input path="productImage" type="file" accept=".png" class="form-control" style="width: 190px;"/>
					<form:errors path="productImage" cssClass="error"/><br>
					<img width='100' height='200' src="<c:url value='getPicture' />" /><br>
				</div>
				<div class="group1">
					聯絡人電子信箱: <form:input path="member_email" class="form-control"/>
					<form:errors path="member_email" cssClass="error"/><br>
					聯絡人手機號碼: <form:input path="member_mobile_phone" class="form-control"/>
					<form:errors path="member_mobile_phone" cssClass="error"/><br>
					聯絡人市話號碼: <form:input path="member_fixed_line_telephone" class="form-control"/>
					<form:errors path="member_fixed_line_telephone" cssClass="error"/><br>
					地址:<form:input path="member_address" class="form-control"/>
					<form:errors path="member_address" cssClass="error"/><br>
					<input type="submit" class="btn" value="送出">
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>