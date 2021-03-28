<!-- 管理活動頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>已報名活動</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />

	<jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/images_index/dylan-gillis-KdeqA3aTnBY-unsplash.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">已報名活動</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">會員主頁 <i
								class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a
							href="index.html">活動管理 <i class="ion-ios-arrow-forward"></i></a></span>
						<span>已報名活動</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section sign_up_team">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
				</div>
			</div>

		</div>
	</section>

	<section class="ftco-section sign_up_list">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-md-12">
							<div class="sign-up-wrap">
								<table class="game-list">
									<thead>
										<tr class="game-list_head">
											<td class="team_num">隊伍編號</td>
											<td>隊伍名稱</td>
											<td>活動標題</td>
											<td>活動狀態</td>
											<td>選項</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="team" items="${AllTeam}">
											<tr class="game-list_row">
												<td class="game-list_summary">
													<p class="game-list_summary_division">
														<a href="#">${team.match_team_id}</a>
													</p>

												</td>
												<td class="game-list_name"><c:out
														value="${team.team_name}" /></td>
												<td class="game-list_site"><a
													href="<c:url value='/ACT/ACT_Main/${team.act_id.ACT_ID}'/>">
														<c:out value="${team.act_id.ACT_TITLE}" />
												</a></td>
												<td class="game-list_time"><c:out
														value="${team.act_id.act_status.ACT_STATUS_NAME}" /></td>
												<td class="game-list_focus">
													<!-- 依活動狀態決定是否可更改報名資料 --> <a
													href="<c:url value='/ACT//ACT_regEdit?teamid=${team.match_team_id}'/>">修改報名資訊</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<jsp:include page="/WEB-INF/views/fragment/page.jsp" />
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>