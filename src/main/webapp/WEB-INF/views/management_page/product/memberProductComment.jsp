<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_product/STAR.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>查看自己訂單評論</title>
</head>
<body style="background-color: rgb(212, 225, 231);">
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="container p-5 my-5" style="background-color: rgb(255, 255, 255)">
		<div class="row ">
		<c:if test="${empty comments}">
			<h3>尚無評論</h3>
		</c:if>
		<c:forEach var='comment' items='${comments}'>
			<div class="col-12">
				<h3>${comment.productBean.product_title}</h3>
				<hr>
			</div>
			<div class="col-2 " style="height: 300px;">
				<img src="<c:url value='/product/getCoverPicture?pId=${comment.productBean.product_id}'/>" style="max-width: 150px;">
			</div>
			<div class="col-8">
<%-- 				<div>${comment.productBean.product_title}</div> --%>
				<div class="ratings my-2">
					<div class="empty-stars"></div>
					<div class="full-stars" style="width: ${comment.comment_value/5*100}%"></div>
				</div>
				<div>
					<h4>評論時間: ${comment.comment_date}</h4><span id=""></span>
<%-- 					<h5>評論時間: </h5><span id="">${comment.comment_date}</span> --%>
				</div>
				<div class="my-2">
					<h4>評論內容: </h4>
					<span id="">${comment.comment_comment}</span>
				</div>
			</div>
<!-- 			<div class="col-2  align-self-end"> -->
<!-- 				<button type="submit" class="btn btn-outline-primary">修改評論</button> -->
<!-- 			</div> -->
			</c:forEach>
		</div>
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>