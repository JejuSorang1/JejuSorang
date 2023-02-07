<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#member_update').click(function(){	
		$.ajax({
			type:'post',
			url:'../member/join_update.do',
			success:function(response){
			$('#content').html(response)
			}
		})
	})
})
</script>

</head>
<body>
<div style="height: 30px"></div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    
    
      <h3 class="text-center">${sessionScope.name } 님의 마이페이지</h3>
      <div style="height: 15px"></div>
      <%-- 메뉴 --%>
      <div class="row" style="display: flex; justify-content: center;">
      <div class="btn-group btn-group-justified">
		  <div class="btn-group">
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >
		    개인정보 <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu">
		      <li><input type=button value="회원정보 수정" id="member_update"></li>
		      <li><span>회원탈퇴</span></li>
		    </ul>
		  </div>
		  <div class="btn-group">
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		    내 후기 <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu">
		      <li><span>호텔</span></li>
		      <li><span>렌트카</span></li>
		    </ul>
		  </div>
		  <div class="btn-group">
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		    예약 관리 <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu">
		      <li><span>호텔</span></li>
		      <li><span>렌트카</span></li>
		    </ul>
		  </div>
		  <div class="btn-group">
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		    찜 <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu">
		      <li><span>호텔</span></li>
		      <li><span>렌트카</span></li>
		    </ul>
		  </div>
		  <button type="button" class="btn btn-default">좋아요</button>
	  </div>
      </div>
    <div id="content"> 
      <jsp:include page="../member/join_update.jsp"></jsp:include>
    </div>

    <!-- / main body -->
    
  </main>
  </div>
</body>
</html>