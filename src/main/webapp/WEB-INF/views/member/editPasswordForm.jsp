<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>更改密碼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/AlterPwd_Style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <div class="box">
        <div class="signup">    
        <form class="form" method="POST">
            <h2>更改密碼</h2>
            <div class="group">
                舊密碼:
                    <input type="password" class="form-control" name="oldPassword">
                    <span style="color: red">${errorCode.oldPasswordError}</span>
					<span style="color: red">${checkPasswordError}</span><br><br>
                新密碼:
                    <input type="password" class="form-control" name="newPassword">
                    <span style="color: red">${errorCode.newPasswordError}</span><br><br>
                確認新密碼:
                    <input type="password" class="form-control" name="checkNewPassword">
                    <span style="color: red">${errorCode.newPasswordCheckError}</span>
                    <input type="submit" name="submit" class="btn" value="送出">                
            </div>   
        </form>
    </div>
    </div>
</body>
</html>