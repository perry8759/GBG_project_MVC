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
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <c:if test="${dosBean.DOS_ID == null}">
            <h1 class="mb-3 bread">新增場地圖片</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">場地管理頁面 <i class="ion-ios-arrow-forward"></i></a></span>新增場地圖片 <span> <i class="ion-ios-arrow-forward"></i></span></p>
            </c:if>
            
          </div>
        </div>
      </div>
    </section>
    <br>
       <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        
                        <c:forEach var="all_dosp" items="${all_dosp}" varStatus="s">
                        <img src="data:image/jpg;base64,${all_dosp}" style="width: 180px;height: auto;"/>
                        </c:forEach>
                        <br>
                        <br>
                            <!--<form action="DOS_update" method="post" id="DOSform">-->
                        <form:form   modelAttribute="dospBean" method="POST" enctype="multipart/form-data">                                                
                        <caption>
                            <h2>                               
                                    新增圖片
                            </h2>
                        </caption>                    
                       場地照片:<form:input path="uploadImage" type="file" accept=".png"/>
                                                                                                                   
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