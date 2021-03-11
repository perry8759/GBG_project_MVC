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
    <title>一般會員註冊</title>
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/SignUp_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
<!-- ================================================ -->
	<div class="signup">
		<form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
			<h2>一般會員註冊</h2>
			<div class="all-group">
				<div class="group">
					帳號: <form:input path="member_account" class="form-control"/>
					<span style="color: red"><form:errors path="member_account" cssClass="error"/></span><br>
					密碼: <form:password path="member_pw" class="form-control"/>  
					<span style="color: red"><form:errors path="member_pw" cssClass="error"/></span><br>
					確認密碼:<form:password path="again_pw" class="form-control"/>
					<span style="color: red"><form:errors path="again_pw" cssClass="error"/></span><br>
					真實姓名:<form:input path="member_real_name" class="form-control"/>
					<span style="color: red"><form:errors path="member_real_name" cssClass="error"/></span><br>
					暱稱:<form:input path="member_user_name" class="form-control"/>
					<span style="color: red"><form:errors path="member_user_name" cssClass="error"/></span><br>
					性別:<form:select path="member_sex_id.member_sex_id" class="form-control">
						<form:option value="-1" label="請選擇" />
						<form:options  items="${sexList}"
				   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
					</form:select>
					<span style="color: red"><form:errors path="member_sex_id" cssClass="error"/></span><br>
					頭貼照片:<form:input path="productImage" type="file" accept=".png" class="form-control" style="width: 186px;"/>
					<span style="color: red"><form:errors path="productImage" cssClass="error"/></span><br>
				</div>
				<div class="group1">
					電子信箱:<form:input path="member_email" class="form-control"/>
					<span style="color: red"><form:errors path="member_email" cssClass="error"/></span><br>
					手機號碼:<form:input path="member_mobile_phone" class="form-control"/>
					<span style="color: red"><form:errors path="member_mobile_phone" cssClass="error"/></span><br>
					市話號碼:<form:input path="member_fixed_line_telephone" class="form-control"/>
					<span style="color: red"><form:errors path="member_fixed_line_telephone" cssClass="error"/></span><br>
					出生日期:<form:input path="member_birthday" class="form-control" style="width: 186px;" type="date" max="${toDate}"/>
					<span style="color: red"><form:errors path="member_birthday" cssClass="error"/></span><br>
					地址:<form:input path="member_address" class="form-control"/>
					<span style="color: red"><form:errors path="" cssClass="error"/></span>
					<input type="submit" value="送出" class="btn">
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>