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
	$('#delBtn').click(function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()===""){
			$('#pwd').focus();
			return
		}
		$.ajax({
			type:'post',
			url:'../member/join_delete_ok.do',
			data:{"pwd":pwd},
			success:function(response){
				let res=response.trim();
				if(res==="no"){
					alert('비밀번호가 틀렸습니다')
					$('#pwd').val("")
					$('#pwd').focus();
				}else{
					alert('회원탈퇴가 완료되었습니다')
					location.href="../main/main.do"
				}
			}
		})
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->

    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3 row">
   <main class="container clear">
   <div style="height: 20px"></div>
   <h2 class="sectiontitle text-center">회원 탈퇴</h2>
   <table class="table">
     <tr>
       <td class="text-center inline">
         비밀번호 : <input type=password size=20 class="input-sm" id="pwd">
       </td>
     </tr>
     <tr>
       <td class="text-center inline">
         <input type=button value="회원탈퇴" class="btn btn-sm btn-default" id="delBtn">
         <input type=button value="취소" class="btn btn-sm btn-default" onclick="javascript:history.back()">
       </td>
     </tr>
   </table>
   
   </main>
 </div>
</body>
</html>