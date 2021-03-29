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
	</section>
	<section class="ftco-section act_main_list">
		<div class="container col-md-5 mt-5 sent_msg">
			<form:form method="POST" modelAttribute="QesBean">
				<fieldset class="form-group">
					<h3 class="mb-4 heading">留言</h3>
					<textarea class="form-control" cols="80" rows="14" name="comment"
						required="required">${comment}</textarea>
				</fieldset>
				<form:hidden path="ACT_QES_ID" />
				<form:hidden path="act.ACT_ID" />
				<form:hidden path="MEMBER_ID" />
				<input type="submit" class="btn btn-success" value="送出留言">
			</form:form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>