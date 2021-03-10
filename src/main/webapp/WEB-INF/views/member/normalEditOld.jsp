<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>
</head>
<body>
	<h1>會員中心</h1>
	<form:form method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
		<img width='100' height='200' src="<c:url value='getPicture' />" /><br><br>
		帳號: ${LoginOK.member_account}<br><br>
		真實姓名: ${LoginOK.member_real_name}<br><br>
		暱稱: <form:input path="member_user_name"/>
		<form:errors path="member_user_name" cssClass="error"/><br><br>
		性別: ${LoginOK.member_sex_id.member_sex_name}<br><br>
		頭貼照片:<form:input path="productImage" type="file" accept=".png"/>
		<form:errors path="productImage" cssClass="error"/><br><br>
		電子信箱:<form:input path="member_email"/>
		<form:errors path="member_email" cssClass="error"/><br><br>
		手機號碼:<form:input path="member_mobile_phone"/>
		<form:errors path="member_mobile_phone" cssClass="error"/><br><br>
		市話號碼:<form:input path="member_fixed_line_telephone"/>
		<form:errors path="member_fixed_line_telephone" cssClass="error"/><br><br>
		出生日期: ${LoginOK.member_birthday}<br><br>
		地址:<form:input path="member_address"/>
		<form:errors path="member_address" cssClass="error"/><br><br>
		<input type="submit" value="submit">
	</form:form>
	<br>
	<a href="<c:url value='/'/> " >回前頁</a>
</body>
</html>