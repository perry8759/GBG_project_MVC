<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>註冊會員</title>
</head>
<body>
	<h1>一般會員註冊</h1>
	<form:form method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
		帳號: <form:input path="member_account"/>
		<form:errors path="member_account" cssClass="error"/><br><br>
		密碼: <form:password path="member_pw"/>  
		<form:errors path="member_pw" cssClass="error"/><br><br>
		確認密碼:<form:password path="again_pw"/>
		<form:errors path="again_pw" cssClass="error"/><br><br>
		真實姓名:<form:input path="member_real_name"/>
		<form:errors path="member_real_name" cssClass="error"/><br><br>
		暱稱:<form:input path="member_user_name"/>
		<form:errors path="member_user_name" cssClass="error"/><br><br>
		性別:<form:select path="member_sex_id.member_sex_id">
			<form:option value="-1" label="請挑選" />
			<form:options  items="${sexList}"
	   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
		</form:select>
		<form:errors path="member_sex_id" cssClass="error"/><br><br>
		頭貼照片:<form:input path="productImage" type="file" accept=".png"/>
		<form:errors path="productImage" cssClass="error"/><br><br>
		電子信箱:<form:input path="member_email"/>
		<form:errors path="member_email" cssClass="error"/><br><br>
		手機號碼:<form:input path="member_mobile_phone"/>
		<form:errors path="member_mobile_phone" cssClass="error"/><br><br>
		市話號碼:<form:input path="member_fixed_line_telephone"/>
		<form:errors path="member_fixed_line_telephone" cssClass="error"/><br><br>
		出生日期:<form:input path="member_birthday"/>
		<form:errors path="member_birthday" cssClass="error"/><br><br>
		地址:<form:input path="member_address"/>
		<form:errors path="" cssClass="error"/><br><br>
		<input type="submit" value="submit">
	</form:form>
	<br>
	<a href="<c:url value='/'/> " >回前頁</a>
</body>
</html>