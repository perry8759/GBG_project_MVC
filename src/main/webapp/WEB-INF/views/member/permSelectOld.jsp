<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align: center">選擇會員類型</h1>
	<br>
	<a href="<c:url value='/'/> " >回前頁</a>
	<table border="1" style="margin: 0px auto;">
		<tr>
			<td width="350">
                <a href="registered/normal">一般會員</a>
            </td>
			<td width="350">
                <a href="registered/company">單位會員</a>
            </td>
		</tr>
	
	</table>
</body>
</html>