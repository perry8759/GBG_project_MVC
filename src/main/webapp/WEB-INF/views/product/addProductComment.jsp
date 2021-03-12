<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add ProductComment</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid w-75">
		<div class="row my-5">
			<div class="col-6">
				<img width="100" height="100" src="<c:url value='/getPicture/${product.product_id}'/>">
			</div>
			<div class="col-6 mt-5">
				<form:form method='POST' modelAttribute="productCommentBean"
					class='form-horizontal'>
					<form:hidden path="productBean.product_id"  class="form-control"  />
					<h1>${product.product_title}</h1>
					<fieldset>
						<div>
							<label class="control-label col-lg-2 col-lg-2" for='title'>
								您對商品的評分: </label>
							<div class="col-lg-10">
								<form:input id="comment_value" path="comment_value"
									type='number' min="1" max="5" class='form:input-large' value="5"/>
							</div>
							<!-- 					<div class="ratings"> -->
							<!-- 						<div class="empty-stars"></div> -->
							<!-- 						<div class="full-stars" style="width: 70%"></div> -->
							<!-- 					</div> -->
						</div>
						<div>
							<label class="control-label col-lg-2 col-lg-2" for='title'>
								您對商品的評論: </label><br>
							<form:textarea id="comment_comment" path="comment_comment"
								 rows="10" cols="60" />
						</div>
						<div class="form-group">
							<div class='col-lg-offset-2 col-lg-10'>
								<input id="btnAdd" type='submit' class='btn btn-primary'
									value="送出評論" />
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>