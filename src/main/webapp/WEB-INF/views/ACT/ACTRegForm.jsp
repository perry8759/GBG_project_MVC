<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>報名活動表單</title>
<script type="text/javascript">
	// 亂寫擋一下而已，不能這樣寫，要寫Ajax異步檢查帳號是否存在QQ
	var count = 1;
	function add() {
		const members = document.getElementById("members");
		const st = "<br><input type='text' name='member"+count+"' value='未寫入資料庫'>";
		members.innerHTML += st;
	}
</script>
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
					<h1 class="mb-3 bread">報名活動</h1>
				</div>
			</div>
		</div>
		<div class="container col-md-5  mt-5">
			<div class="card">
				<div class="card-body">
					<form:form method="POST" modelAttribute="MatchTeamBean">
						<form:hidden path="match_team_id" />
						<fieldset class="form-group">
							<label>隊伍名稱</label>
							<form:input path="team_name" class="form-control"
								value="${MatchTeamBean.team_name}" />
						</fieldset>

						<fieldset class="form-group">
							<label>單位名稱</label>
							<form:input path="team_unit" class="form-control"
								value="${MatchTeamBean.team_unit}" />
						</fieldset>

						<fieldset class="form-group">
							<label>聯絡人 ${sessionScope.LoginOK.member_cp_name}</label>
						</fieldset>

						<fieldset class="form-group">
							<label>聯絡電子信箱 ${sessionScope.LoginOK.member_email}</label>
						</fieldset>

						<fieldset class="form-group">
							<label>聯絡電話 ${sessionScope.LoginOK.member_mobile_phone}</label>
						</fieldset>

						<fieldset class="form-group">
							<label>報名活動 ${ActBean.ACT_TITLE}</label>
							<form:hidden path="act_id.ACT_ID" value="${ActBean.ACT_ID}" />
						</fieldset>
						<fieldset class="form-group" id="members">
							<label>隊伍成員</label> <br> <input type='text' name='member0'
								value="未檢查未寫入資料庫">
						</fieldset>
						<input type="button" value="增加人員" onClick="add();">
						<input type="submit" class="btn btn-success" value="送出報名資料">
					</form:form>
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