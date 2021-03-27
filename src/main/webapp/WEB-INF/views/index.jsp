<!-- 首頁  03.24-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GBG</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />

     <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/images_index/joey-huang-1_R0BMGwiZI-unsplash.jpg');"
        data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container-fluid px-md-5">
            <div class="row no-gutters slider-text align-items-center js-fullheight justify-content-center"
                data-scrollax-parent="true">
                <div class="col-md-8 ftco-animate d-flex align-items-end">
                    <div class="text w-100 text-center">
                        <h1 class="mb-4"><span> Good </span><span> Base </span>for<span> Game
                            </span><br>讓<span>比賽</span>更簡單
                        </h1>
                        <p><a href="<c:url value='/ACT/chooseSport' />" class="primary-btn">馬上參與</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="clients-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-offers mb-50 wow fadeInUp" data-wow-delay=".2s">
                        <div class="offers-img">
                            <img src="/images/bg-3.jpg" alt="">
                        </div>
                        <div class="offers-cap">
                            <span>1</span>
                            <h3><a href="services.html">尋找場地</a></h3>
                            <p>讓你更簡單快速找到最適合妳舉辦比賽的場地,聯絡方式跟價格都公開透明,讓你在短時間就可以找到一個好場地.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-offers mb-50 wow fadeInUp" data-wow-delay=".4s">
                        <div class="offers-img">
                            <img src="/images/bg-1.jpg" alt="">
                        </div>
                        <div class="offers-cap">
                            <span>2</span>
                            <h3><a href="services.html">舉辦比賽</a></h3>
                            <p>把比賽所需要的表單資料都統整好,只需要簡單輸入就可以舉辦一場比賽,根據你的地點資格等比賽資訊讓參賽者可以更快速的找到適合自己的比賽</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-offers mb-50 wow fadeInUp" data-wow-delay=".6s">
                        <div class="offers-img">
                            <img src="/images/bg-2.jpg" alt="">
                        </div>
                        <div class="offers-cap">
                            <span>3</span>
                            <h3><a href="services.html">即時賽況</a></h3>
                            <p>透過手機就可以知道現場賽況如何,不用特地跑去主辦台前看海報,也可以有效率地知道下一場的對手上一場的表現如何</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>