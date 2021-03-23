<!-- 所有活動的主頁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
.block-sport-dos ul {
	padding: 0;
	margin: 0;
}

.block-sport-dos ul li {
	display: inline-block;
	margin-bottom: 4px;
	font-weight: 400;
}

.block-sport-dos ul li a, .block-sport-dos ul li span {
	color: #555353;
	text-align: center;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	border: 1px solid #333232;
}

.block-sport-dos ul li.active a, .block-sport-dos ul li.active span {
	background: #555353;
	color: #fff;
	border: 1px solid transparent;
}

.game_list_search_btn  .list_srh_btn {
	padding: 0;
	border: none;
	color: #DE520E;
	background-color: #FFF;
}
</style>
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
					<h1 class="mb-3 bread">盃賽清單</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">首頁<i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">報名賽事<i
							class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單
							<i class="ion-ios-arrow-forward"></i>
						</span> <span>籃球</span>
					</p>
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
						<c:forEach var="act" items="${spotLight}" varStatus="st">
							<div class="item">
								<div class="single_appertment ftco-animate">
									<div class="thumb">
										<a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>"><img
											src="data:image/jpg;base64,${act.imageData}"></a>
									</div>
									<div class="appertment_info">
										<a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>">
											<h5>${act.ACT_TITLE}</h5>
										</a>
										<ul>
											<li>${act.run_O_year}</li>
											<li>${act.run_O_month}/${act.run_O_day}</li>
											<li>${act.dos_id.dos_ADDR_SUB}</li>
											<li>${act.dos_id.DOS_NAME}</li>
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
												<button class="btn btn-secondary dropdown-toggle"
													type="button" id="dropdownMenuButton"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
														<c:if test="${order eq 'original'}">
                                                 		關注量
                                                 		</c:if>
														<c:if test="${order eq 'asc'}">
                                                 		升序
                                                 		</c:if>
														<c:if test="${order eq 'desc'}">
                                                 		降序
                                                 		</c:if>
												</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item"
														href="<c:url value='/ACT/ACT_Main?sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=asc'/>">升序</a>
													<a class="dropdown-item"
														href="<c:url value='/ACT/ACT_Main?sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=desc'/>">降序</a>
												</div>
											</div>
											<div class="game_list_search_dropdown">
												<button class="btn btn-secondary dropdown-toggle"
													type="button" id="dropdownMenuButton"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<c:if test="${empty state}">報名狀態</c:if>
													<c:if test="${!empty state}">${state.ACT_STATUS_NAME}</c:if>
												</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<c:forEach items="${status}" var="st">
														<a class="dropdown-item"
															href="<c:url value='/ACT/ACT_Main?sportid=${sportid}&state=${st.ACT_STATUS_ID }&order=${order}'/>">${st.ACT_STATUS_NAME}</a>
													</c:forEach>
												</div>
											</div>
											<div class="game_list_search_main">
												<div class="input-group">
													<div class="sidebar-box pt-0">
														<form action="<c:url value='/ACT/ACT_search'/>"
															class="search-form">
															<div class="form-group">
																<input type="text" name="keyword" placeholder="請輸入關鍵字"
																	onfocus="this.placeholder=''"
																	onblur="this.placeholder='請輸入關鍵字'"> <input
																	type="hidden" name="sportid" value="${sportid}">
																<input type="hidden" name="state"
																	value="${state.ACT_STATUS_ID}"> <input
																	type="hidden" name="order" value="${order}">
																<div class="game_list_search_btn">
																	<button class="list_srh_btn ">
																		<span class="icon icon-search"></span>
																	</button>
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
											<td class="gamename">狀態</td>
											<td>比賽名稱</td>
											<td>比賽地點</td>
											<td>比賽時間</td>
											<td>關注</td>
										</tr>
									</thead>

									<c:forEach var="act" items="${Act}" varStatus="st">
										<tbody>
											<tr class="game-list_row">
												<td class="game-list_summary">
													<p class="game-list_summary_division">
														<a href="#"> ${act.act_status.ACT_STATUS_NAME}</a>
														<%--                                                     <c:if test="${act.act_status.ACT_STATUS_ID==1}"> --%>
														<!--                                                     <a href="#">未開放</a> -->
														<%--                                                 </c:if> --%>
														<%--                                                 <c:if test="${act.act_status.ACT_STATUS_ID==2}"> --%>
														<!--                                                     <a href="#">報名中</a> -->
														<%--                                                 </c:if> --%>
														<%--                                                 <c:if test="${act.act_status.ACT_STATUS_ID==3}"> --%>
														<!--                                                     <a href="#">已截止</a> -->
														<%--                                                 </c:if> --%>
													</p> <!--                                                 <span class="times-watched">5566 -->
													<!--                                                     觀看次數</span> -->
												</td>
												<td class="game-list_name"><a
													href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>">${act.ACT_TITLE}</a></td>
												<td class="game-list_site">${act.dos_id.DOS_NAME}</td>
												<td class="game-list_time">${act.run_O_year}/${act.run_O_month}/${act.run_O_day}</td>
												<td class="game-list_focus"><a
													href="<c:url value='/ACT/ACT_follow/${act.ACT_ID}?sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}&start=${start}'/>">
														<span class="flaticon-view"></span>
														${fn:length(act.followers)} <!-- 追蹤人數 -->
												</a></td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<c:if test="${! empty Act}">
						<div class="row mt-5 mb-5">
							<div class="col text-center">
								<div class="block-sport-dos">
									<ul>
										<li><a
											href="?start=${pre}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">&lt;</a></li>
										<c:forEach items="${allpage}" var="item">
											<li><a
												href="?start=${(item-1)*5}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">${item}</a></li>
										</c:forEach>
										<li><a
											href="?start=${next}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- loader -->
	<!-- loader -->

	<script src="${pageContext.request.contextPath}/js_index/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js_index/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js_index/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js_index/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js_index/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>
</body>


</html>