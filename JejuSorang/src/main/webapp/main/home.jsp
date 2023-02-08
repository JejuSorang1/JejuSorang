<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
<script src="../js/datepicker-ko.js"></script>

<script type="text/javascript">

$(function() {
  $.datepicker.setDefaults($.datepicker.regional['ko']); //datepicker 한국어로 사용하기 위한 언어설정
  $('#datepicker_1').datepicker({dateFormat: 'yy년 mm월 dd일'});
});

</script>
</head>

<body>
<!-- banner start -->
<section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                
            </div>
        </div>
    </section>
<!-- booking start -->
<section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">호텔</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="rentcar-tab" data-toggle="tab" href="#rentcar" role="tab" aria-controls="rentcar" aria-selected="false">렌트카</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                    <form action="../hotel/hotel_findlist.do" method="post">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <select class="nc_select" name="area" autocomplete='off'>
                                                    <option selected>목적지 </option>
                                                    <option >제주시</option>
                                                    <option >서귀포시</option>
                                                </select>
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_1" placeholder="체크인" name="checkin" autocomplete='off'>
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" placeholder="체크아웃" name="checkout" autocomplete='off'>
                                            </div>
                                            <div class="form_colum">
                                                <select class="nc_select" name="inwon" autocomplete='off'>
                                                    <option selected>인원 </option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="3">4</option>
                                                </select>
                                            </div>
                                            <div class="form_btn">
                                                <button class="btn_1">검색</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="rentcar" role="tabpanel" aria-labelledby="rentcar-tab">
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width:300px">
                                                <select class="nc_select">
                                                    <option selected>제주국제공항</option>
                                                </select>
                                            </div>
                                            <div class="form_colum" style="width:300px">
                                                <input id="datepicker_3" placeholder="예약시작일">
                                                <input id="datepicker_4" placeholder="예약종료일">
                                            </div>
                                            <div class="form_btn">
                                                <a href="../rent/rent_search.do" class="btn_1">검색</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Hotel Start -->
    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>인기 호텔</h2>
                        <p>평점이 가장 높은 호텔!</p>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="hvo" items="${hlist }">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                         <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" alt=""></a>
                        <div class="hotel_text_iner">
                            <h3> <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"> ${hvo.name }</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>&nbsp;(${hvo.star })</span>
                            </div>
                            <p>${hvo.addr }</p>
                        </div>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </section>
    <!-- Hotel end -->
    <!-- Rent start -->
    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>최저가 렌트 차량</h2>
                        <p>현시점 가장 저렴한 차량!</p>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="cvo" items="${clist }">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="${cvo.car_image }" alt="" style="height: 280px">
                        <div class="hotel_text_iner">
                            <h3> <a href="../rent/car_detail.do?car_no=${cvo.car_no }"> ${cvo.car_name }</a></h3>
                            <h5><span>${cvo.car_price }</span>원</h5>
                            <p>${cvo.car_option1 }</p>
                        </div>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </section>
    <!-- Rent end -->
</body>
</html>