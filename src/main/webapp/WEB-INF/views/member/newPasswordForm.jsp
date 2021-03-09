<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>更改密碼</title>
</head>
<body>
	<h1>更改密碼</h1>
		<form method="POST">
			新密碼: <input type="password" name="password">
			${ErrorCode.passwordError}<br><br>
			確認密碼: <input type="password" name="checkPassword">
			${ErrorCode.passwordCheckError}<br><br>
			<input type="submit" value="送出">
		</form>
</body>
</html>