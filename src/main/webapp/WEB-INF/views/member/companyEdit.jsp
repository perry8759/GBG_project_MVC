<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>修改會員資料</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/Alter_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <!-- -------------------------------------------------------------------------------------------------- -->
	<div class="signup">    
        <form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
        <h2>修改會員資料</h2>
        <div class="all-group">

            <img style="margin-top: 100px;" width='200' height='200' src="<c:url value='getPicture' />" />

            <div class="group">
                            
                <label>帳號:</label>
                <p>
                    ${LoginOK.member_account}
                </p><br>

                <label>暱稱:</label>
                <p>
                    <form:input path="member_user_name" class="form-control"/>
                    <form:errors path="member_user_name" cssClass="error"/>
                </p><br>

                <label>單位名稱:</label>
                <p>
                    ${LoginOK.member_real_name}
                </p><br>

                <label>統一編號:</label>
                <p>
                    ${LoginOK.member_tax_id_number}
                </p><br>

                <label>聯絡人姓名:</label>
                <p>
                    <form:input path="member_cp_name" class="form-control"/>
				    <form:errors path="member_cp_name" cssClass="error"/><br>
                </p><br>
                

                <label>聯絡人性別:</label>
                <p>
                    <form:select path="member_sex_id.member_sex_id" class="form-control">
					    <form:option value="-1" label="請挑選" style="width: 190px;"/>
					    <form:options  items="${sexList}" itemLabel='member_sex_name' itemValue='member_sex_id'/>
				    </form:select>
                </p><br>

                <label>頭貼照片:</label>
                <p>
                    <form:input path="productImage" type="file" accept=".png" class="form-control" style="width: 190px;"/>
                    <form:errors path="productImage" cssClass="error"/>
                </p>


            </div>

            <div class="group1">

                <label>聯絡人電子信箱:</label>
                <p>
                    <form:input path="member_email" class="form-control"/> 
                    <form:errors path="member_email" cssClass="error"/>
                </p><br>

                <label>聯絡人手機號碼:</label>
                <p>
                    <form:input path="member_mobile_phone" class="form-control"/>
                    <form:errors path="member_mobile_phone" cssClass="error"/>
                </p><br>

                <label>聯絡人市話號碼:</label>
                <p>
                    <form:input path="member_fixed_line_telephone" class="form-control"/>
                    <form:errors path="member_fixed_line_telephone" cssClass="error"/>
                </p><br>
                
                <label>地址:</label>
                <p>
                    <form:input path="member_address" class="form-control"/>
                    <form:errors path="member_address" cssClass="error"/>
                </p>
                <input type="submit" class="btn" value="送出">

            </div>
        </div>
        </form:form>
    </div>


    <script>
         $(function (){
 
 function format_float(num, pos)
 {
     var size = Math.pow(10, pos);
     return Math.round(num * size) / size;
 }

 function preview(input) {

     if (input.files && input.files[0]) {
         var reader = new FileReader();
         
         reader.onload = function (e) {
             $('.preview').attr('src', e.target.result);
             var KB = format_float(e.total / 1024, 2);
             $('.size').text("檔案大小：" + KB + " KB");
         }

         reader.readAsDataURL(input.files[0]);
     }
 }

 $("body").on("change", ".upl", function (){
     preview(this);
 })
 
})
    </script>

</body>
</html>