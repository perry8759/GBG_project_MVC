<!-- 所有場地資訊 使用usebean 因無需要即時更新-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <jsp:useBean id="memberService" class="com.web.GBG_project.DOS.service.impl.DOSServiceImpl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
  <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
   <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <h1 class="mb-3 bread">場地清單</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁 <i class="ion-ios-arrow-forward"></i></a></span> <span>場地清單 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section ftco-degree-bg">
      <div class="container-fluid">
        <div class="position-relative pt-10 pb-8">
            <div class="header-text">
                <div class="d-flex justify-content-center">
                    <form action="#" class="search-box">
                        <div class="input-form">
                            <input type="text" placeholder="想去哪裡打球?">
                        </div>
                        <div class="select-form">
                            <div class="select-itms">
                                <select name="select" id="select1">
                                    <option value="">台北市</option>
                                    <option value="">新北市</option>
                                    <option value="">台南市</option>
                                    <option value="">高雄市s</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-form">
                            <a href="#">Search</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container px-md-0">
        <div class="row">
            <div class="col-12 align-items-stretch">
                <div class="contact-wrap w-100 p-md-5 p-4">
                    <ul class="nav nav-tabs col-12" role="tablist">
                        <li class="nav-item col-4"><a class="nav-link" data-toggle="tab" role="tab" aria-selected="false" href="BasketballDoslist.html">籃球</a></li>
                        <li class="nav-item col-4"><a class="nav-link" data-toggle="tab" role="tab" aria-selected="false" href="Tabletennis.html">桌球</a></li>
                        <li class="nav-item col-4"><a class="nav-link active" data-toggle="tab" role="tab" aria-selected="true" href="VolleyballDoslist.html">排球</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            
                <div class="row">
                <c:forEach var="mem"  varStatus="statusX" items="${DOS}">
                    <div class="col-md-4 d-flex">
                        <div class="site ftco-animate">
                        <c:forEach var="dosp"   items="${mem.dos_pictureee}">
                            <div class="img d-flex align-items-center justify-content-center" style="background-image: url(data:image/jpg;base64,${dosp.DOS_PICTURE_PIC_ONE});">
                                <div class="desc">
                                    <p class="meta-prod d-flex">
                                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-writing"></span></a>
                                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
                                        <a href="DOS_detail?DOSID=${mem.DOS_ID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-view"></span></a>
                                    </p>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="text text-center">
                                <span class="category">${mem.DOS_NAME}</span>
                                <h2>地址:${mem.DOS_ADDR}</h2>
                                <h2>空間人數:${mem.DOS_CY}</h2>
                                <p class="mb-0"><span class="price price">費用:${mem.DOS_PAY}</span></p>
                            </div>
                        </div>
                    </div>
                     </c:forEach>
                </div>
               
                <div class="row mt-5 mb-5">
                    <div class="col text-center">
                    <div class="block-27">
                      <ul>
                        <li><a href="?start=${pre}">&lt;</a></li>
                        <c:forEach items="${allpage}" var="item">
                                 <li><a href="?start=${(item-1)*3}">${item}</a></li>
                        </c:forEach>                      
                        <li><a href="?start=${next}">&gt;</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
    </section>

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