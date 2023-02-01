<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<div class="container">
  <div class="row">
    <div class="col-sm-3">
		<div class="">
		<form name="form1" method="post" action="" enctype="multipart/form-data">   
		최근 본 목록
		</form>
		</div>
	</div>
	
    <div class="col-sm-9 wrap" id="contenthotels">
      <section class="col-md-12 " >
	    <div class="container"> 
		  <div class="col-sm-10" >
		    <c:forEach var="hvo" items="${list }" begin="0" end="4">
			  <div style="display: inline-block;">
			    <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" style="width:300px;height:200px"></a>
			  </div>
			  <div style="display: inline-block;">
			    <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><h3>${hvo.name }<span  style="color:orange">(${hvo.star })</span></h3></a>
				  <div class="short-text"><h6>${hvo.grade }</h6></div>
				  <p> <img src="../img/point.png" style="width:22px; height:22px">&nbsp;${hvo.addr }</p>
				  <p> <img src="../img/clock.png" style="width:20px; height:20px">&nbsp;${hvo.time }</p>
			  </div>
			  <div>
			    <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><button type="button" class="btn btn-md btn-warning" style="float: right;">상세보기</button></a>
			  </div>
			  <br><br>
			  <hr>
				<br><br>
				</c:forEach>
				</div>
	        </div>
	    </section>
      
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