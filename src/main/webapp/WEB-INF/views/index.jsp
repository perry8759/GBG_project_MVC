<!-- demo主頁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<a href="member/index">member test</a>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
      
       <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/images_index/joey-huang-1_R0BMGwiZI-unsplash.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container-fluid px-md-5">
            <div class="row no-gutters slider-text align-items-center js-fullheight justify-content-center" data-scrollax-parent="true">
                <div class="col-md-8 ftco-animate d-flex align-items-end">
                    <div class="text w-100 text-center">
                        <h1 class="mb-4"><span> Good </span><span> Base </span>for<span> Game </span><br>讓<span>比賽</span>更簡單
                        </h1>
                        <p><a href="#" class="primary-btn">馬上參與</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <section class="features-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-end">
                <div class="features-area-first col-12 col-sm-6 col-lg-3">
                    <div class="single-features-area mb-100 ftco-animate">
                        <!-- Section Heading -->
                        <div class="section-heading">
                            <div class="line"></div>
                            <p>我們可以提供甚麼幫助</p>
                            <h2>我們的宗旨</h2>
                        </div>
                        <h6>我們想要讓舉辦比賽變得更簡單,出租跟租借場地變得不用那麼麻煩,尋找打球的夥伴不用東奔西跑</h6>
                       
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-features-area mb-100 ftco-animate">
                        <img src="${pageContext.request.contextPath}/images_index/jeff-finley-a27ew3n2Rd4-unsplash.jpg" alt="">
                        <h5>租借場地</h5>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-features-area mb-100 wow ftco-animate" data-wow-delay="500ms">
                        <img src="${pageContext.request.contextPath}/images_index/bg-1.jpg" alt="">
                        <h5>舉辦比賽</h5>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-features-area mb-100 wow ftco-animate" data-wow-delay="1700ms">
                        <img src="${pageContext.request.contextPath}/images_index/bg-img/4.jpg" alt="">
                        <h5>誠徵球友</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    Copyright &copy;<script>
    document.write(new Date().getFullYear());
    </script> All rights reserved | This template is made with
     <!-- loader -->
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
</body>
</html>