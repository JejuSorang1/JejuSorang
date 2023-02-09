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
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../mypage/jjim_delete.do?no='+no,
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
        <th>차량명</th>
        <th>차량이미지</th>
        <th class="text-center"></th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
            <td><h4><a href="../rent/car_detail.do?car_no=${vo.no}">${vo.car_name }</a></h4></td>
	        <td><img src="${vo.car_image }" style="width: 130px; height: 130px"></td>       
	        <td class="text-center">
	        <input type=button class="btn btn-xs btn-warning" id="jjim_delete" value="취소" data-no="${vo.no }">
	        </td>
	       </tr>
       </c:forEach>
     </table>
    </main>
  </div>
</body>
</html>