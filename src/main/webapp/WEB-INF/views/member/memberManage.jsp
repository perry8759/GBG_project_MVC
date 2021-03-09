<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員管理</title>
</head>
<body>
	<h1 align="center">會員管理</h1>
	<table border="1">
		<tr>
			<th>會員編號</th>
			<th>帳號</th>
			<th>帳號狀態</th>
		</tr>
		<c:forEach varStatus="vs" var="i" items="${memberList}">
			<tr>
				<td>${i.member_id}</td>
				<td>${i.member_account}</td>
				<form:form method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
					<td>
						<form:select path="manage_status_id.manage_status_id">
							<form:options items="${manageStatusList}" itemLabel='manage_status_name' itemValue='manage_status_id'/>
						</form:select>
					</td>
				</form:form>
			</tr>
		</c:forEach>
	</table>
</body>
</html>