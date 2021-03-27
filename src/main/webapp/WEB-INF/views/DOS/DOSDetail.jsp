<!-- 詳細場地資訊 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
.dos-pho {
    height: 300px;
    padding-top: 10rem;
}

@media (max-width: 892px) {
    .dos-pho {
        height: 300px;
        padding-top: 0;
    }
}


.dosimg {
    font-size: 25px;
    color: #fff;
    text-align: center;


}

.dos-list {
    padding-top: 5rem;

}

.dos-main {
    color: #fff;
    padding-left: 200px;


}

.dos_name span{
    font-size: 1.125em;
    line-height: 100%;
    letter-spacing: 0.2em;
    color: #000;
    margin: 0 0 25px;
    font-size: 100px;
    font-family: "DIN Next LT Pro", sans-serif;
    -webkit-font-smoothing: antialiased;
}

.dos_name .chose_dos{
    padding: 0px;
}
.dos_name .chose_dos span{
    border: solid 1px #000;
    padding: 5px;
    border-radius:5px;

}
.dos_name .chose_dos span:hover{
    border: solid 1px #fff;
    padding: 5px;
    border-radius:5px;
    color: rgb(231, 231, 231);
    background-color: #DE520E;

}

@media (max-width: 792px) {
    .dos-main {
        padding-left: 0;
    }
}

.dos-main div {
    margin: 2rem 0;
}

.dos-main .dos-1 div {
    border-bottom: 1px solid #FFF;
    display: inline;
}

.dos-main ul {
    padding: 0px;
}

.dos-img-slider {
    clear: both;
    position: relative;
}

.dos-img {
    height: 278px;
    position: relative;
}


}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />    
  <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">場地頁面</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁 <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">場地清單 <i class="ion-ios-arrow-forward"></i></span><span>場地頁面 <i class="ion-ios-arrow-forward"></i></span></p>
                </div>
            </div>
        </div>
    </section>
  
    <div id="dos-detail" style="background-color:#fff">
        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-md-8 dos-list">
                        <div class="row no-gutters align-items-center">
                            <div class="text ftco-animate dos-main">           
                                <div class="dos_name d-flex justify-content-between"><span>${DOSID.DOS_NAME}</span>
                                <a href="../ACT/ACT_Main_new?DOSID=<c:out value="${DOSID.DOS_ID}"/>" class="btn chose_dos" ><span>舉辦比賽</span></a>
                                </div>              
                                <br>
                                <div class="dos-1">
                                    <div>聯絡資訊</div>
                                    <ul class="line"><span class="mr-1">管理人:</span><span>${DOSID.DOS_AD}</span></ul>
                                    <ul class="name mt-2"><span class="mr-1">聯絡人:</span><span>${DOSID.DOS_OFFICER}</span></ul>
                                    <ul class="phone"><span class="mr-1">電話:</span><span>${DOSID.DOS_PHONE}</span></ul>                                   
                                </div>
                                <div class="dos-1">
                                    <div>尚可容納人數</div>
                                    <ul class="name mt-2"><span class="mr-1">人數:</span><span>${DOSID.DOS_CY}</span></ul>
                                </div>
                                <div class="dos-1">
                                    <div>交通方式</div>
                                    <ul class="name mt-2"><span class="Content" style="white-space: pre-wrap;word-break: normal;">${DOSID.DOS_TRANS}</span></ul>
                                </div>
                                <div class="dos-1">
                                    <div>場地簡介</div>
                                    <ul class="name mt-2"><span class="Content" style="white-space: pre-wrap;word-break: normal;">${DOSID.DOS_PS}</span></ul>
                                </div>
                                <div class="dos-1">
                                    <div>場地費用時間</div>
                                    <ul class="name mt-2"><span>
                                            平日06:00-18:00點 290元<br>
                                            平日晚上18:00-24:00點 480元<br>
                                            假日早上06:00-12:00點 290元<br>
                                            假日下午12:00-18:00點 380元<br>
                                            假日晚上18:00-24:00點 480元
                                        </span></ul>
                                </div>
                                
                                <div class="dos-1">
                                    <div>場地地址</div>
                                    <ul class="name mt-2"><span>${DOSID.DOS_ADDR}</span></ul>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3613.4253701620737!2d121.51297311537945!3d25.087458342299538!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442aeb63bc6b19d%3A0x50fe2dab44d409ec!2z55m-6b2h5rKz5r-x5YWs5ZyS!5e0!3m2!1szh-TW!2stw!4v1615143555958!5m2!1szh-TW!2stw" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">    
                        <div class="row ftco-animate dos-pho">
                           <div class="dosimg">場地圖片</div><br>
                                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <c:forEach var="name" items="${DOSPICID}" varStatus="status">
                                            <c:choose>
                                            <c:when test="${status.count==1}" >
                                            <div class="carousel-item active">
                                                <img src="data:image/jpg;base64,${name}" class="d-block w-100"/>
                                            </div>
                                            </c:when>
                                            <c:otherwise>
                                            <div class="carousel-item ">
                                                <img src="data:image/jpg;base64,${name}" class="d-block w-100"/>
                                            </div>
                                            </c:otherwise>
                                            </c:choose>
                                        </c:forEach>                                       
                                    </div>
                                    
                                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                         
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
    
<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />    
</body>
</html>