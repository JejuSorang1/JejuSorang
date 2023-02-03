<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/hotel_all.css"> 
</head>
<body>  
<div class="container">
  <div class="row">
    <div class="col-sm-3">
	  <form name="form1" method="post" action="" enctype="multipart/form-data">   
	    <div class="col-md-12">  
	      <div class="form-group">
		    <div style="width: 10px;height: 50px"></div>
		    <h3>최근 본 목록</h3>  
	      </div>  
          <div class="form-group">
              <div class="input-group date" id="checkin">
              </div>  
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
              <div class="input-group date" id="checkout">
              </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
          </div>
        </div>
	    <div class="col-md-12">	 
	    </div>
	  </form>
	  
	  <form name="form1" method="post" action="" enctype="multipart/form-data"> 
	    <div class="col-md-12">
        </div>
        <div style="height: 10px"></div>
	    <div class="col-md-12">
            <div class="checkbox opinion" id="opinion">
            </div>
        </div>
        <div style="height: 10px"></div>
        <div class="col-md-12">
        </div> 
        
      </form>
    </div>
    
    <div class="col-sm-9 wrap" id="contenthotels">
      <div class="col-md-12 sortbuttons">
      </div>
	  <div style="height: 30px"></div>

    <div class="list-group list row">
        <div class="container">
          <div id="tabs">
           <ul>
             <li><a href="#tabs-1">제주시</a></li>
             <li><a href="#tabs-2">서귀포시</a></li>
           </ul>
           <div id="tabs-1" class="inline">
            <table class="table3">
              <tr>
                <td>
                <%--<c:set var="location" value="${hvo.addr }"/>
                 <c:if test="${fn:contains(location,'제주시') }">
                  주소 제주시 출력할거임 --%>
                  <c:forEach var="hvo" items="${list }" begin="0" end="4">
                    <table class="table4">
                      <tr>
                        <td width="38%" class="text-left" rowspan="4">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" style="width:300px;height:250px"></a>
                        </td>
                        <td width="45%">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><h4>${hvo.name }<span  style="color:orange">(${hvo.star })</span></h4></a>
				          <p> <img src="../img/star.png" style="width:22px; height:22px"><h6>${hvo.grade }</h6></p>
				          <p> <img src="../img/point.png" style="width:22px; height:22px">&nbsp;${hvo.addr }</p>
				          <p> <img src="../img/clock.png" style="width:20px; height:20px">&nbsp;${hvo.time }</p>
                        </td>
                        <td width="17%">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><button type="button" class="btn btn-md btn-warning" style="float: right;">상세보기</button></a>
                        </td>
                      </tr>
                    </table>
                  </c:forEach> 
                  <%--</c:if>  --%>
                </td>
              </tr>
            </table>
            </div>
            <div id="tabs-2" class="inline">
            <table class="table3">
              <tr>
                <td>
                <%-- 주소 서귀포시 출력할거임 --%>
                  <c:forEach var="hvo" items="${list }" begin="0" end="4">
                    <table class="table4">
                      <tr>
                        <td width="38%" class="text-left" rowspan="4">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" style="width:300px;height:250px"></a>
                        </td>
                        <td width="45%">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><h4>${hvo.name }<span  style="color:orange">(${hvo.star })</span></h4></a>
				          <p> <img src="../img/star.png" style="width:22px; height:22px"><h6>${hvo.grade }</h6></p>
				          <p> <img src="../img/point.png" style="width:22px; height:22px">&nbsp;${hvo.addr }</p>
				          <p> <img src="../img/clock.png" style="width:20px; height:20px">&nbsp;${hvo.time }</p>
                        </td>
                        <td width="17%">
                          <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><button type="button" class="btn btn-md btn-warning" style="float: right;">상세보기</button></a>
                        </td>
                      </tr>
                    </table>
                  </c:forEach> 
                </td>
              </tr>
            </table>
            </div>
           </div>
          </div>
        </div>
      
      
	     <nav class="pagination">
	        <ul>
	         <c:if test="${startPage>1 }">
	          <li><a href="../hotel/hotel_all.do?page=${startPage-1 }">&laquo; Previous</a></li>
	         </c:if>
	          <c:forEach var="i" begin="${startPage }" end="${endPage }">
	            <li ${i==curpage?"class=current":"" }><a href="../hotel/hotel_all.do?page=${i }">${i }</a></li>
	          </c:forEach>  
	         <c:if test="${endPage<totalpage }">
	          <li><a href="../hotel/hotel_all.do?page=${endPage+1 }">Next &raquo;</a></li>
	         </c:if>
	        </ul>
      </nav>
    </div>
  </div>
  </div>

</body>
</html>
