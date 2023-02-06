<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   width: 350px;
   margin: 0px auto;
}
</style>
</head>
<body>
	<div class="container"style="overflow-y:scroll">
	  <div class="row">
	    <table class="table">
	    <c:forEach var="vo" items="${list }">
	    <div id="map" style="width:300px;height:200px;">
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
		geocoder.addressSearch('${vo.addr_ji}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
		</div>
		   <tr>
		     <td><h6><b>이름</b></h6><br>${vo.title }</td>
		   </tr>
		   <tr>
		     <td><h6><b>주소</b></h6><br>
			     <c:if test="${vo.addr_doro!=null }">
			       <p>${vo.addr_doro }</p>
			      </c:if>
			      <p>${vo.addr_ji }</p>
		     </td>
		   </tr>
		   <tr>
		     <td><h6><b>정보</b></h6><br>${vo.info }</td>
		   </tr>
		   <tr>
		     <td><h6><b>휴무일</b></h6><br>${vo.close }</td>
		   </tr>
		   <tr>
		     <td><h6><b>운영시간</b></h6><br>${vo.time }</td>
		   </tr>
		   <tr>
		     <td><h6><b>가격</b></h6><br>${vo.price }</td>
		   </tr>
		   <tr>
		     <td><h6><b>주요 목적</b></h6><br>${vo.purpose }</td>
		   </tr>
		   <tr>
		     <td><h6><b>편의 시설</b></h6><br>${vo.facil }</td>
		   </tr>
		   <tr>
		     <td><h6><b>관리기관</b></h6><br>${vo.manager }</td>
		   </tr>
		   <tr>
		     <td><h6><b>관리기관 전화번호</b></h6><br>${vo.tel }</td>
		   </tr>
		   </c:forEach>
	    </table>
	  </div>
	</div>
</body>
</html>