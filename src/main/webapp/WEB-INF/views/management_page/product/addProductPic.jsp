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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>新增商品明細</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
<%-- <jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" /> --%>
<!-- ---------------------------------------------------------------- -->
	
	<fieldset>
			<!-- -------------新增 ProductPicBean --------------- -->
			
       <div class="container col-md-5 my-5">
                <div class="card">
                    <div class="card-body">
                        
                            <!--<form action="DOS_update" method="post" id="DOSform">-->
                        <form:form   modelAttribute="productPicture" method="POST" enctype="multipart/form-data">
                        

                        <caption>
                            <h2>
                                <c:if test="${product.product_id != null}">
                                    編輯${product.product_title}圖片
                                </c:if>
                                <c:if test="${product.product_id == null}">
                                    新增${product.product_title}圖片
                                </c:if>
                            </h2>
                        </caption>
                        
                        
						<form:hidden path="product_pic_id" />
						<form:hidden path="productBean.product_id" />
						<form:hidden path="product_pic_seq" />
                       

                       商品照片:<form:input path="productImage" type="file" accept=".png"/>
                                                                                                                   
                        <input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
                        </form:form>
                        
                    </div>
                </div>
            </div>
			<div class="ml-4">
				<hr>
				<div class="col-12 d-flex justify-content-end">
						<a href="/GBG_project_mvc/product/manageProducts">
					<div class="btn btn-outline-primary" style="width: 150px;">
						返回
					</div>
						</a>
				</div>
			</div>
	</fieldset>


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