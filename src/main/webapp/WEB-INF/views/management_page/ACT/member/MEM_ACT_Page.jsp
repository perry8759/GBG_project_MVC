<!-- 管理活動頁面 -->
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
<script src="${pageContext.request.contextPath}/css/jquery.js"></script>
<script>
  $(function() {
    $("#tabs").tabs();
  } );
  </script>
</head>
<body>

    <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
    
<%--      <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" /> --%>
     <section class="hero-wrap hero-wrap-2"
        style="background-image: url('${pageContext.request.contextPath}/images_index/dylan-gillis-KdeqA3aTnBY-unsplash.jpg');"
        data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">活動管理</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">會員主頁 <i
                                    class="ion-ios-arrow-forward"></i></a></span> <span>活動管理 </span>
                    </p>
                </div>
            </div>
        </div>
    </section>
<%--      <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" /> --%>

<!--             <div class="row" style="float:left;"> -->
            
            <section class="ftco-section act_main_list">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="act_title col-md-7 text-center heading-section ftco-animate">

                    <h2 class="mb-4">我舉辦/參加的活動</h2>
                </div>
            </div>
            <div class="row justify-content-center mb-5">
                <div class="col-12 act_box">
                    <div class="container">
                        <div class="row justify-content-center mbt-5">
                            <c:forEach var="act" items="${AllACT}"> 
                            <div class="col-3 offset-md-1 act_mgt_main active">
                                <div class="act_main_img">
                                    <img src="${pageContext.request.contextPath}/images_index/joey-huang-1_R0BMGwiZI-unsplash.jpg" alt="">
                                </div>
                                <div class="cont">
                                    <h4 class="title fadeInUp">${act.ACT_TITLE}<a href="#"></a></h4>
                                    <ul class="desc fadeInUp">
                                        
                                        <li><a href="<c:url value='/ACT/ActEdit?actid=${act.ACT_ID}'/>">修改活動資訊</a></li>
                                        <li><a href="<c:url value='/ACT/CheckRegTeamState?actid=${act.ACT_ID}'/>">查看已報名隊伍</a></li>
                                        <li><a href="<c:url value='/ACT/EditActNew?actid=${act.ACT_ID}'/>">修改活動資訊</a></li>
                                        <li><a href="<c:url value='/MATCH_ACT_AllTeam?actid=${act.ACT_ID}'/>">新增/查看賽事資訊</a></li>
                                    </ul>
                                </div>
                            </div>
                            </c:forEach>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
            
            
<!--                 <div class="container"> -->
                
<!--                     <h3 class="text-center">主辦活動列表</h3> -->
<!--                     <hr>                   -->
<!--                     <br> -->
<!--                     <div id="tabs"> -->
<!--                            <ul> -->
<!--                              <li><a href="#tabs-1">報名進行中</a></li> -->
<!--                              <li><a href="#tabs-2">活動進行中</a></li> -->
<!--                              <li><a href="#tabs-3">已結束</a></li> -->
<!--                              篩選功能還未做 -->
<!--                            </ul> -->
<!--                     </div> -->
<!--                     <table class="table table-bordered"> -->
<!--                         <thead> -->
<!--                             <tr> -->
<!--                                 <th>活動標題</th>                               -->
<!--                                 <th>活動目前狀態</th>                                -->
                                
<!--                                 <th>選項</th> -->
<!--                             </tr> -->
<!--                         </thead> -->
<!--                         <tbody> -->
<%--                             <c:forEach var="act" items="${AllACT}"> --%>

<!--                                 <tr> -->
<!--                                     <td> -->
<%--                                     <a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>"> --%>
<%--                                         <c:out value="${act.ACT_TITLE}" /></a> --%>
<!--                                     </td>                                -->
<!--                                     <td> -->
<%--                                         <c:out value="${act.act_status.ACT_STATUS_NAME}" /> --%>
<!--                                     </td>      -->
<!--                                     <td> -->
<%--                                     <a href="<c:url value='/ACT/ActEdit?actid=${act.ACT_ID}'/>">修改活動資訊</a> --%>
<!--                                     &nbsp;&nbsp; -->
<%--                                     <a href="<c:url value='/ACT/CheckRegTeamState?actid=${act.ACT_ID}'/>">查看已報名隊伍</a> --%>
<%--                                     <a href="<c:url value='/ACT/EditActNew?actid=${act.ACT_ID}'/>">修改活動公告</a> --%>
<%--                                      <a href="<c:url value='/MATCH_ACT_AllTeam?actid=${act.ACT_ID}'/>">新增/查看賽事資訊</a> --%>
<!--                                     </td> -->
<!--                               </tr>       -->
<%--                             </c:forEach> --%>
							
<!--                             } -->
<!--                         </tbody> -->

<!--                     </table> -->
<!--                 </div> -->
<!--             </div> -->
           <!-- loader -->
          <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">關於015-2</h2>
              <p>Each team member work every hard</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">還沒想到寫什麼</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>這個沒想到</a></li>
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>這個也是</a></li>
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>還是沒想到</a></li>
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>可能快想到</a></li>
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>可能想不到了</a></li>
                <li><a href="#" class="py-1 d-block"><span class="ion-ios-arrow-forward mr-3"></span>應該不會想了</a></li>

              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Business Hours</h2>
              <div class="opening-hours">
              	<h4>Opening Days:</h4>
              	<p class="pl-3">
              		<span>Monday – Friday : 9am to 17 pm</span>
              		<span>Saturday :no one wnat work on Saturday</span>
              	</p>
              	<h4>Vacations:</h4>
              	<p class="pl-3">
              		<span>Every day are our vacations</span>
              		<span>We dont want work everyday</span>
              	</p>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">National Taipei University of Technology Guanghua 
                  embassy 2f 217 but you cant find us when you go</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">We dont have phone</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">Neitherofuswashavingemail@gmail.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

           </section>
    Copyright &copy;<script>
    document.write(new Date().getFullYear());
    </script> All rights reserved | This template is made with
    <!-- loader -->
          </div>
        </div>
      </div>
    </footer>
          <script src="${pageContext.request.contextPath}/js_index/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery-migrate-3.0.1.min.js"></script>
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
  <script src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>    
  <script>
        </body>
        
</html>