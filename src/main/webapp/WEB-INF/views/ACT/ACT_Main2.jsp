<!-- 所有活動的主頁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
<section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">盃賽清單</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁<i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">報名賽事<i class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單 <i class="ion-ios-arrow-forward"></i></span> <span>籃球</span></p>
                </div>
            </div>
        </div>
    </section>
<section class="ftco-section focus-gamelist">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 text-center heading-section ftco-animate">
                    <span class="subheading">Spotlight</span>
                    <h2 class="mb-4">焦點賽事</h2>
                </div>
            </div>
            <div class="row ftco-animate">
                <div class="col-md-12">
                    <div class="carousel-testimony owl-carousel ftco-owl">
                        <c:forEach var="act" items="${Act}" varStatus="st">
                        <div class="item">
                            <div class="single_appertment ftco-animate">
                                <div class="thumb">
<%--                                     <a href="#"><img src="data:image/jpg;base64,${act.imageData}"></a> --%>
										<a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>"><img src="${pageContext.request.contextPath}/images_index/joel-muniz-Ue5MJoavkIc-unsplash.jpg"></a>
                                </div>
                                <div class="appertment_info">
                                    <a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>">
                                        <h5>${act.ACT_TITLE}</h5>
                                    </a>
                                    <ul>
                                    	<li>報名時間 ${act.ACT_SIGN_O}~${act.ACT_SIGN_C}</li>
                                        <li>活動時間 ${act.ACT_RUN_O}~${act.ACT_RUN_C}</li>
                                        <li>活動地點 ${act.dos_id.DOS_NAME}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section hot-gamelist">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hot-list-wrap">
                                <div class="game_list_search">
                                    <div class="container">
                                        <div class="game_container_main">
                                            <div class="game_list_search_dropdown">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">參加組別
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">社會組</a>
                                                    <a class="dropdown-item" href="#">大專組</a>
                                                    <a class="dropdown-item" href="#">一般社團</a>
                                                </div>
                                            </div>
                                            <div class="game_list_search_dropdown">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">報名狀態
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">已截止</a>
                                                    <a class="dropdown-item" href="#">報名中</a>
                                                    <a class="dropdown-item" href="#">尚未開放報名</a>
                                                </div>
                                            </div>
                                            <div class="game_list_search_main">
                                                <div class="input-group">
                                                    <div class="sidebar-box pt-0">
                                                        <form action="#" class="search-form">
                                                            <div class="form-group">
                                                                <input type="text" class="search-input" placeholder="Type a keyword">
                                                            <div class="game_list_search_btn">
                                                                <a href="#"> <span class="icon icon-search"></span></a>
                                                            </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table class="game-list">
                                    <thead>
                                        <tr class="game-list_head">
                                            <td class="gamename">比賽組別</td>
                                            <td>比賽名稱</td>
                                            <td>比賽地點</td>
                                            <td>比賽時間</td>
                                            <td>關注</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                        <tr class="game-list_row">
                                            <td class="game-list_summary">
                                                <p class="game-list_summary_division">
                                                    <a href="#">社會組</a>
                                                </p>
                                                <span class="times-watched">5566
                                                    <!-- 觀看次數 --></span>
                                            </td>
                                            <td class="game-list_name"><a href="#">java015結訓盃</a></td>
                                            <td class="game-list_site">北科體育館</td>
                                            <td class="game-list_time">2021/03/31</td>
                                            <td class="game-list_focus">
                                                <a href="#">
                                                    <span class="flaticon-view"></span>
                                                    14
                                                    <!-- 追蹤人數 -->
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- loader -->
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