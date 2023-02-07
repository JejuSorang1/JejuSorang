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
$(function(){
	$('.locations').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css('cursor',"none")
	})
	$.ajax({
		type:'POST',
		url:'../location/location_list.do',
		data:{"ss":'관람'},
		success:function(response)
		{
			$('#location_list').html(response); // JSON (스프링)
		}
	})
	
	$('.locations').click(function(){
		let ss=$(this).text();
		$.ajax({
			type:'POST',
			url:'../location/location_list.do',
			data:{"ss":ss},
			success:function(response)
			{
				$('#location_list').html(response); // JSON (스프링)
			}
		})
	})
})

</script>
</head>
<body>
	<div class="wrapper row3">
	  <main class="container clear"> 
	    <div class="content"> 
	        <table class="table">
           <tr>
            <td>
            <table class="table" id="type">
            <tr id="type">
              <th class="text-center locations"><img src="../img/exhibition.png" style="width:60px;height:60px"><br><br>관람</th>
              <th class="text-center locations"><img src="../img/nature.png" style="width:60px;height:60px"><br><br>자연</th>
              <th class="text-center locations"><img src="../img/activity.png" style="width:60px;height:60px"><br><br>체험</th>
              <th class="text-center locations"><img src="../img/sports.png" style="width:60px;height:60px"><br><br>스포츠</th>
              <th class="text-center locations"><img src="../img/location.png" style="width:60px;height:60px"><br><br>명소</th>
            </tr>
            </table>
            </td>
           </tr>
           <tr>
             <td>
              <div id="location_list" style="height: 800px;overflow-y:scroll">
              </div>
             </td>
           </tr>
         </table>
	    </div>
	    <div style="width: 10px;height: 50px"></div>
	  </main>
	</div>
</body>
</html>