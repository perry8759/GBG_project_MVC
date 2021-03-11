<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>忘記密碼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/AlterPwd_Style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <!-- ----------------------------------------------------------------------------------------------------- -->
	<div class="box">
        <div class="signup">
			<form class="form" method="POST" action="editPasswordForm">
				<h2>忘記密碼</h2>
				<div class="group">
					請輸入Email信箱：<input type="text" name="email">
					<span style="color: red">${ErrorCode.EmailError}</span>
					<br><br>
					
					請輸入帳號：<input type="text" name="account">
					<span style="color: red">${ErrorCode.AccountError}</span><br>
					<span style="color: red">${AccountEmailError}</span><br>
					<input type="submit" value="送出" class="btn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>