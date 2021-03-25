<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>賽事</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	<!-- END header -->
	 <section class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value="/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg"/>');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
      <div class="row no-gutters slider-text align-items-end justify-content-center">
        <div class="col-md-9 ftco-animate pb-5 text-center">
          <h1 class="mb-3 bread">運動種類</h1>
          <p class="breadcrumbs"><span class="mr-2"><a href="<c:url value="/"/>">首頁 <i
                  class="ion-ios-arrow-forward"></i></a></span> <span>選擇球類</i></span>
          </p>
        </div>
      </div>
    </div>
  </section>
  <section class="sport_select">
    <div class="container">
      
      <div class="row d-flex">
        <div class="col-md-12 portfolio-wrap">
          <div class="row sport_list d-flex align-items-center">
            <a href="<c:url value='/ACT/ACT_Main?sportid=1' />"
              class="col-md-6 sport_img image-popup js-fullheight d-flex align-items-center justify-content-center">
              <img src="<c:url value="/images_index/select-basketball.jpg"/>"></a>
            <div class="col-md-5 sport_info">
              <div class="desc text-md-right"></div>
              <div class="sport_title"><a href="<c:url value='/ACT/ACT_Main?sportid=1' />"><span>籃球</span></a></div>
              <div class="sport_content">
<!--                 <a href="#"> -->
<!--                   <h5>師大盃</h5> -->
<!--                 </a> -->
<!--                 <ul> -->
<!--                   <li>2021</li> -->
<!--                   <li>3/31</li> -->
<!--                   <li>台北市</li> -->
<!--                   <li>師大體育館</li> -->
<!--                 </ul> -->
              </div>
            </div>
          </div>
        </div>
       <div class="col-md-12 portfolio-wrap">
        <div class="row sport_list d-flex">
          <a href="<c:url value='/ACT/ACT_Main?sportid=2' />"
            class="col-md-6 order-md-last sport_img image-popup js-fullheight d-flex align-items-center justify-content-center"><img
              src="<c:url value="/images_index/select-basketball.jpg"/>"></a>
          <div class="col-md-5 sport_info">
            <div class="desc text-md-right">
              <div class="sport_title"><a href="<c:url value='/ACT/ACT_Main?sportid=2' />"><span>桌球</span></a></div>
              <div class="sport_content">
<!--                 <a href="#"> -->
<!--                   <h5>師大盃</h5> -->
<!--                 </a> -->
<!--                 <ul> -->
<!--                   <li>2021</li> -->
<!--                   <li>3/31</li> -->
<!--                   <li>台北市</li> -->
<!--                   <li>師大體育館</li> -->
<!--                 </ul> -->
              </div>
            </div>
          </div>
          </div>
        </div>
        </div>
        
	</section>
    <!-- footer -->
  <jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>