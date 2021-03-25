<!-- 詳細活動資訊 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>act_Detail</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
		<section class="hero-wrap hero-wrap-2"
			style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-end justify-content-center">
					<div class="col-md-9 ftco-animate pb-5 text-center">
						<h1 class="mb-3 bread">賽事主頁</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="/">首頁<i
									class="ion-ios-arrow-forward"></i></a></span> 
							<span class="mr-2">報名賽事<i
								class="ion-ios-arrow-forward"></i></span>
							<span class="mr-2">盃賽清單
								<i class="ion-ios-arrow-forward"></i>
							</span>
							<span>賽事主頁</span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<section class="ftco-section act_main_list">
			<div class="container">
				<div class="row justify-content-center mb-5">
					<div
						class="act_title col-md-7 text-center heading-section ftco-animate">

						<h2 class="mb-4">
							<c:out value="${ActBean.ACT_TITLE}" />
						</h2>
					</div>
				</div>
				<div class="container px-md-0">
					<div class="row">
						<div class="col-12 align-items-stretch">
							<div class="contact-wrap w-100">
								<ul class="nav nav-tabs col-12" role="tablist">
									<li class="nav-item col-4"><a class="nav-link  active"
										data-toggle="tab" role="tab" aria-selected="false" href="#">活動詳情</a></li>
									<li class="nav-item col-4"><a class="nav-link"
										data-toggle="tab" role="tab" aria-selected="false"
										href="Tabletennis.html">賽程表</a></li>
									<li class="nav-item col-4"><a class="nav-link"
										data-toggle="tab" role="tab" aria-selected="true"
										href="#">留言區</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>


			<div id="act_detail_main">

				<div class="container px-md-0 col-md-12 act_itr">
					<div class="row d-flex no-gutters">
						<div class="col-md-8">
							<div class="row no-gutters align-items-center">
								<div class="text ftco-animate act_itr_main">
									<div class="act-1">
										<div>比賽地點</div>
										<ul class="mt-2">
											<span class="actsite">${ActBean.dos_id.DOS_NAME}</span>
										</ul>
									</div>
									<br>

									<div class="act-1">
										<div>聯絡資訊</div>
										<ul class="name mt-2">
											<span class="mr-1">聯絡人:</span>
											<span>${MemberBean.member_real_name}</span>
										</ul>
										<ul class="phone">
											<span class="mr-1">室內電話:</span>
											<span>${MemberBean.member_fixed_line_telephone}</span>
										</ul>
										<ul class="line">
											<span class="mr-1">手機:</span>
											<span>${MemberBean.member_mobile_phone}</span>
										</ul>
										<ul class="email">
											<span class="mr-1">email:</span>
											<span>${MemberBean.member_email}</span>
										</ul>
									</div>
									<div class="act-1">
										<div>參加資格</div>
										<ul class="itr mt-2">
											<span>近三年未參加乙組以上盃賽者,詳情請閱詳細簡章</span>
										</ul>
									</div>
									<div class="act-1">
										<div>可參加隊伍數</div>
										<ul class="teamnum mt-2">
											<span class="mr-1">隊伍數:</span>
											<span>${ActBean.ACT_MAX_PNUM}</span>
										</ul>
									</div>
									<div class="act-1">
										<div>交通方式</div>
										<ul class="trn mt-2">
											<span>${ActBean.dos_id.DOS_TRANS}</span>
										</ul>
									</div>

									<div class="act-1">
										<div>報名費用</div>
										<ul class="prcie mt-2">
											<span> ${ActBean.ACT_PAY}/組 </span>
										</ul>
									</div>

									<div class="act-1">
										<div>場地地址</div>
										<ul class="name mt-2">
											<span>${ActBean.dos_id.DOS_ADDR}</span>
										</ul>
										<iframe
											src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3613.4253701620737!2d121.51297311537945!3d25.087458342299538!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442aeb63bc6b19d%3A0x50fe2dab44d409ec!2z55m-6b2h5rKz5r-x5YWs5ZyS!5e0!3m2!1szh-TW!2stw!4v1615143555958!5m2!1szh-TW!2stw"
											width="400" height="300" style="border: 0;"
											allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row no-gutters align-items-center d-flex h-auto">
								<div class="ftco-animate act_current_situation ">

									<div class="act_num mt-auto">活動編號:${ActBean.ACT_ID}</div>
									<div class="act_situation">
										<span>${ActBean.act_status.ACT_STATUS_NAME}</span>
									</div>
									<div class="act_situation">
										<a href="<c:url value='/ACT/ACT_reg?Actid=${ActBean.ACT_ID}'/>"><span>報名活動</span></a>
									</div><br>
									<a href="<c:url value='/ACT/ACT_Qes?Actid=${ActBean.ACT_ID}'/>"><span> Q & A </span></a>
								<a href="<c:url value='/ACT/ACT_follow/${ActBean.ACT_ID}'/>"><span>關注活動
<%-- 								<c:if test="">關注活動</c:if> --%>
<%-- 								<c:if test="">取消關注</c:if> --%>
								 </span></a>
								</div>
							</div>
							<br>
							<div class="signup_situation">
								<div class="signup_title">報名狀況</div>
								<div>
									<table class="signup_detail">
										<tbody>
											<tr>
												<th>組別</th>
												<th>隊伍上限</th>
												<th>已報名</th>
												<th>核准參賽</th>
											</tr>
										</tbody>
									</table>


								</div>
							</div>


							<div class="apply-time"></div>


						</div>
					</div>
				</div>
		</section>
		
		
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
</body>
</html>