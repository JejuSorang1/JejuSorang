<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.com"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="style.css">
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"> 
<script type="text/javascript">
let u=0;
$(function(){
	$('.ups').click(function(){
		$('.rupdate').hide();
		let all_review_no=$(this).attr("data-no");
		if(u==0)
		{
			$(this).text("취소");
			$('#u'+all_review_no).show();
			u=1;
		}
		else
		{
			$(this).text("수정");
			$('#u'+all_review_no).hide();
			u=0;
		}
	})
	 	$("#reserveBtn").click(function(){
		$("#dialog").dialog({
	    	   autoOpen : false        
	           , width : 1200            
	           , height :600        
	           , modal : true            
	           , resizeable : false    
	    }).dialog("open");
	
	})
	 	
	$('#del_btn').click(function(){
		let all_review_no=$(this).attr("data-no")
		let detail_no=$('#detail_no').val();
		let cate_no=2;
		$.ajax({
			type:'post',
			url:'../all_review/all_review_delete.do',
			data:{"detail_no":detail_no,"all_review_no":all_review_no,"cate_no":cate_no},
			success:function(response){
			  location.href="../rent/car_detail.do?car_no="+detail_no;
			}
		})

	})
		$("#reserveBtn").click(function(){
		$("#dialog").dialog({
	    	   autoOpen : false        
	           , width : 1200            
	           , height :600        
	           , modal : true            
	           , resizeable : false    
	    }).dialog("open");
	})
})
</script>

<style type="text/css">

.box{
   margin:40px;
   padding: 40px;
   width:400px;
   height: 400px;
   border: 1px solid gray;
   position: relative;		
   top: 50px;
   left: 130px;
} 
#reserveBtn{
   width:300px;
   height: 50px;
   background-color: orange;
   color:white;
}
.inner-box{
   width: 300px;
   height: 100%; 
}
#filter{
	position: relative;
    width: 300px;
    height: 300px;
    left: 2px;
    top: 10px;
    background-color: white;
}
#mybutton{
    width: 200px;
    height:40px;
    background-color:orange 
}
#td1{
   padding: 40px;
}
#rimg{
   border: 10;
   border-color: orange;
}
.figure{
   margin: 45px;
}
#dialog{
   padding:0px 13px 24px;
}
#coupon{
   padding:1px;
   margin:2px;
}
</style>

</head>
<body>

<div class="wrapp">
  <main class="container">
    <div class="row">   
       <figure class="figure">
		 <img src="${vo.car_image }" width="500px" height="450px">
		  <p class="tip" style="font-size: 15px">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</p>
           <h4 style="font-size:20px;color:gray"><b>${vo.car_name }</b></h4>
             
              <c:if test="${sessionScope.id!=null }">
				  <c:if test="${jjim_count==0 }">
				   <form method="post" action="../jjim/rent_jjim_insert.do?car_no=${vo.car_no }">    
				    <p>
				     <input type=hidden name="cate_no" id="cate_no" value="${vo.rcno }">
				      <span><img src="../img/jjim.png" style="width: 22px;height: 22px">
				      찜하기${jjim_total }
				      </span>&nbsp;
				      <input type="submit" value="찜하기" class="btn btn-xs" style="float: center;background-color: #F8B03A">
				      
				    </p>
				   </form>
				  </c:if>
			  <c:if test="${jjim_count!=0 }">
                <span class="btn btn-xs btn-default"><img src="../img/jjimimg.jpg" style="width:50px;height:50px">(${jjim_total })</span>
              </c:if>
			  </c:if>

		</figure>

<div class="box">
       <div class="inner-box">
       <h4 style="font-size:23px;color:gray"><b>결제정보</b></h4>
       <div class="inline">
       <br>
       <h4 style="font-size:19px;color:gray">최종결제금액&nbsp;<h4 style="font-size:23px;color:orange"><b>${vo.car_price }원</b><h4></h4>
       <hr style="border: width:100px;">
       <h4 style="font-size:18px;color:black"><img src="../img/ohoh.png" style="width:35px;height:35px">&nbsp;<b style="color:red">바로 결제해야 예약 확정</b></h4>
                 <br>
       <h4 style="font-size:17px;color:gray">시간이 경과될 경우 좌석이 매진되거나 요금이 변동될 수 있습니다.</h4>
                 <br>
      <div>
         <button class="button" id="reserveBtn" style="float: right; margin-right: 5px;">예약하기</button>      
      </div>
      </div>
      </div>
      </div>
     </div>

     <div class="container">
            <div class="row">
    <div class="product-info-tabs">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">예약정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">후기</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
           <br>
          <div class="col-md-8">
            <table class="table1">
            <h4 style="font-size:15px;color:gray"><b>차량정보</b></h4>
             <tr>
               <td class="text-left"><img src="../img/caricon.jpg" style="weight:25px;height:25px">&nbsp;${vo.car_option1 }</td>
             </tr>
            </table> 
            <br>
            <table>
	         <h4 style="font-size:15px;color:gray"><b>차량옵션</b></h4>
	          <tr>
	           <td class="text-left"><img src="../img/checkbox.png" style="weight:25px;height:25px">&nbsp;${vo.car_option2 }</td>
            </table>
            <br>
            <table>
             <h4 style="font-size:20px;color:gray">렌트카 예약 전, 꼭 확인해주세요!</h4>
             <tr>
              <td class="text-left"><img src="../img/checkicon.png" style="weight:15px;height:15px">제주도의 경우, 렌트카 업체 영업시간 외 대여/반납이 필요한 경우 카모아 고객센터를 통한 상담 후 예약 진행해주세요.</td>
             </tr>
             <tr> 
              <td class="text-left"><img src="../img/checkicon.png" style="weight:15px;height:15px">외국인 대여, 낚시용품 지참, 애견동물 동반 가능 여부와 주행거리 제한 규정은 업체별로 상이하므로 업체별 대여규정을 확인해주세요. 대여조건이 맞지 않을 경우 렌트카 이용이 불가합니다.</td> 
             </tr> 
            </table>
            <br>
            <table>
             <h4 style="font-size:20px;color:gray"><b>업체정보</b></h4>
             <td class="text-left"><img src="../img/rlogo.png" style="weight:25px;height:25px">&nbsp;${vo.rname }
              &nbsp;<span><img src="../img/star.png" style="width:10px; height:10px">&nbsp;4.2</span> 
             </td>
            </table>
            <table>
        <%-- 지도 --%>
        <div id="map" style="width:200;height:200px;">
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${vo.rcaddr}', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.rname}</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
      </script>
      </div>            
            </table>
            <table>
            <br>
             <tr style="font-size:20px;color:gray"><b>주소</b></tr>
             <td>${vo.rcaddr }</td>
             </table>
             <table>
             <br>
             <tr style="font-size:15px;color:gray"><b>전화</b></tr>
             <td>${vo.rctel }</td>
             </table>
             <br>
             <table>
             <tr style="font-size:15px;color:gray"><b>영업시간</b></tr>
             <td>연중무휴 08:00~20:00</td>
            </table>
            <br>
          </div>
        </div>
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
         <div style="height: 20px"></div>
      <div class="content three_quarter first"> 
        <h2 class="sectiontitle" style="font-size:20px;color:gray">리뷰</h2>
        <c:if test="${count==0 }">
                 <table class="table">
                   <tr>
                     <td class="text-center">리뷰가 없습니다</td>
                   </tr>
                 </table>
               </c:if>
               <c:if test="${count>0 }">
                 <table class="table">
                   <tr>
                     <td>
                     <c:forEach var="rvo" items="${rList }">
                      <table class="table">
                       <tr>
                        <td class="text-left" width=70%>${rvo.id }&nbsp;(${rvo.dbday })</td>
                        <td class="text-right" width=30%>
                          <c:if test="${sessionScope.id!=null }">
                            <c:if test="${sessionScope.id==rvo.id }">

                              <span class="btn btn-xs btn-success ups" data-no="${rvo.all_review_no }">수정</span>
                              <span class="btn btn-xs btn-danger" id="del_btn" data-no="${rvo.all_review_no }">삭제</span>
                            </c:if>
                          </c:if>
                        </td>
                          
                       </tr>
                       <tr>
                        <td colspan="2"><pre style="white-space:pre-wrap;background-color:white;border:none">${rvo.msg }</pre></td>
                       </tr>
                       <tr id="u${rvo.all_review_no }" class="rupdate" style="display:none">
			             <td colspan="2">
			               <form method="post" action="../all_review/all_review_update.do">
							 
			               	 <input type=hidden name="detail_no" id="detail_no" value="${vo.car_no }">
					         <input type=hidden name="all_review_no" value="${rvo.all_review_no }">
					         <input type=hidden name="cate_no" value="2">
					         <textarea rows="3" cols="90" name="msg" style="float: left">${rvo.msg}</textarea>&nbsp;
					         &nbsp;&nbsp;&nbsp;<input type=submit value="수정" class="btn btn-sm btn-warning" style="height: 65px">
					        </form>
			             </td>
			            </tr>
                      </table>
                    </c:forEach>
                     </td>
                   </tr>
                 </table>
               </c:if>  
        <table class="table">       
        <c:if test="${sessionScope.id!=null }">
          <table class="table">
           <tr>
            <td>
             <form method="post" action="../all_review/all_review_insert.do">
               <input type="hidden" name="detail_no" value="${vo.car_no }">
               <input type="hidden" name="cate_no" value="2">
               <%--
                  1. seoul_locateion
                  2. food
                  3. goods
                --%>
               <textarea rows="3" cols="90" name="msg" style="float: left"></textarea>&nbsp;
               <input type=submit value="작성" class="btn btn-sm btn-warning" style="height: 65px">
             </form>
            </td>
           </tr>
          </table>
        </c:if>
      </table>
      </div>
     </div>
     <div class="text-center" id="dialog" title="예약" style="display:none;color:gray;font-size:15px">
     <div class="containerx">
     <div class="rowx" style="height:450px;width:1200px" >
     <table class="text-left" border=1 width=1130>
      <tr>
      <td class="table1" id="td2" width=30% style="white-space: pre-wrap;">
       <img id="rimg" src="${vo.car_image }" style="width:280px;height: 250px; border: solid 1px gray;">
       
	   <img src="../img/car_icon.png" style="width:20px;height:20px">&nbsp;<span>${vo.car_option1 }</span>
	   <hr>
	   <div class="text-left"><img src="../img/checkc.png" style="width:25px;height:25px">&nbsp;<span>${vo.car_option2 }</span></div>
      </td>
      <td width=40%>
        <jsp:include page="diary.jsp"></jsp:include>
      </td>

      <td class="table1" id="td1" width=30% valign=top >
      <img src="../img/jejucoupon.jpg" style="width:600px;height:220px">
      <p class="text-center">쿠폰 먼저 다운받으러 가기</p>
       <br>
       
       <div class="text-center">
        <h3 style="font-size:15px"><b>차량명:</b>&nbsp;<b><span style="color:black">${vo.car_name }</span></b></h3><br> 
        <h3 style="font-size:14px"><b>대여시작:</b>&nbsp;<span id="cin"></span></h3><br>
        <h3 style="font-size:14px"><b>대여종료:</b>&nbsp;<span id="cout"></span></h3>
       
       
       <form method="post" action="../reserve/rent_before_reserve.do">
         <input type=hidden name="start" id="start">
         <input type=hidden name="end" id="end"> 
         <input type=hidden name="start_rent" id="start_rent">
         <input type=hidden name="end_rent" id="end_rent">
         <input type=hidden name="car_no" value="${vo.car_no }">
         <input type=hidden name="car_price" value="${vo.car_price }">
         <button type="submit" class="button" id="mybutton" style="float: center; margin-right: 5px;display:none">예약하기</button>
       </form>      
      </div>
     </td>
     </tr>
    
      
     </tr>
   </table>
   </div>
   </div>
    </div>
    <div class="clear"></div> 
   </main>
  </div>      
</body>
</html>