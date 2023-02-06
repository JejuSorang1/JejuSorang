<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']	
})
$(function(){
	$('#detailBtn').click(function(){
	      Shadowbox.open({
	         content:'../location/location_detail.do',
	         player:'iframe',
	         width:420,
	         height:600,
	         title:'관광지 상세정보'
	      })
	   })
})
</script>
</head>
<body>
  <table class="table">
  <c:forEach var="vo" items="${list }">
   <tr>
     <td width="20%" class="text-center">
		<h4>${vo.title }</h4>
     </td>
     <td width="50%" class="text-center">
       <c:if test="${vo.addr_doro!=null }">
       <p><img src="../img/point.png" style="width:22px; height:22px">${vo.addr_doro }</p>
       </c:if>
       <p>
       <c:if test="${vo.addr_doro==null }">
       <img src="../img/point.png" style="width:22px; height:22px">
       </c:if>
       ${vo.addr_ji }</p>
     </td>
     <td width="20%" class="text-center">
       <span id="detailBtn" class="btn btn-sm btn-warning">상세보기</span>
     </td>
     <td width="10%">
     	찜,,,할까말까,,,
     </td>
   </tr>
   </c:forEach>

  </table>
</body>
</html>