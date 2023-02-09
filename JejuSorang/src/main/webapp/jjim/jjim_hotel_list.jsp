<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#jjim_delete').click(function(){
		let jno=$(this).attr("data-jno");
		$.ajax({
			type:'post',
			url:'../mypage/jjim_delete.do?no='+jno,
			
			success:function(response){
				$('#content').html(response)
			}
		})
	})
})
</script>
</head>
<body>
  <div class="wrapper row3">
    <main class="container clear">
     <h2 class="sectiontitle">찜한 리스트</h2>
     <div style="height: 5px"></div>
     <table class="table text-center">
       <tr>
        <th class="text-center">숙소명</th>
        <th class="text-center">숙소이미지</th>
        <th class="text-center"></th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
         	<td><h4><a href="../hotel/hotel_detail.do?hno=${vo.no}">${vo.name }</a></h4></td>
	        <td><img src="${vo.hotel_image }" style="width:130px;height: 130px"></td>
	        <td class="text-center">
	         <input type=button class="btn btn-xs btn-warning" id="jjim_delete" value="취소" data-jno="${vo.jno }">
	       </tr>
       </c:forEach>
     </table>
    </main>
  </div>
</body>
</html>