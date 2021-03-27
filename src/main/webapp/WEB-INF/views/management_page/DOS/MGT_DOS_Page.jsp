<!-- 管理場地頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 管理場地頁面 -->
<script src="${pageContext.request.contextPath}/js_index/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">   
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script>
  $(function() {
    $("#tabs").tabs();
  } );
  </script>
</head>
<body>
     <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
     <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <h1 class="mb-3 bread">場地管理</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">後臺主頁 <i class="ion-ios-arrow-forward"></i></a></span> <span>場地管理頁面 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    <br>
      <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" />
       <header>
       </header>
       <br>
                   
       
       
            <div class="row" style="">
                <div class="container">
                    <h3 class="text-center">場地列表</h3>
                    <hr>
                    <div class="container text-left">
                        <a href="DOS_new" class="btn btn-success">加入新場地</a> &nbsp;&nbsp;                                                   
                    </div>
                    <br>
                    <div id="tabs">
                           <ul>
                             
                             
                           </ul>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>場地名稱</th>
                                <th>場地地址</th>
                                <th>場地最大人數</th>
                                <th>場地管理員</th>
                                <th>場地聯絡人</th>
                                <th>場地聯絡人電話</th>
                                <th>場地費用</th>
                                
                                <th>場地運動種類</th>
                                <th>選項</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   列出場地  -->
                            <c:forEach var="dos" items="${AllDOS}">

                                <tr>
                                    <td>
                                        <c:out value="${dos.DOS_NAME}" />
                                    </td>
                                    <td>
                                        <c:out value="${dos.DOS_ADDR}" />
                                    </td>
                                    <td>
                                        <c:out value="${dos.DOS_CY}" />
                                    </td>
                                   
                                     <td>
                                        <c:out value="${dos.DOS_AD}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_OFFICER}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_PHONE}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_PAY}" />
                                    </td>
                                    
                                     <td>
                                        <c:out value="${dos.dos_sport.DOS_SPORT_NAME}" />
                                    </td>
                                    <td><a href="DOS_edit?dosid=${dos.DOS_ID}">編輯</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                    <a href="DOSP_new?dosid=<c:out value='${dos.DOS_ID}' />">新增圖片</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>
                    </table>
                </div>
            </div>    
            
            <!-- loader -->
     
  <script src="${pageContext.request.contextPath}/js_index/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js_index/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/main.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>>                                
        </body>   
</html>