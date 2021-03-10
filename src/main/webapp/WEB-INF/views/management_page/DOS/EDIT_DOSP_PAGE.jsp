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
<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
       <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        
                            <!--<form action="DOS_update" method="post" id="DOSform">-->
                        <form:form   modelAttribute="dospBean" method="POST" enctype="multipart/form-data">
                        
                        

                        <caption>
                            <h2>
                                <c:if test="${dosBean.DOS_ID != null}">
                                    編輯圖片
                                </c:if>
                                <c:if test="${dosBean.DOS_ID == null}">
                                    新增圖片
                                </c:if>
                            </h2>
                        </caption>

                       

                       頭貼照片:<form:input path="uploadImage" type="file" accept=".png"/>
                                                                                                                   
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