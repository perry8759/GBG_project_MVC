<!-- 留言板 03/24-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>留言板</title>
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
								<li class="nav-item col-4"><a class="nav-link"
									href="<c:url value='/ACT/ACT_Main/${ActBean.ACT_ID}'/>">活動簡介</a></li>
								<li class="nav-item col-4"><a class="nav-link"
									href="<c:url value='/ACT/MATCH_ACT_sch?Actid=${ActBean.ACT_ID}'/>">賽程表</a></li>
								<li class="nav-item col-4"><a class="nav-link active">留言板</a>
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

							<!-- ----qes list---- -->
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
							<!-- ----end qes list---- -->
							<!-- ------page----- -->
							<div class="row mt-5 mb-5">
								<div class="col text-center">
									<c:if test="${! empty Qes}">
										<div class="block-sport-dos">
											<ul>
												<li><a href="?start=${pre}&Actid=${ActBean.ACT_ID}">&lt;</a></li>
												<c:forEach items="${allpage}" var="item">
													<li><a
														href="?start=${(item-1)*5}&Actid=${ActBean.ACT_ID}">${item}</a></li>
												</c:forEach>
												<li><a href="?start=${next}&Actid=${ActBean.ACT_ID}">&gt;</a></li>
											</ul>
										</div>
									</c:if>
								</div>
							</div>
							<!-- ------end page----- -->
							<!-- ------form----- -->
							<div class="row mt-5 mb-5">
								<div class="col text-center sent_msg d-flex">
									<!-- 										<fieldset class="form-group"> -->
									<h3 id="fake">
										留<br>言
									</h3>
									<form:form method="POST" modelAttribute="QesBean">
										<textarea class="form-control" cols="74" rows="5"
											name="comment" required="required" id="qes">${comment}</textarea>
										<br>
										<input type="submit" class="btn btn-success" value="送出留言">
										<form:hidden path="ACT_QES_ID" />
										<form:hidden path="act.ACT_ID" />
										<form:hidden path="MEMBER_ID" />
									</form:form>
									<!-- 										</fieldset> -->
								</div>
							</div>
							<!-- ------end form----- -->
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
												<th style="width: 95px;">隊伍上限</th>
												<th style="width: 95px;">已報名</th>
												<th style="width: 95px;">人數上限</th>
												<th style="width: 95px;">已報名</th>
											</tr>
											<tr class="tr_even" style="height: 60px;">
												<th>${ActBean.ACT_MAX_TEAM}</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${fn:length(ActBean.teams)}</div>
												</th>
												<th>${ActBean.ACT_MAX_PNUM}</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${ActBean.ACT_PNUM}</div>
												</th>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="apply-time">
								<div>
									<span class="title">行事曆</span>
								</div>
								<div class="signup_detail">
									<table>
										<tbody>
											<tr>
												<th style="width: 140px;"></th>
												<th style="width: 240px;">時間</th>
											</tr>
											<tr class="tr_even" style="height: 50px;">
												<th>報名開始</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${time[0]}</div>
												</th>
											</tr>
											<tr class="tr_odd" style="height: 50px;">
												<th>報名截止</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${time[1]}</div>
												</th>
											</tr>
											<tr class="tr_even" style="height: 50px;">
												<th>活動開始</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${time[2]}</div>
												</th>
											</tr>
											<tr class="tr_odd" style="height: 50px;">
												<th>活動截止</th>
												<th>
													<div style="cursor: pointer;"
														onclick="window.location.href='#';">${time[3]}</div>
												</th>
											</tr>
										</tbody>
									</table>
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
	<script>
		$(document).ready(function() {
			$('#fake').click(function() {
				$('#qes').val("請問主辦方，非本國籍學生須繳交哪些相關證件?");
			});
		});
	</script>
</body>
</html>