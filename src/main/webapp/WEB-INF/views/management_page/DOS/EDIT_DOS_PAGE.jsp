<!-- 編輯場地頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
       <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        
                            <!--<form action="DOS_update" method="post" id="DOSform">-->
                        <form:form  method="POST" modelAttribute="dosBean" >
                        
                        

                        <caption>
                            <h2>
                                <c:if test="${dosBean.DOS_ID != null}">
                                    編輯場地
                                </c:if>
                                <c:if test="${dosBean.DOS_ID == null}">
                                    新增場地
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${dosBean.DOS_ID != null}">
                            <form:hidden path="DOS_ID"/>
                            
                        </c:if>

                        <fieldset class="form-group">
                            <label>場地名稱</label> <form:input path="DOS_NAME"  class="form-control"  />
                        </fieldset>

                        <fieldset class="form-group">
                            <label>場地地址</label> <form:input path="DOS_ADDR" class="form-control" />
                        </fieldset>

                        <fieldset class="form-group">
                            <label>場地最大容納人數</label> <form:input path="DOS_CY" class="form-control" />
                        </fieldset>
                        <fieldset class="form-group">
                            <label>場地備註</label> <form:textarea path="DOS_PS" rows="4" cols="50" />
                        </fieldset>
                         <fieldset class="form-group">
                            <label>場地交通資訊</label> <form:textarea path="DOS_TRANS" rows="4" cols="50"/>
                        </fieldset>
                        
                        
                        <label>場地運動種類</label> 
                        
                        <form:select path="dos_sport_id.DOS_SPORT_ID" items="${dos_sport}" itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID">
							
    
						</form:select>
                                                                                                                   
                        <input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
                        </form:form>
                    </div>
                </div>
            </div>
        
</body>
<script>

$("#progressbarTWInput").change(function(){

  readURL(this);

});

 

function readURL(input){

  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {

       $("#preview_progressbarTW_img").attr('src', e.target.result);

    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>
</html>