<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>修改會員資料</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/SignUp_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<title>更改密碼</title>
</head>
<body>
	<div class="signup" style="width: 400px;height: 500px;margin-top: 100px">
		<form class="form" method="POST" style="width: 200px;height: 300px">
			<h2>新密碼</h2>
			<div class="all-group">
				<div class="group">
					新密碼: <input type="password" name="password"  class="form-control">
					<span style="color: red;">${ErrorCode.passwordError}</span><br><br>
					確認密碼: <input type="password" name="checkPassword"  class="form-control">
					<span style="color: red;">${ErrorCode.passwordCheckError}</span><br><br>
					<input type="submit" value="送出" class="btn" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>