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
<%
	/* Enumeration<String> e = request.getAttributeNames();
	while (e.hasMoreElements()) {
		String name = e.nextElement();
		Object o = request.getAttribute(name);
		
		out.println(name + "==>" + o + "<hr>");
	} */

%>
<body>
	<h1 style="text-align: center">Member MVC</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> 
				<c:if test="${! empty LoginOK}">
					<a href='logout'>登出</a><BR>
				</c:if>
				<c:if test="${empty LoginOK}">
					<a href='loginForm'>登入</a><BR>
				</c:if>
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
			<c:if test="${! empty LoginOK}">
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
			</c:if>
		</tr>
	</table>
</body>
</html>
