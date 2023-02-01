<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 30px;
}
.row{
  width: 550px;
  margin: 0px auto;

}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#postfindBtn').click(function(){
		let dong=$('#dong').val();
		if(dong.trim()===""){
			$('#dong').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../member/postfind_result.do',
			data:{"dong":dong},
			success:function(result){
				$('#print').html(result)
			}
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
          <td class="text-center">
            입력:&nbsp;<input type=text name="dong" id="dong" size=20 class="input-sm">
            <input type=button value="우편번호검색" class="btn btn-sm btn-danger" id="postfindBtn">
          </td>
        </tr>
      </table>
      <span id="print">
        
      </span>
    </div>
  </div>
</body>
</html>