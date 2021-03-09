<%@page import="java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test home</title>
</head>
<body>
	<h1 style="text-align: center">Member MVC</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<c:if test="${empty LoginOK}">
				<td width="350">
					<a href='loginForm'>登入</a><BR>
				</td>
				<td width="350">
					<p align="left" />
					<a href='forgotPasswordForm'>忘記密碼</a>
					<br>
				</td>
				<td width="350">
					<p align="left" />
					<a href='permSelect'>註冊</a>
					<br>
				</td>
			</c:if>
			<c:if test="${! empty LoginOK}">
				<td width="350"><p align="left" /> 
					<a href='logout'>登出</a><BR>
				</td>
				<td width="350">
					<p align="left" />
					<a href='memberEdit'>修改會員資料</a>
					<br>
				</td>
				<td width="350">
					<p align="left" />
					<a href='editPasswordForm'>修改密碼</a>
					<br>
				</td>
				<td width="350">
					<p align="left" />
					<a href='memberManage'>會員管理</a>
					<br>
				</td>
			</c:if>
		</tr>
	</table>
</body>
</html>
