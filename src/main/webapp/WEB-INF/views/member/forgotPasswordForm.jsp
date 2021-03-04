<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
</head>
<body>
	<form method="POST" action="editPasswordForm">
		請輸入Email信箱：<input type="text" name="email">
		${ErrorCode.EmailError}<br><br>
		
		請輸入帳號：<input type="text" name="account">
		${ErrorCode.AccountError}<br><br>
		${AccountEmailError}<br>
		<input type="submit" value="送出">
	</form>
</body>
</html>