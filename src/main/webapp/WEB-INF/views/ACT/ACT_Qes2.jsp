<!-- 詳細活動資訊 03/24-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>act_Detail</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	<!-- END header -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">賽事詳情</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="<c:url value="/"/>">首頁<i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">報名賽事<i
							class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單
							<i class="ion-ios-arrow-forward"></i>
						</span> <span>賽事詳情</span>
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
			<div class="container px-md-0 act_main_top">
				<div class="row">
					<div class="col-12 align-items-stretch">
						<div class="contact-wrap w-100 p-md-5 p-4">
							<ul class="nav nav-tabs col-12" role="tablist">
								<li class="nav-item col-4"><a class="nav-link active"
									href="BasketballDoslist.html">活動簡介</a></li>
								<li class="nav-item col-4"><a class="nav-link"
									href="<c:url value='/ACT/MATCH_ACT_sch?Actid=${ActBean.ACT_ID}'/>">賽程表</a></li>
								<li class="nav-item col-4"><a class="nav-link"
									href="<c:url value='/ACT/ACT_Qes?Actid=${ActBean.ACT_ID}'/>">留言板</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div>
				<div class="container px-md-0 col-md-12 act_massage">
					<div class="row d-flex no-gutters">

						<div class="col-md-6 offset-md-1 act_left ">
							<div class="row no-gutters align-items-center">

								<table class="massage_list">
									<thead>
										<tr>
											<th class="message_title">留言者</th>
											<th class="message_user">留言內容</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="qes" varStatus="statusX" items="${Qes}">
											<tr>
												<td class="main_msg">${qes.key}</td>
												<c:forEach var="comment" varStatus="statusX"
													items="${qes.value}">
													<td class="user">${comment}</td>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
							<div class="row mt-5 mb-5">
								<div class="sent_msg d-flex">
									<div class="sent_msg_btn">
										<a href="<c:url value='ACT_QesForm?Actid=${Actid}'/>"><button class="btn">新增留言</button></a>
									</div>
								</div>
								<div class="col text-center">
									<c:if test="${! empty Qes}">
										<div class="row mt-5 mb-5">
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
									</c:if>
								</div>
							</div>
						</div>

						<div class="col-md-4 act_right">
							<div class="sign_situation d-flex justify-content-between ">

								<div class="act_situation">
									<div>
										<span>${ActBean.act_status.ACT_STATUS_NAME}</span>
									</div>
								</div>
								<div class="act_btn">
									<a href="<c:url value='/ACT/ACT_reg?Actid=${ActBean.ACT_ID}'/>"
										class="btn apply_btn">報名活動</a>

								</div>
								<div class="act_btn">
									<a
										href=" <c:url value='/ACT/ACT_follow/${ActBean.ACT_ID}?from=detail'/> "
										class="btn apply_btn">關注賽事</a>

								</div>
								<br>

							</div>
							<div>
								活動編號:<span>${ActBean.ACT_ID}</span>
							</div>
							<div>
								追蹤人數: <span class="flaticon-view"></span> <span>${fn:length(ActBean.followers)}</span>
							</div>


							<div>
								<span class="title">報名狀況</span>
								<div class="signup_detail">
									<table>
										<tbody>
											<tr>
												<th style="width: 150px;">組別</th>
												<th style="width: 100px;">隊伍上限</th>
												<th style="width: 90px;">已報名</th>
												<th>核准參賽</th>
											</tr>
											<tr class="tr_even">
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">社會男子單打</div>
												</th>
												<th>36</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">40</div>
												</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">36</div>
												</th>
											</tr>
											<tr class="tr_odd">
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">社會女子單打</div>
												</th>
												<th>36</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">24</div>
												</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">20</div>
												</th>
											</tr>
											<tr class="tr_even">
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">社會男子雙打</div>
												</th>
												<th>16</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">20</div>
												</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">16</div>
												</th>
											</tr>

										</tbody>
										<tfoot>
											<tr>
												<th colspan="2">參賽隊伍:72</th>
												<th colspan="2">參賽人數:94</th>

											</tr>
										</tfoot>
									</table>


								</div>
							</div>


							<div class="apply-time">
								<div>
									<span class="title">行事曆</span>

								</div>


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