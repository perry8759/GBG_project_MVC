<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   <link rel="stylesheet" href="GBG/css/style.css">
   <link rel="stylesheet" href="STAR.css">
   <link rel="stylesheet" href="noob.css">
   <script src="jQuery/js/jquery-3.5.1.min.js"></script>
    <title>商品</title>
    <script>
        $(document).ready(function(){ 
            // 點選左方小圖 改變預覽圖
            $('#imgm1').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            $('#imgm2').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            $('#imgm3').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            $('#imgm4').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            $('#imgm5').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            $('#imgm6').click(function(){
                $('#feedback').attr("src", $(this).attr("src"))
            });
            // ---------------
            $('.size').click(function(){
                $('.size').removeClass('active');
                $(this).addClass('active');
            });
            $('.color').click(function(){
                $('.color').removeClass('active');
                $(this).addClass('active');
            });
            
        });
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------------- -->	
<!-- 	<div class="container-fluid my-5" style="width: 90%;" > -->
<!--             <div class="row border-bottom-0 border"style="background: rgb(234, 252, 252);"> -->
<!--                 <div class="col-lg-1 col-sm-12"> -->
<!--                     <img id="imgm1" src="data2/images/980675595_P_00.jpg" style="max-width: 100px;" class="border border-secondary my-2"> -->
<!--                     <img id="imgm2" src="data2/images/img46.png" style="max-width: 100px;" class="border border-secondary my-2"> -->
<!--                     <img id="imgm3" src="data2/images/img48.png" style="max-width: 100px;" class="border border-secondary my-2"> -->
<!--                     <img id="imgm4" src="data2/images/img49.png" style="max-width: 100px;" class="border border-secondary my-2"> -->
<!--                     <img id="imgm5" src="data2/images/img59.png" style="max-width: 100px;" class="border border-secondary my-2"> -->
<!--                     <img id="imgm6" src="data2/images/img60.png" style="max-width: 100px;" class="border border-secondary my-2"> -->

<!--                 </div> -->
<!--                 <div class="col-lg-5 "><img src="data2/images/980675595_P_00.jpg" id="feedback" style="max-width: 600px;width:100%;"></div> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="row" >  -->
<%--                         <div class="col-12"style="width: 600px;height:170px;word-break: break-all;font-size: 3rem;">${product.product_title}</div>  --%>
<!--                     </div> -->
<!--                     <div class="row" style="width: 600px;height:100px;"> -->
<!--                         <div class="col-lg-12"> -->
<!--                             <div class="ratings"> -->
<!--                             <div class="empty-stars"></div> -->
<!--                             <div class="full-stars" style="width:50%"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<%--                 <div class="row my-3" style="font-size: 2rem;">優惠價:${product.product_price}元</div> --%>
<!--                     <div class="row justify-content-between" style="width: 600px;height:50px;"><h4>寄送方式</h4><h4>客樂得貨到付款</h4><h4>滿千免運</h4></div> -->
<%--                     <form method="POST" action="${pageContext.request.contextPath}/shoppingCart/addProduct"> --%>
<!--                     <div class="row" style="width: 600px;height:50px;"> -->
<!--                         <h4> -->
<!-- 							顏色 -->
<!-- 							<select name="productColor"> -->
<!-- 								<option value="-1" label="請選擇" /> -->
<%-- 								<c:forEach var='color' items='${pColors}'> --%>
<%-- 							 		<option value="${color}" label="${color}" /> --%>
<%-- 						 		</c:forEach> --%>
<!-- 						 	</select> -->
<!-- 						 	</div> -->
<!-- 						</h4> -->
<!--                     </div> -->
<!--                     <div class="row" style="width: 600px;height:70px;"> -->
<!--                         <h4> -->
<!-- 							<div class="row" style="width: 600px; height: 70px;"> -->
<!-- 								尺寸 -->
<!-- 								<select name="productSize"> -->
<!-- 								<option value="-1" label="請選擇" /> -->
<%-- 									<c:forEach var='size' items='${pSizes}'> --%>
<%-- 										<option value="${size}" label="${size}" /> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
<!-- 							</div> -->
<!-- 						</h4> -->
<!--                     </div> -->
<!--                     <div class="row"><h4>數量 <input type="number" min="1" style="width: 50px; margin-left: 150px;"></h4><span class="ml-3">件</span></div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row justify-content-end border border-top-0"style="background: rgb(234, 252, 252);"> -->
<!--                 <div class="col-lg-8"></div> -->
<!--                 <div class="col-4"> -->
	<!-- ---------------------------- -->
	<div class="container-fluid w-75">
		<div class="row">
			<div class="col-1 ">
<%-- 				<img id="imgm1" src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>" style="max-width: 100px;"> --%>
				<c:forEach var='pic' items='${pictures}'>
					<img id="imgm1" src="<c:url value='/product/getPicture?ppId=${pic}'/>" style="max-width: 100px;">
				</c:forEach>
			</div>
			<div class="col-5">
				<img src="images/14.png">
			</div>
			<div class="col-6">
				<div class="row"
					style="background-color: red; width: 600px; height: 170px; word-break: break-all; font-size: 3rem;">${product.product_title}</div>
				<div class="row"
					style="background-color: green; width: 600px; height: 100px;">
					<div class="col-12">
						<div class="ratings">
							<div class="empty-stars"></div>
							<div class="full-stars" style="width: 80%">${product.average_score}</div>
						</div>
					</div>
				</div>
				<div class="col-12" style="font-size: 2rem;">優惠價:${product.product_price}</div>
				<div class="row justify-content-between"
					style="background-color: lightblue; width: 600px; height: 50px;">
					<h4>寄送方式</h4>
					<h4>客樂得貨到付款</h4>
					<h4>滿千免運</h4>
				</div>
				<div class="row" style="background-color: rgb(212, 192, 79); width: 600px; height: 50px;">
					
						<form method="POST" action="${pageContext.request.contextPath}/shoppingCart/addProduct">
							<h4>
								顏色
								<select name="productColor">
									<option value="-1" label="請選擇" />
									<c:forEach var='color' items='${pColors}'>
								 		<option value="${color}" label="${color}" />
							 		</c:forEach>
							 	</select>
							 	</div>
							</h4>
							<h4>
								<div class="row" style="width: 600px; height: 70px;">
									尺寸
									<select name="productSize">
									<option value="-1" label="請選擇" />
										<c:forEach var='size' items='${pSizes}'>
											<option value="${size}" label="${size}" />
										</c:forEach>
									</select>
								</div>
							</h4>
							<div class="row">
							<h4>
								數量 <input type="number" name="productAmount" min="1" style="width: 50px; margin-left: 150px;" value="1">
							</h4>
							<div class="row justify-content-end">
							<input type="hidden" name="productId" value="${product.product_id}">
			<div class="col-8"></div>
			<div class="col-4">
				<c:if test="${product.productStausBean.product_stid== 1}">
					<button type="button" class="btn btn-primary btn-lg" onclick="this.form.submit();">加入購物車</button>
<!-- 					<button type="button" class="btn btn-primary btn-lg ml-3" onclick="this.form.submit();">立即結帳</button> -->
				</c:if>
				<c:if test="${product.productStausBean.product_stid== 2}">
					<button type="button" class="btn btn-primary btn-lg">已下架</button>
				</c:if>
				<h1>${EnterError}</h1>
			</div>
            </div>
           </form>
        </div>
	<!-- ---------------------------- -->
<!-- 	<div class="container-fluid w-75"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-1 "> -->
<!-- 				<img id="imgm1" src="images/14.png" style="max-width: 100px;"> -->
<!-- 				<img id="imgm2" src="images/14.png" style="max-width: 100px;"> -->
<!-- 				<img id="imgm3" src="images/14.png" style="max-width: 100px;"> -->
<!-- 				<img id="imgm4" src="images/14.png" style="max-width: 100px;"> -->
<!-- 				<img id="imgm5" src="images/14.png" style="max-width: 100px;"> -->
<!-- 			</div> -->
<!-- 			<div class="col-5"> -->
<!-- 				<img src="images/14.png"> -->
<!-- 			</div> -->
<!-- 			<div class="col-6"> -->
<!-- 				<div class="row" -->
<%-- 					style="background-color: red; width: 600px; height: 170px; word-break: break-all; font-size: 3rem;">${product.product_title}</div> --%>
<!-- 				<div class="row" -->
<!-- 					style="background-color: green; width: 600px; height: 100px;"> -->
<!-- 					<div class="col-12"> -->
<!-- 						<div class="ratings"> -->
<!-- 							<div class="empty-stars"></div> -->
<%-- 							<div class="full-stars" style="width: 80%">${product.average_score}</div> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				<div class="col-12" style="font-size: 2rem;">優惠價:${product.product_price}</div> --%>
<!-- 				<div class="row justify-content-between" -->
<!-- 					style="background-color: lightblue; width: 600px; height: 50px;"> -->
<!-- 					<h4>寄送方式</h4> -->
<!-- 					<h4>客樂得貨到付款</h4> -->
<!-- 					<h4>滿千免運</h4> -->
<!-- 				</div> -->
<!-- 				<div class="row" style="background-color: rgb(212, 192, 79); width: 600px; height: 50px;"> -->
					
<%-- 						<form method="POST" action="${pageContext.request.contextPath}/shoppingCart/addProduct"> --%>
<!-- 							<h4> -->
<!-- 								顏色 -->
<!-- 								<select name="productColor"> -->
<!-- 									<option value="-1" label="請選擇" /> -->
<%-- 									<c:forEach var='color' items='${pColors}'> --%>
<%-- 								 		<option value="${color}" label="${color}" /> --%>
<%-- 							 		</c:forEach> --%>
<!-- 							 	</select> -->
<!-- 							 	</div> -->
<!-- 							</h4> -->
<!-- 							<h4> -->
<!-- 								<div class="row" style="width: 600px; height: 70px;"> -->
<!-- 									尺寸 -->
<!-- 									<select name="productSize"> -->
<!-- 									<option value="-1" label="請選擇" /> -->
<%-- 										<c:forEach var='size' items='${pSizes}'> --%>
<%-- 											<option value="${size}" label="${size}" /> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</h4> -->
<!-- 							<div class="row"> -->
<!-- 							<h4> -->
<!-- 								數量 <input type="number" name="productAmount" min="1" style="width: 50px; margin-left: 150px;" value="1"> -->
<!-- 							</h4> -->
<!-- 							<div class="row justify-content-end"> -->
<%-- 							<input type="hidden" name="productId" value="${product.product_id}"> --%>
<!-- 			<div class="col-8"></div> -->
<!-- 			<div class="col-4"> -->
<%-- 				<c:if test="${product.productStausBean.product_stid== 1}"> --%>
<!-- 					<button type="button" class="btn btn-primary btn-lg" onclick="this.form.submit();">加入購物車</button> -->
<!-- <!-- 					<button type="button" class="btn btn-primary btn-lg ml-3" onclick="this.form.submit();">立即結帳</button> --> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${product.productStausBean.product_stid== 2}"> --%>
<!-- 					<button type="button" class="btn btn-primary btn-lg">已下架</button> -->
<%-- 				</c:if> --%>
<%-- 				<h1>${EnterError}</h1> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</h4> -->
<!-- 						</form> -->
							
					<!-- 					<span class="ml-3">剩餘數量XXX件</span> -->
					<c:forEach var='details' items='${pdetailsList}'>
						<c:if test="${details.product_stock < 10}">
							<span class="ml-3">*
								${details.product_color}色的${details.product_size}僅剩${details.product_stock}件!</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-10">
				<table>
					<h1>商品規格</h1>
					<ul style="list-style: none;" id="">
						<li>國際尺寸</li>
						<li>一般版型</li>
						<li>棉</li>

					</ul>
					<!--====================================商品評論==================================== -->
					<h1>評論內容</h1>
					<div>評分:${product.average_score} (${commentsCount})</div>
				</table>
				<c:forEach var='comment' items='${pcommentlist}'>
					<c:if test="${not empty comment.comment_comment}">
						<div>
							<table>
								<tr style="height: 150px;">
									<td style="width: 300px;"><img src="images/16.png"
										style="width: 200px;"></td>
									<td style="width: 700px;">
										<div>帳號: ${comment.memberBean.member_id}</div>
										<div class="ratings">
											<div class="empty-stars"></div>
											<div class="full-stars" style="width: 70%"></div>
										</div>
										<div class="mt-2">
											評論時間: <span id="">${comment.comment_date}</span>
										</div>
										<div class="mt-2" style="word-break: break-all;">
											評論內容: <span id="">${comment.comment_comment}</span>
										</div>
									</td>
									<td>
										<button style="width: 100px;">濫用檢舉</button>
									</td>
								</tr>
							</table>
							<hr>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-2">
				<h1>推薦商品</h1>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
			</div>
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