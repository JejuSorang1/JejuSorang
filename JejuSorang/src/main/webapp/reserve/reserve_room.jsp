<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.trs').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css('cursor',"none")
	})
	$('.trs').click(function(){
		let img=$(this).attr("data-img")
		let name=$(this).attr("data-name");
		let fno=$(this).attr("data-rno")
		$('#room_img').attr("src",img)
		$('#room_name').text(name)
		$('#rno').val(rno)
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
			data:{"rno":rno},
			success:function(response)
			{
				$('#select_date').html(response)
			}
		})
	})
})
</script>
</head>
<body>
	<table class="table">
	   <tr class="success">
	     <th class="text-center"></th>
	     <th class="text-center">객실명</th>
	   </tr>
	   <c:forEach var="rvo" items="${list }">
	     <tr class="trs" data-img="${rvo.room_image }" data-name="${rvo.room_name }" data-rno="${rvo.room_no }">
	      <td class="text-center">
	        <img src="${rvo.room_image }" style="width: 30px;height: 30px">
	      </td>
	      <td>${rvo.room_name }</td>
	     </tr>
	   </c:forEach>
	  </table>
</body>
</html>