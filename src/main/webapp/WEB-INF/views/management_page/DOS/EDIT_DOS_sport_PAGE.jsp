<!-- 編輯運動種類頁面 -->
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
                        <form:form  method="POST" modelAttribute="dossportBean" >

                        <caption>
                            <h2>
                                <c:if test="${dossportBean.DOS_SPORT_ID != null}">
                                    編輯運動種類
                                </c:if>
                                <c:if test="${dossportBean.DOS_SPORT_ID == null}">
                                    新增運動種類
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${dossportBean.DOS_SPORT_ID != null}">
                            <form:hidden path="DOS_SPORT_ID"/>
                        </c:if>

                        <fieldset class="form-group">
                            <label>運動種類名稱</label> <form:input path="DOS_SPORT_NAME"  class="form-control"  />
                        </fieldset>                            
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