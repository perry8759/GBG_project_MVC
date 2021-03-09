<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST">
		舊密碼: <input type="password" name="oldPassword">
		${errorCode.oldPasswordError}
		${checkPasswordError}<br><br>
		新密碼: <input type="password" name="newPassword">
		${errorCode.newPasswordError}<br><br>
		確認新密碼: <input type="password" name="checkNewPassword">
		${checkPasswordError}<br><br>
		<input type="submit" value="送出">
	</form>
	<br>
	<a href="<c:url value='/'/> " >回前頁</a>
</body>
</html>