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
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

<title>Insert title here</title>
<script>
  $(function() {
    $("#tabs").tabs();
  } );
  </script>
</head>
<body>
      <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
      <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            
            <h1 class="mb-3 bread">新增場地</h1>
            
          </div>
        </div>
      </div>
    </section>
      <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" />
       <header>
       </header>
       <br>
                   
       <a href="<c:url value='/DOS/DOS_list' />" ><p class="text-center">場地列表</p></a>
       <a href="<c:url value='/DOS/DOS_sport_list' />" ><p class="text-center">場地運動種類列表</p></a>
       
            <div class="row" style="float:left;">
                <div class="container">
                    <h3 class="text-center">場地列表</h3>
                    <hr>
                    <div class="container text-left">
                        <a href="DOS_new" class="btn btn-success">加入新場地</a>                      
                    </div>
                    <br/>
                    <div id="tabs">
                           <ul>
                             <li><a href="#tabs-1">籃球場地</a></li>
                             <li><a href="#tabs-2">羽球場地</a></li>
                             
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
                                <th>場地備註</th>
                                <th>場地交通資訊</th>
                                <th>場地運動種類</th>
                                <th>Actions</th>
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
                                        <c:out value="${dos.DOS_PS}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_TRANS}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.dos_sport_id.DOS_SPORT_NAME}" />
                                    </td>
                                    <td><a href="DOS_edit?dosid=${dos.DOS_ID}">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="DOS_delete?dosid=<c:out value='${dos.DOS_ID}' />">Delete</a>
                                    <a href="DOSP_new?dosid=<c:out value='${dos.DOS_ID}' />">新增圖片</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>
                    </table>
                </div>
            </div>    
            
         <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
          
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>                                
        </body>
        
       
</html>