<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>留言</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">活動 Q&A</h1>
				</div>
			</div>
		</div>
		<div class="container col-md-5 mt-5">

			<div class="card">
				<div class="card-body">
					<form:form method="POST" modelAttribute="QesBean">
						<fieldset class="form-group">
							<label>輸入內文</label>
							<textarea class="form-control" cols="80" rows="14" name="comment"
								required="required"></textarea>
						</fieldset>
						<input type="hidden" value="${ActBean.ACT_ID}" name="Actid">
						<input type="submit" class="btn btn-success" value="送出留言">
					</form:form>
				</div>
			</div>
		</div>
	</section>

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
</body>
</html>