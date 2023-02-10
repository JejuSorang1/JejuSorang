<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>       
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

  
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
$(function(){
	$('.ups').click(function(){
		$('.rupdate').show();
		let rno=$(this).attr("data-no");
		if(u==0)
		{
			$(this).text("수정");
			$('#u'+rno).hide();
			u=1;
		}
		else
		{
			$(this).text("취소");
			$('#u'+rno).show();
			u=0;
		}
	})
	
	$('#del_btn').click(function(){
		let all_review_no=$(this).attr("data-no")
		let detail_no=$('#detail_no').val();
		let cate_no=1;
		$.ajax({
			type:'post',
			url:'../all_review/all_review_delete.do',
			data:{"detail_no":detail_no,"all_review_no":all_review_no,"cate_no":cate_no},
			success:function(response){
			  location.href="../hotel/hotel_detail.do?hno="+detail_no;
			}
		})
	})
	$("#ReserveBtn").click(function(){
		$("#dialog").dialog({
	    	   autoOpen : false        
	           , width : 1200            
	           , height :800        
	           , modal : true            
	           , resizeable : false    
	    }).dialog("open");
	})
	$('.rooms').click(function(){
		let price=$(this).attr("data-price");
		let name=$(this).attr("data-name");
		let room_no=$(this).attr("data-no");
		$('#room_name').text(name)
		$('#room_price').text(price);
		$('#room_no').val(room_no);
	})
	
	
})
var IMP = window.IMP; // 생략 가능
	IMP.init("imp68206770"); // 예: imp00000000
function requestPay() {
		console.log('clicked');
	  // IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		        /*
		            'kakao':카카오페이,
		            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
		            'nice':나이스,
		            'jtnet':jtnet,
		            'uplus':LG유플러스
		        */
		    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:'+$('#bbb').attr('data-name'),
		    amount : $('#bbb').attr('value'),
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        location.href="../mypage/hotel_reserve_list.do"
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        location.href="../reserve/hotel_reserve_ok.do"
		    }
		});
	}
</script>
<style type="text/css">
.row100{
  width: 1200px;
  height: 600px;
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
</style>
</head>
<body>

<div class="pd-wrap">
  <div class="container">
    <div style="width: 10px;height: 50px"></div>
    <div class="row">
    <p> <a href="../hotel/hotel_all.do"><img src="../img/back.png" width="35px";height="35px" style="float: right;" title="뒤로가기"></a></p>&nbsp;<h5>목록 보기</h5>
    <div style="width: 100%;height: 2px; background-color:orange"></div>
    <div style="width: 100%;height: 20px"></div>
      <div class="col-md-5">
        <img src="${hvo.hotel_image }" style="width:500px;height:400px">
       </div>
      <div class="col-md-4">
        <div class="product-dtl">
          <div class="product-info">
            <div class="product-name"><h4>${hvo.name}<span style="color:orange">(${hvo.star })</span></h4></div>
            <div class="info">
              <p> <img src="../img/star.png" style="width:30px; height:30px">&nbsp;&nbsp;${hvo.grade }</p>
              <p> <img src="../img/point.png" style="width:35px; height:35px">&nbsp;${hvo.addr}</p>
			  <p> <img src="../img/clock.png" style="width:33px; height:33px">&nbsp;${hvo.time}</p>
			  <table class="table">
			  <c:if test="${sessionScope.id!=null }">
			  <tr>
			    <td>
			  <c:if test="${like_count==0 }">
			  <p><a href="../like/like_insert.do?hno=${hvo.hno }" class="btn btn-xs" style="float: center;background-color: #F8B03A">좋아요</a><span style="float: right"><img src="../img/like.png" style="width: 22px;height: 22px;">좋아요${like_total }</span></p>
			  </c:if>
			  <c:if test="${like_count!=0 }">
			    <p><span class="btn btn-xs btn-default" style="float: left"><img src="../img/like.png" style="width: 22px;height: 22px">좋아요${like_total }</span></p>
              <%-- <span class="btn btn-xs btn-default">좋아요(${like_total })</span> --%>
			  </c:if>
			   </td>
			   </tr>
			  <tr>
			    <td>
			  <c:if test="${jjim_count==0 }">
			   <form method="post" action="../jjim/jjim_insert.do?hno=${hvo.hno }">    
			    <p>
			     <input type=hidden name="cate_no" id="cate_no" value="${hvo.all_cate_no }">
			     <input type="submit" value="찜하기" class="btn btn-xs jjim" style="float: center;background-color: #F8B03A">
			      <span style="float: right"><img src="../img/jjim.png" style="width: 22px;height: 22px">
			      찜하기${jjim_total }
			      </span>
			    </p>
			   </form>
			  </c:if>
			  <c:if test="${jjim_count!=0 }">
			     <p><span class="btn btn-xs btn-default jjimde" style="float: left"><img src="../img/jjim.png" style="width: 22px;height: 22px">
			      찜하기${jjim_total }
			      </span></p>
                <%--  <span class="btn btn-xs btn-default">찜하기(${jjim_total })</span> --%>
              </c:if>
              </td>
              </tr>
              <tr>
              <td colspan="3" class="text-center">
                 <span class="btn btn-lg btn-warning" id="ReserveBtn">예약하기</span>
              </td>
              </tr>
			  </c:if>
			  </table>
			 </div>
          </div>  
       </div>
      </div>
      <div class="col-md-3">
      <div class="sdb_holder">
        <%-- 지도 --%>
        <div id="map" style="width:100%;height:400px;">
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
		geocoder.addressSearch('${addr}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${hvo.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
		</div>
      </div>
      </div>
     </div>
     
     <hr>
     
    <div class="row">
   
    <div class="product-info-tabs">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">객실 상세보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">후기</a>
        </li>
      </ul>
      <br>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
          <c:forEach var="rvo" items="${rList }">
          <div class="col-md-12">
            <table class="table1">
              <tr >
                <td colspan="4" rowspan="3">
                    <table class="table2">
                      <tr>
                        <td width="38%" class="text-left">
                          <img src="${rvo.room_image }" style="width:300px;height:250px">
                        </td>
                        <td width="3%"> 
                        </td>
                        <td width="42%" >
                          <h4>${rvo.room_name }</h4>
				          <p> <img src="../img/persons.png" style="width:20px;height:20px">&nbsp;${rvo.room_persons }</p>
				          <p> <img src="../img/bed.png" style="width:20px;height:20px">&nbsp;${rvo.room_bed_info }</p>
				          <p> <span style="color:orange">${rvo.account }</span>개의 객실이 남아있습니다. 얼른 예약하세요!</p>
				          <h3><span style="color:orange"> ${rvo.room_price }원</span></h3>
                        </td>
                      </tr>
                    </table>
                </td>
              </tr> 
            </table>
            <hr>
          </div>
          </c:forEach>
          
         </div>
        
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
         <div style="height: 20px"></div>
      <div class="content one_quarter first"> 
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
                     <c:forEach var="revo" items="${reList }">
                      <table class="table">
                       <tr>
                        <td class="text-left" width=70%>${revo.id }&nbsp;(${revo.dbday })</td>
                        <td class="text-right" width=30%>
                          <c:if test="${sessionScope.id!=null }">
                            <c:if test="${sessionScope.id==revo.id }">
                              <span class="btn btn-xs btn-success ups" data-no="${revo.all_review_no }">수정</span>
                              <span class="btn btn-xs btn-danger" id="del_btn" data-no="${revo.all_review_no }">삭제</span>
                             <!--  <a href="../all_review/all_review_delete.do?all_review_no=${revo.all_review_no }&no=${revo.cate_no}&cate_no=1" class="btn btn-xs btn-danger">삭제</a> -->
                            </c:if>
                          </c:if>
                        </td>
                          
                       </tr>
                       <tr>
                        <td colspan="2"><pre style="white-space:pre-wrap;background-color:white;border:none">${revo.msg }</pre></td>
                       </tr>
                       <tr id="u${revo.all_review_no }" class="rupdate" style="display:none">
			             <td colspan="2">
			               <form method="post" action="../all_review/all_review_update.do">
					         <input type=hidden name="detail_no" id="detail_no" value="${hvo.hno }">
					         <input type=hidden name="all_review_no" value="${revo.all_review_no }">
					         <input type=hidden name="cate_no" value="1">
					         <textarea rows="3" cols="90" name="msg" style="float: left">${revo.msg}</textarea>&nbsp;
					         <input type=submit value="수정" class="btn btn-sm btn-warning" style="height: 65px">
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
               <input type="hidden" name="detail_no" value="${hvo.hno }">
               <input type="hidden" name="cate_no" value="1">
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
        </div>
        </div>
        </div>
      </div>
     </div>
    <div id="dialog" title="예약하기" style="display:none">
     <div class="container100">
    <div class="row100" style="height: 450px;width:1200px">
	<table border="1" style="background-color:white">
	  <tr>
	    <td width=40% class="text-center">
	      <img src="${hvo.hotel_image }" style="width:400px;height: 200px;">
	      <jsp:include page="diary.jsp"></jsp:include>
	    </td>
	    <td width=40%>
	      <div class="tab-content" id="myTabContent"style="height: 620px;overflow-y:scroll">
         <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
          <c:forEach var="rvo" items="${rList }">
          <div class="col-md-12">
            <table class="table1">
              <tr >
                <td colspan="4" rowspan="3">
                    <table class="table2">
                      <tr>
                      <td>
                          <img src="${rvo.room_image }" style="width:300px;height:250px;" data-price="${rvo.room_price }" data-name="${rvo.room_name }" data-no="${rvo.room_no }" class="rooms">
                          <br><h4><b>${rvo.room_name }</b></h4>
				          <p> <img src="../img/persons.png" style="width:20px;height:20px">&nbsp;${rvo.room_persons }</p>
				          <p> <img src="../img/bed.png" style="width:20px;height:20px">&nbsp;${rvo.room_bed_info }</p>
				          <p> <span style="color:orange">${rvo.account }</span>개의 객실이 남아있습니다. 얼른 예약하세요!</p>
				          <h3><span style="color:orange"> ${rvo.room_price }원</span></h3>
                        </td>
                      </tr>
                    </table>
                </td>
              </tr> 
            </table>
            <hr>
          </div>
          </c:forEach>
         </div>
        </div>
	    </td>
	    <td width=30% class="text-center">
	      <h3 style="font-size:15px"><b>호텔명 :</b><br>
	      <b><span style="color:black">${hvo.name }</span></b></h3><br>
	      <h3 style="font-size:14px"><b>객실명 :</b><br>
	      <span id="room_name"></span></h3><br>
	      <h3 style="font-size:14px"><b>1박 가격 :</b><br>
	      <span id="room_price"></span></h3><br>
	      <h3 style="font-size:14px"><b>체크인 :</b><br>
	      <span id="cin"></span></h3><br>
	      <h3 style="font-size:14px"><b>체크아웃 :</b><br>
	      <span id="cout"></span></h3>
	    </td>
		<div>
	       <form method="post" action="../reserve/hotel_before_reserve.do">
	         <input type=hidden name="start" id="start">
	         <input type=hidden name="end" id="end"> 
	         <input type=hidden name="start_rent" id="start_rent">
	         <input type=hidden name="end_rent" id="end_rent"> 
	         <input type=hidden name="room_no" id="room_no">
	         <input type=hidden name="room_price" value="${rvo.room_price }">
	         <input type=hidden name="hotel_no" value="${hvo.hno }">
	         <button type="submit" class="button" data-id="${sessionScope.id }" id="reserveBtn" style="float: right; margin-right: 5px;">예약하기</button>
	       </form>      
      </div>
	</table>
    </div>
    <div class="clear"></div>
  </div>
    </div>
</body>
</html>