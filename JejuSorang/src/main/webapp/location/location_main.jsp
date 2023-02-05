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
		let fd=$(this).text();
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
	    <!-- main body --> 
	    <!-- ################################################################################################ -->
	    <div class="content"> 
	      <!-- ################################################################################################ -->
	      <div>
	        <table class="table">
           <caption><h3>맛집 정보</h3></caption>
           <tr>
            <td>
             <span class="btn btn-xs btn-danger locations">관람</span>
             <span class="btn btn-xs btn-info locations">자연</span>
             <span class="btn btn-xs btn-primary locations">체험</span>
             <span class="btn btn-xs btn-success locations">스포츠</span>
             <span class="btn btn-xs btn-warning locations">명소</span>
            </td>
           </tr>
           <tr>
             <td>
              <div id="location_list">
                
              </div>
             </td>
           </tr>
         </table>
	      </div>
	      <!-- ################################################################################################ --> 
	      <!-- ################################################################################################ -->
	      <nav class="pagination">
		     <ul>
		     <c:if test="${startPage>1 }">
		       <li><a href="../location/location_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
		      </c:if>
		      <c:forEach var="i" begin="${startPage }" end="${endPage }">
		         <li ${i==curpage?"class=current":"" }><a href="../location/location_list.do?page=${i }">${i }</a></li>
		       </c:forEach>  
		      <c:if test="${endPage<totalpage }">
		       <li><a href="../location/location_list.do?page=${endPage+1 }">Next &raquo;</a></li>
		      </c:if>
		     </ul>
	      </nav>
	      <!-- ################################################################################################ --> 
	    </div>
	    <!-- ################################################################################################ --> 
	    <!-- / main body -->
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>