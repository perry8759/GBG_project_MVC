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
    <title>單位會員註冊</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/SignUp_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <div class="signup">
		<form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
			<h2 id="dataButton">單位會員註冊</h2>
			<div class="all-group">
				<div class="group">
					帳號: <form:input id="member_account" path="member_account" class="form-controls"/>
					<span style="color: red"><form:errors path="member_account" cssClass="error"/></span><br>
					密碼: <form:password id="member_pw" path="member_pw" class="form-controls"/>  
					<span style="color: red"><form:errors path="member_pw" cssClass="error"/></span><br>
					確認密碼:<form:password id="again_pw" path="again_pw" class="form-controls"/>
					<span style="color: red"><form:errors path="again_pw" cssClass="error"/></span><br>
					單位名稱:<form:input id="member_real_name" path="member_real_name" class="form-controls"/>
					<span style="color: red"><form:errors path="member_real_name" cssClass="error"/></span><br>
					統一編號:<form:input id="member_tax_id_number" path="member_tax_id_number" class="form-controls"/>
					<span style="color: red"><form:errors path="member_tax_id_number" cssClass="error"/></span><br>
					地址:<form:input id="member_address" path="member_address" class="form-controls"/>
					<span style="color: red"><form:errors path="" cssClass="error"/></span><br>
					頭貼照片:<form:input path="productImage" type="file" accept=".png" class="form-controls" style="width: 190px;"/>
					<span style="color: red"><form:errors path="productImage" cssClass="error"/></span><br>
				</div>
				<div class="group1">
					暱稱:<form:input id="member_user_name" path="member_user_name" class="form-controls"/>
					<span style="color: red"><form:errors path="member_user_name" cssClass="error"/></span><br>
					聯絡人姓名:<form:input id="member_cp_name" path="member_cp_name" class="form-controls"/>
					<span style="color: red"><form:errors path="member_cp_name" cssClass="error"/></span><br>
					聯絡人性別:<form:select id="member_sex_id" path="member_sex_id.member_sex_id" class="form-controls" style="width: 190px;">
						<form:option value="-1" label="請挑選" />
						<form:options  items="${sexList}"
				   	  	       itemLabel='member_sex_name' itemValue='member_sex_id'/>
					</form:select>
					<span style="color: red"><form:errors path="member_sex_id" cssClass="error"/></span><br>
					聯絡人電子信箱:<form:input id="member_email" path="member_email" class="form-controls"/>
					<span style="color: red"><form:errors path="member_email" cssClass="error"/></span><br>
					聯絡人手機號碼:<form:input id="member_mobile_phone" path="member_mobile_phone" class="form-controls"/>
					<span style="color: red"><form:errors path="member_mobile_phone" cssClass="error"/></span><br>
					聯絡人市話號碼:<form:input id="member_fixed_line_telephone" path="member_fixed_line_telephone" class="form-controls"/>
					<span style="color: red"><form:errors path="member_fixed_line_telephone" cssClass="error"/></span><br>
					<input type="submit" class="btn" value="送出">
				</div>
			</div>
		</form:form>
	</div>
</body>
	<script>
		//一鍵輸入資料功能
        $(document).ready(function(){
	         $('#dataButton').click(function(){
	               $('#member_account').attr('value',"gbgtest101");
	         });
	         $('#dataButton').click(function(){
	               $('#member_pw').attr('value',"gbgtest101");
	         });
	         $('#dataButton').click(function(){
	               $('#again_pw').attr('value',"gbgtest101");
	         });
	         $('#dataButton').click(function(){
	               $('#member_real_name').attr('value',"台北體育協會");
	         });
	         $('#dataButton').click(function(){
	               $('#member_tax_id_number').attr('value',"33598746");
	         });
	         $('#dataButton').click(function(){
	               $('#member_address').attr('value',"105台北市松山區南京東路四段10號");
	         });
	         $('#dataButton').click(function(){
	               $('#member_user_name').attr('value',"體育小編");
	         });
	         $('#dataButton').click(function(){
	               $('#member_cp_name').attr('value',"王大強");
	         });
	         $('#dataButton').click(function(){
	               $('#member_email').attr('value',"perry8759@gmail.com");
	         });
	         $('#dataButton').click(function(){
	               $('#member_mobile_phone').attr('value',"0974685078");
	         });
        });
     </script>
</html>