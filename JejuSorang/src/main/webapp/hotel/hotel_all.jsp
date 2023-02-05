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
	$('#tabs-1').click(function(){
		let jeju=$('#jeju').val();
		
		$.ajax({
			type:'post',
			url:'../hotel/hotel_all.do',
			data:{"jeju":addr1},
			success:function(response)
			{
				let res=resonse.trim();
				$('#jeju').html(response);
			}
		})
	})
	$('#tabs-2').click(function(){
		let seo=$('#seo').val();
		
		$.ajax({
			type:'post',
			url:'../hotel/hotel_all.do',
			data:{"seo":addr2},
			success:function(response)
			{
				let res=resonse.trim();
				$('#seo').html(response);
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
	 <h3>최근 본 목록</h3> 
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
		  <%--  <c:if test="">--%>
		   <c:forEach var="hvo" items="${list }" begin="0" end="4">
              <table class="table4" id="jeju">
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
           <%-- </c:if>--%> 
		  </div>
		  <div id="tabs-2" class="inline">
		    <%--서귀포시 데이터 --%>
		   <%--  <c:if test="">--%>
		   <c:forEach var="hvo" items="${list }" begin="0" end="4">
             <table class="table4" id="seo">
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
            <%-- </c:if>--%>	    
		  </div>
		</div>
	  </main>
	</div>
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
  </div>
</body>
</html>