<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('.rooms').click(function(){
		let fd=$(this).text();
		$.ajax({
			type:'POST',
			url:'../reserve/reserve_room.do',
			data:{"fd":fd},
			success:function(response)
			{
				$('#room_list').html(response); // JSON (스프링)
			}
		})
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  
</div>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">호텔 예약</h2>
   <div style="height: 5px"></div>
   <table class="table" style="width: 100%;height: 700px">
     <tr>
       <td class="success" width=30% height="500">
         <table class="table">
           <caption><h3>호텔 정보</h3></caption>
           <tr>
            <td>
              <span class="rooms">호텔이미지</span>
            </td>
           </tr>
           <tr>
             <td>
              <div id="room_list" style="height: 450px;overflow-y:scroll">
                
              </div>
             </td>
           </tr>
         </table>
       </td>
       <td class="info" width=40% height="500">
         <table class="table">
           <caption><h3>예약일 정보</h3></caption>
           <tr>
             <td>
              <div id="select_date"></div>
             </td>
           </tr>
         </table>
       </td>
       <td class="danger" width=30% rowspan="2" height="700">
         <table class="table">
           <caption><h3>예약 정보</h3></caption>
           <tr>
             <td class="text-center" colspan="2">
              <img src="#" style="width: 250px;height: 200px" id="room_img">
             </td>
           </tr>
           <tr>
             <td class="text-left" colspan="2"><span id="hotel_name" style="color:black"></span></td>
           </tr>
           <tr>
           <tr>
             <td class="text-left" colspan="2"><span id="room_name" style="color:black"></span></td>
           </tr>
           
           <tr>
             <th width="30%">체크인 날짜</th>
             <td width=70%><span id="r_ckin"></span></td>
           </tr>
           <tr>
             <th width="30%">체크아웃 날짜</th>
             <td width=70%><span id="r_ckout"></span></td>
           </tr>
           <tr>
             <th width="30%">가격</th>
             <td width=70%><span id="r_price"></span></td>
           </tr>
           <tr>
             <td colspan="2" class="text-center ok_btn" style="display:none">
               <form method="post" action="../reserve/reserve_ok.do">
                 <input type=hidden name="hno" id="hno">
                 <input type=hidden name="lno" id="lno">
                 <input type=hidden name="ckin" id="ckin">
                 <input type=hidden name="ckout" id="ckout">
                 <input type=submit value="결제하기" class="btn btn-lg btn-primary">
               </form>
             </td>
           </tr>
         </table>
       </td>
       
     </tr>
   </table>
   <!-- <div id="dialog" title="Basic dialog">
    <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the &apos;x&apos; icon.</p>
   </div> -->
  </main>
  </div>
</body>
</html>