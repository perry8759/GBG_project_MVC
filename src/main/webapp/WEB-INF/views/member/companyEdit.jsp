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
	<h1>單位會員註冊</h1>
	<form:form method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
		帳號: ${LoginOK.member_account}<br><br>
		確認密碼:<form:hidden path="again_pw" value="member_pw"/>
		暱稱:<form:input path="member_user_name"/>
		<form:errors path="member_user_name" cssClass="error"/><br><br>
		單位名稱:${LoginOK.member_real_name}<br><br>
		
		統一編號:${LoginOK.member_tax_id_number}<br><br>
		
		聯絡人姓名:<form:input path="member_cp_name"/>
		<form:errors path="member_cp_name" cssClass="error"/><br><br>
		
		聯絡人性別:<form:select path="member_sex_id.member_sex_id">
			<form:option value="-1" label="請挑選" />
			<form:options  items="${sexList}"
	   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
		</form:select>
		<form:errors path="member_sex_id" cssClass="error"/><br><br>
		頭貼照片:<form:input path="productImage" type="file"/>
		<form:errors path="productImage" cssClass="error"/><br><br>
		聯絡人電子信箱:<form:input path="member_email"/>
		<form:errors path="member_email" cssClass="error"/><br><br>
		聯絡人手機號碼:<form:input path="member_mobile_phone"/>
		<form:errors path="member_mobile_phone" cssClass="error"/><br><br>
		聯絡人市話號碼:<form:input path=""/>
		<form:errors path="" cssClass="error"/><br><br>
		地址:<form:input path="member_address"/>
		<form:errors path="" cssClass="error"/><br><br>
		<form:hidden path="member_perm_id.member_perm_id" value="2"/>
		<form:hidden path="manage_status_id.manage_status_id" value="1"/>
		<input type="submit" value="Save">
	</form:form>
	<br>
	<a href="<c:url value='/'/> " >回前頁</a>
</body>
</html>