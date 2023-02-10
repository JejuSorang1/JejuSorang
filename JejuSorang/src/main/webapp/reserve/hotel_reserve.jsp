<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){
	//$('#check').click(function(){
		//alert('fgfdg')
		
		$('#check').click(function(){
			if($(this).attr('data-id')==null || $(this).attr('data-id')==""  ){
				alert('로그인 하세요');
			}else{
			
			     requestPay(); }
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
		        location.href="../mypage/rent_reserve_list.do"
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        location.href="../reserve/hotel_reserve_ok.do"
		    }
		});
	}
</script>
<link rel="stylesheet" href="../css/style.css"> 
<link rel="stylesheet" href="../css/rent_reserve.css">
<style type="text/css">
li{
font-size: 15px;

}
</style>
</head>
<body>
<div class="wrapp">
<div class="sangdan">
<h4 style="line-height: 0px; margin-bottom: 20px; color: #DC6721;" ><strong>결제정보</strong></h4>
 </div>
 <div class="container">
  <div class="row">
    <div class="col-md-7 reserve">
	           <h3><b>${rvo.hotel_name }</b></h3>
	             <p class="short-text">${rvo.room_name }</p>
	           <hr style="border: solid 1px gray; " >
	           <div class="row">
			        <div class="col-md-6" >
			        <div class="text-left">
			         <div class="text-center" style="font-size: 15px;">체크인 : ${sessionScope.hrvo.ckin }</div>
			        </div>
			       <div class="text-left">
			         <div class="text-center" style="font-size: 15px;">체크아웃 : ${sessionScope.hrvo.ckout }</div>
			        </div>
			       </div> 
			       </div>
			       <hr style="border: solid 1px gray; " >
			      <p>침실정보 : ${rvo.room_bed_info }</p> 
			      <p>최대인원 : ${rvo.room_persons }</p> 
			      <br>
			     <ul style="t">
			      <li>예약자 정보 : ${sessionScope.name }  </li>
			      <li>생년월일 : ${sessionScope.birthday }</li>
			      <li>휴대폰번호 : ${sessionScope.phone }</li>
			      <li>이메일 주소 : ${sessionScope.email } </li>
			    </ul>
			    <br>
			    <img src="../img/license.png" style="margin-bottom: 5px;">
			    <br>
			    <b>대인/대물/자손 보상한도</b>
			    <img src="../img/insurance.png" style="margin-top: 5px; margin-bottom:5px; border: solid 1px gray;">
			     보험은 현장에서 작성하는 계약서를 기준으로 적용됩니다. 반드시 계약서를 확인해주시기 바랍니다.
          </div>
    <div class="col-md-4 reserve2">
         <h5><b>결제정보</b></h5>
         <hr >
         <p>총 결제금액</p> 
         <h4 style="color: #F8B03A;"><b id="bbb" value="${ s}" data-name="${hotel_name }">${rvo.room_price }</b></h4>
         <hr>
          <p style="text-align: center;  font-size: 15px;">위 내용을 모두 확인하였으며, 결제에 동의합니다</p>

           <input type="button" value="결제하기"  data-id="${sessionScope.id }" style="border: 0;background-color: #F8B03A; padding: 2%; color: white; width: 100%; height: 50px;" id="check">
         </div> 
      </div>
   </div>
 </div> 
</body>
</html>