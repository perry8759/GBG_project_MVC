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
	
			
       <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        
                            <!--<form action="DOS_update" method="post" id="DOSform">-->
                        <form:form   modelAttribute="pictureVO" method="POST" enctype="multipart/form-data">
                        

                        <caption>
                            <h2>
                                <c:if test="${product_pic_id_0 != null}">
                                    編輯${product.product_title}圖片
                                </c:if>
                                <c:if test="${product_pic_id_0 == null}">
                                    新增${product.product_title}圖片
                                </c:if>
                            </h2>
                        </caption>
                        
						<form:hidden path="productBean.product_id" />
                        
						<form:hidden path="product_pic_id_0" />
						<form:hidden path="product_pic_id_1" />
						<form:hidden path="product_pic_id_2" />
						<form:hidden path="product_pic_id_3" />
						<form:hidden path="product_pic_id_4" />
						<form:hidden path="product_pic_id_5" />

						封面照片: 
						<form:input path="product_pic_img_0" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_0"  value="0"/>
						<br>
						商品照片1:<form:input path="product_pic_img_1" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_1"  value="1"/>
						<br>
						商品照片2:<form:input path="product_pic_img_2" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_2"  value="2"/>
						<br>
						商品照片3:<form:input path="product_pic_img_3" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_3"  value="3"/>
						<br>
						商品照片4:<form:input path="product_pic_img_4" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_4"  value="4"/>
						<br>
						商品照片5:<form:input path="product_pic_img_5" type="file" accept=".png"/>
						<form:hidden path="product_pic_seq_5"  value="5"/>
                        <br>                                                                                          
						
						
                        <input id="btnAdd" type='submit' class='btn btn-primary'value="送出" />
							
							
							
                        </form:form>
                        
                    </div>
                </div>
            </div>
			<!-- 			<button type="submit" class="btn btn-outline-primary" style="width: 150px;">新增商品照片</button> -->
			<div class="ml-4">
				<hr>
				<div class="col-12 d-flex justify-content-end">
					<div class="btn btn-outline-primary" style="width: 150px;">
						<a href="/GBG_project_mvc/product/manageProducts">返回</a>
					</div>
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