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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/hotel_all.css"> 
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$("#tabs").tabs();
	$.ajax({
		type:'POST',
		url:'../hotel/hotel_all.do',
		data:{"ss":'제주시'},
		success:function(response)
		{
			$('#hotel_all_list').html(response); // JSON (스프링)
		}
	})
	
	$('#tabs-1').click(function(){
		let fd=$(this).text();
		$.ajax({
			type:'POST',
			url:'../hotel/hotel_detail.do',
			data:{"ss":'제주시'},
			success:function(response)
			{
				$('#tabs-1').html(response); // JSON (스프링)
			}
		})
	})
	$('#tabs-2').click(function(){
		let fd=$(this).text();
		$.ajax({
			type:'POST',
			url:'../hotel/hotel_detail.do',
			data:{"ss":'서귀포시'},
			success:function(response)
			{
				$('#tabs-2').html(response); // JSON (스프링)
			}
		})
	})
})
</script>

</head>
<body>  

  <div class="container">
    <div class="row">
    <div class="col-sm-3">
      <div style="width: 10px;height: 50px"></div>

	 <h3 class="sectiontitle">최근 본 목록</h3> 
	 <div class="inline">
	  <table class="table">
       <c:forEach var="hvo" items="${cList }" varStatus="s">
        <c:if test="${s.index<9 }">
         <a href="../hotel/hotel_detail.do?hno=${s.hno }"><img src="${s.poster }" style="width: 100px;height: 100px"></a>
        </c:if>
       </c:forEach>
       </table>
      </div>
    </div>

    </div>  

    <div class="col-sm-9">
	<div class="wrapper row3">
	  <main class="container clear">
	     <div id="tabs">
	      <ul>
		    <li><a href="#tabs-1">제주시</a></li>
		    <li><a href="#tabs-2">서귀포시</a></li>
		  </ul>
		  <div id="tabs-1" class="inline">
		   <%--제주시 데이터 --%>
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
       <div style="width: 10px;height: 50px"></div>
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
		  <div id="tabs-2" class="inline">
		    <%--서귀포시 데이터 --%>  
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
       <div style="width: 10px;height: 50px"></div>
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
	  </main>
	</div>
	
	</div>
	<div style="width: 10px;height: 50px"></div>
	</div>
  </div>
</body>
</html>