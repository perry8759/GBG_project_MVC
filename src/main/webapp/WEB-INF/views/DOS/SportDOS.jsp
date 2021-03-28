<!-- 所有場地資訊 使用usebean 因無需要即時更新-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
     <jsp:useBean id="memberService" class="com.web.GBG_project.DOS.service.impl.DOSServiceImpl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.search-form-dos .btn{
	border:none;
	padding:0px;

    width: 100%;
    height: 45px;
    background: #ff3d1c;
    font-size: 20px;
    line-height: 1;
    text-align: center;
    color: #fff;
    display: block;
    padding: 15px;
    border-radius: 0px;
    text-transform: capitalize;
    font-family: "Sulphur Point", sans-serif;
    line-height: 15px;
    font-size: 15px;
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
            <h1 class="mb-3 bread">場地清單</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁 <i class="ion-ios-arrow-forward"></i></a></span> <span>場地清單 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    
    
    <section class="ftco-section ftco-degree-bg">
      <div class="container-fluid">
        <div class="position-relative pt-10 pb-8">
            <div class="header-text">
                <div class="d-flex justify-content-center">
                    <form action="<c:url value='/DOS/search_dos'/>" class="search-box">
                        <div class="input-form">
                            <input type="text" name="freetext" placeholder="想去哪裡打球?">
                        </div>
                        <div class="select-form">
                            <div class="select-itms">
                                <select name="dosselect" id="select1">
                                    <option value="台北市">台北市</option>
                                    <option value="新北市">新北市</option>                                   
                                </select>
                            </div>
                        </div>
                        <div class="search-form-dos">
                           
                            <button class="btn">
                                Search
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${! empty DOS2}">
    <c:set var="currentPage" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                         <c:set var="splitURI" value="${fn:split(currentPage, '/')}"/> 
                         <c:set var="lastValue" value="${splitURI[fn:length(splitURI)-1]}"/>
    </c:if>
    
    <div class="container px-md-0">
    
        <div class="row">
            <div class="col-12 align-items-stretch">
                <div class="contact-wrap w-100 p-md-5 p-4">
                    <ul class="nav nav-tabs col-12" role="tablist" id="tabs">
                        
                         <c:forEach var="sport" items="${dossports}">                        
                         <c:choose>
                        <c:when test="${lastValue==sport.DOS_SPORT_ID}"> 
                        <li class="nav-item col-4"><a   class="nav-link active"  href="<c:url value='/DOS/DOS_Index/${sport.DOS_SPORT_ID}'/>">${sport.DOS_SPORT_NAME}</a></li>                       
                        </c:when>
                        <c:otherwise>
                        <li class="nav-item col-4"><a   class="nav-link"  href="<c:url value='/DOS/DOS_Index/${sport.DOS_SPORT_ID}'/>">${sport.DOS_SPORT_NAME}</a></li>                       
                        
                        </c:otherwise>
                        </c:choose>
             </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    
       
    
   <c:if test="${! empty DOS}">
    <div class="container " >
        <div class="row " >
            <div class="col-md-12">
            
                <div class="row">
                <c:forEach var="mem"  varStatus="statusX" items="${DOS}">
            
                    <div class="col-md-4 d-flex">
                        <div class="site ftco-animate">
                        <c:forEach var="dosp"   items="${mem.dos_pictureee}">
                            <div class="img d-flex align-items-center justify-content-center" style="background-image: url(data:image/jpg;base64,${dosp.DOS_PICTURE_PIC_ONE});">
                                <div class="desc">
                                    <p class="meta-prod d-flex">
                                        <a href="../ACT/ACT_Main_new?DOSID=<c:out value="${mem.DOS_ID}"/>" class="d-flex align-items-center justify-content-center"><span class="flaticon-writing"></span></a>
                                       
                                        <a href="DOS_detail?DOSID=${mem.DOS_ID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-view"></span></a>
                                    </p>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="text text-center">
                                <span class="category">${mem.DOS_NAME}</span>
                                <h2>地址:${mem.DOS_ADDR}</h2>
                                <h2>空間人數:${mem.DOS_CY}</h2>
                                <p class="mb-0"><span class="price price">費用:${mem.DOS_PAY}</span></p>
                            </div>
                        </div>
                    </div>
                     </c:forEach>
                </div>
              
                <div class="row mt-5 mb-5">
                    <div class="col text-center">
                    <div class="block-27">
                      <ul>
                        <li><a href="?start=${pre}">&lt;</a></li>
                        <c:forEach items="${allpage}" var="item">
                                 <li><a href="?start=${(item-1)*3}">${item}</a></li>
                        </c:forEach>                      
                        <li><a href="?start=${next}">&gt;</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
            
            </div>
        </div>
        
        
       
    </div>
    </c:if>
    <c:if test="${! empty DOS2}">
    <div class="container">
        <div class="row " >
            <div class="col-md-12">
            
                <div class="row">
                <c:forEach var="mem"  varStatus="statusX" items="${DOS2}">
                    <div class="col-md-4 d-flex">
                        <div class="site ftco-animate">
                        <c:forEach var="dosp"   items="${mem.dos_pictureee}">
                            <div class="img d-flex align-items-center justify-content-center" style="background-image: url(data:image/jpg;base64,${dosp.DOS_PICTURE_PIC_ONE});">
                                <div class="desc">
                                    <p class="meta-prod d-flex">
                                        <a href="../ACT/ACT_Main_new?DOSID=<c:out value="${mem.DOS_ID}"/>" class="d-flex align-items-center justify-content-center"><span class="flaticon-writing"></span></a>
                                       
                                        <a href="../DOS_detail?DOSID=${mem.DOS_ID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-view"></span></a>
                                    </p>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="text text-center">
                                <span class="category">${mem.DOS_NAME}</span>
                                <h2>地址:${mem.DOS_ADDR}</h2>
                                <h2>空間人數:${mem.DOS_CY}</h2>
                                <p class="mb-0"><span class="price price">費用:${mem.DOS_PAY}</span></p>
                            </div>
                        </div>
                    </div>
                     </c:forEach>
                </div>
               
                <div class="row mt-5 mb-5">
                    <div class="col text-center">
                    <div class="block-27">
                      <ul>
                        <li><a href="?start=${pre}">&lt;</a></li>
                        <c:forEach items="${allpage}" var="item">
                                 <li><a href="?start=${(item-1)*3}">${item}</a></li>
                        </c:forEach>                      
                        <li><a href="?start=${next}">&gt;</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        
        
       
    </div>
</c:if>
    
    
    <c:if test="${! empty DOS3}">
    <div class="container " >
        <div class="row " >
            <div class="col-md-12">
            
                <div class="row">
                <c:forEach var="mem"  varStatus="statusX" items="${DOS3}">
            
                    <div class="col-md-4 d-flex">
                        <div class="site ftco-animate">
                        <c:forEach var="dosp"   items="${mem.dos_pictureee}">
                            <div class="img d-flex align-items-center justify-content-center" style="background-image: url(data:image/jpg;base64,${dosp.DOS_PICTURE_PIC_ONE});">
                                <div class="desc">
                                    <p class="meta-prod d-flex">
                                        <a href="../ACT/ACT_Main_new?DOSID=<c:out value="${mem.DOS_ID}"/>" class="d-flex align-items-center justify-content-center"><span class="flaticon-writing"></span></a>
                                       
                                        <a href="DOS_detail?DOSID=${mem.DOS_ID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-view"></span></a>
                                    </p>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="text text-center">
                                <span class="category">${mem.DOS_NAME}</span>
                                <h2>地址:${mem.DOS_ADDR}</h2>
                                <h2>空間人數:${mem.DOS_CY}</h2>
                                <p class="mb-0"><span class="price price">費用:${mem.DOS_PAY}</span></p>
                            </div>
                        </div>
                    </div>
                     </c:forEach>
                </div>
              
                <div class="row mt-5 mb-5">
                    <div class="col text-center">
                    <div class="block-27">
                      <ul>
                        <li><a href="?start=${pre}&freetext=${freetext}&dosselect=${dosselect}">&lt;</a></li>
                        <c:forEach items="${allpage}" var="item">
                                 <li><a href="?start=${(item-1)*3}&freetext=${freetext}&dosselect=${dosselect}">${item}</a></li>
                        </c:forEach>                      
                        <li><a href="?start=${next}&freetext=${freetext}&dosselect=${dosselect}">&gt;</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
            
            </div>
        </div>
        
        
       
    </div>
    </c:if>
    
    
    
    </section>

<!-- footer -->
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>