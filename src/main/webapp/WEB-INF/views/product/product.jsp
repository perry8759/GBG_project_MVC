<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/style.css"> --%>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/STAR.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/noob.css">
   <script src="${pageContext.request.contextPath}/js_member/jquery-3.5.1.min.js"></script>
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
<!-- <body style="background: rgb(234, 252, 252);"> -->
<body style="background-color: rgb(212, 225, 231)">
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<jsp:include page="/WEB-INF/views/fragment/mallOption.jsp" />
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------------- -->	
	<div class="container-fluid my-5" style="width: 90%;" >
            <div class="row border-bottom-0 border p-3"style="background: rgb(255, 255, 255);">
                <div class="col-lg-1 col-sm-12">
                    <c:forEach items="${ppicList}" var="i" varStatus="vs">
                		<img id="imgm${vs.count}" src="getAllPicture?productId=${product.product_id}&imageId=${vs.index}" style="max-width: 100px;" class="border border-secondary my-2">
                	</c:forEach>

                </div>
                <div class="col-lg-5 "><img src="getAllPicture?productId=${product.product_id}&imageId=0" id="feedback" style="max-width: 600px;width:100%;"></div>
                <div class="col-lg-6">
                    <div class="row" > 
                        <div class="col-12"style="width: 600px;height:170px;word-break: break-all;font-size: 3rem;">${product.product_title}</div> 
                    </div>
                    <div class="row" style="width: 600px;height:100px;">
                        <div class="col-lg-12">
                            <div class="ratings">
                            <div class="empty-stars"></div>
                            <div class="full-stars" style="width:${product.average_score * 20}%"></div>${product.average_score}
                            </div>
                        </div>
                    </div>
                 <form method="POST" action="${pageContext.request.contextPath}/shoppingCart/addProduct">
                <div class="row my-3" style="font-size: 2rem;">優惠價:${product.product_price}元</div>
                    <div class="row justify-content-between" style="width: 600px;height:50px;"><h4>寄送方式</h4><h4>客樂得貨到付款</h4><h4>滿千免運</h4></div>
                    <div class="row" style="width: 600px;height:50px;">
                        <h4>顏色
                            <select name="productColor" style="margin-left: 150px;width: 100px;">
								<option value="-1" label="請選擇" />
								<c:forEach var='color' items='${pColors}'>
							 		<option value="${color}" label="${color}" />
						 		</c:forEach>
						 	</select>
                        </h4>
                    </div>
                    <div class="row" style="width: 600px;height:70px;">
                        <h4>尺寸
                            <select name="productSize" style="margin-left: 150px;width: 100px;">
								<option value="-1" label="請選擇" />
								<c:forEach var='size' items='${pSizes}'>
									<option value="${size}" label="${size}" />
								</c:forEach>
							</select>
                        </h4>
                    </div>
                    <div class="row"><h4>數量 <input type="number" name="productAmount" min="1" value="1" style="width: 50px; margin-left: 150px;"></h4><span class="ml-3">件</span></div>
                </div>
            </div>
            <div class="row justify-content-end border border-top-0"style="background: rgb(255, 255, 255);">
                <div class="col-lg-8"></div>
                <div class="col-lg-4 p-2">
                	<input type="hidden" name="productId" value="${product.product_id}">
                    <button type="button" class="btn btn-primary btn-lg mb-2" onclick="this.form.submit()">加入購物車</button>
<!--                     <button type="button" class="btn btn-primary btn-lg ml-3">立即結帳</button> -->
                </div>
                </form>
            </div>
        </div>
            <div class="container-fluid" style="width: 90%;">
            <div class="row mt-5">
                <div class="col-lg-9 p-3" style="background: rgb(255, 255, 255);margin-right: 20px;">
                    <table > 
                        <h1>商品規格</h1>
                        <ul style="list-style: none;"id="">
                            ${product.product_textdetails}
                        </ul>
                        <h1>商品評價</h1>
                        <div>
                        	評分:${product.average_score} (${commentsCount})
                        </div>
                    </table>
                    <!-- 評論區塊 第一則-->
                    <c:forEach var='comment' items='${pcommentlist}'>
	                    <table >
	                        <hr>
	                        <tr style="height: 150px;">
	                            <td style="width: 700px;">
	                                <div>帳號: ${comment.memberBean.member_account}</div> 
	                                <div class="ratings">
	                                    <div class="empty-stars"></div>
	                                    <div class="full-stars" style="width:${comment.comment_value * 20}%"></div>
	                                </div>
	                                <div class="mt-2">評論時間: <span id="">${comment.comment_date}</span>
	                                <div class="mt-2"style="word-break:break-all;">評論內容: <span id="">${comment.comment_comment}</span></div> 
	                            </td>
<!-- 	                            <td> -->
<!-- 	                                <button style="width: 100px;"class="btn btn-primary ml-4">檢舉評論</button> -->
<!-- 	                            </td> -->
	                        </tr>
	                    </table>
                    </c:forEach>
                </div>
                <!-- 右側推薦商品區域 -->
                <div class="col-lg-0 p-3" style="background: rgb(255, 255, 255); width: 330px">
                <h1>推薦商品</h1>
                	<c:forEach items="${recommendProduct}" var="i" varStatus="vs" end="5">
                		<table style="margin-top: 30px;">
		                    <div class="col-lg-21  d-flex">
		                        <img src="getCoverPicture?pId=${i.product_id}" style="max-width: 80px;height: 80px;" >
		                        <div class="ml-4">
									<div style="word-break: keep-all;font-size: 1rem;height: 30px;">${i.product_title}</div>
		                        <div>
		                            <div class="ratings">
		                                <div class="empty-stars"></div>
		                                <div class="full-stars" style="width:${i.average_score * 20}%"></div>
		                            </div>
		                            <div >
		                            價格${i.product_price}元
		                        </div>
		                    </div>
	                    </table>
                	</c:forEach>
                </div>
            </div>
        </div>
        <span id="shoppingcar"><a href="4購物車(RWD需要調整).html"><img src="cart4.svg" style="width: 80px;height: 80px;"></a></span>
    

    <!-- Optional JavaScript; choose one of the two! -->
        <script>
       
        </script>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
  </body>
</html>