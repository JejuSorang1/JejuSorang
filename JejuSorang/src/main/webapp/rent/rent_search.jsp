<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css"> 
<link rel="stylesheet" href="../css/rent_search.css"> 

</head>
<body>
  <div class="container">
  <div class="row">
    <section class="booking_part" id="searchbar" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 ser" >
                    <div class="booking_content" id="searchbar1" >
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width:300px; margin-left: 5px; height: 5px; margin-top: 5px;">
                                                <select class="nc_select" >
                                                    <option selected>제주국제공항</option>
                                                </select>
                                            </div>
                                            <div class="form_colum" style="width:300px;  margin-left: 5px;">
                                                <input id="datepicker_3" placeholder="예약시작일">
                                            </div>
                                            <div class="form_colum" style="width:300px;  margin-left: 5px;">
                                                <input id="datepicker_4" placeholder="예약종료일">
                                            </div>
                                            <div class="form_btn" style="margin-left: 5px;">
                                              <input type="submit" name="submit" value="검색" class="btn btn-warning text-white mb-2" style="margin-top: 5px">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
       <div class="col-sm-3 ">
       <div class="table" style="width: 80%">
	  <form name="form1" method="post" action="../rent/rent_search.do"> 
	    <div class="col-md-12">
	    <br>
          <h5>자동차 모델</h5>
            <div style="display: inline-block;">
            <input type="text" name="ss" size=25 class="input-sm" value="${ss }" style="width: 75%;"> <input type=submit value="검색" style="border: 0; border-radius: 15%; background-color: #F8B03A; padding: 2%; color: white;">
            </div>
        </div>
        <hr>
        <div style="height: 10px"></div>
	    <div class="col-md-12">
          <h5>차량 등급</h5>
            <div class="checkbox opinion" id="opinion">
              <ul id="stars">
                <li><input type="checkbox" value="stars1" >&nbsp;경차</li>
                <li><input type="checkbox" value="stars2" >&nbsp;준중형</li>
                <li><input type="checkbox" value="stars3" >&nbsp;중형</li>
                <li><input type="checkbox" value="stars4" >&nbsp;RV</li>
                <li><input type="checkbox" value="stars4" >&nbsp;수입</li>
                <li><input type="checkbox" value="stars4" >&nbsp;고급</li>
                <li><input type="checkbox" value="stars4" >&nbsp;승합</li>
              </ul>
            </div>
        </div>
        <div style="height: 10px"></div>
        <div class="col-md-12">
        <hr>
          <h5>금액</h5>
            <input type="range" min="1" max="100" value="50" class="price" id="price">
            <p>Vlaue:<span id="value"></span></p>
        </div> 
        
      </form>
    </div>`
    </div>
          <section class="col-md-8" >
          <div class="container" > 
				<div class="col-md-12"  >
				 <table class="table1"  >
                <tr>
                  <td>
                    <c:forEach var="cvo" items="${list }" begin="0" end="4">
                      <table class="table2" >
                        <tr>
                          <td width="38%" class="text-left" rowspan="4">
                            <a href="../rent/car_detail.do?car_no=${cvo.car_no }"><img src="${cvo.car_image }" style="width:300px;" id="rentimg"></a>
                          </td>
                          <td width="62%">
                            <p> <h3>${cvo.car_name }</h3></p> <h3 id="price" style="color: #F8B03A;" ><span ><strong>${cvo.car_price }</strong></span>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
                           <p class="short-text">업체:레인보우모빌리티</p>
                            <p>${cvo.car_option1}</p>
                            <a href="../rent/car_detail.do?car_no=${cvo.car_no  }"><button type="button" class="btn btn-md btn-warning text-white" style="float: right; margin-right: 5px;">예약하기</button></a>
                          </td>
                        </tr>
                      </table>
                    </c:forEach>
                  </td>
                </tr>
              </table>
			 </div>
        </div>
    </section>
     <nav class="pagination">
        <ul>
        <c:if test="${startPage>1}">
          <li><a href="../rent/rent_search.do?ss=${ss }&page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../rent/rent_search.do?ss=${ss }&page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
          <li><a href="../rent/rent_search.do?ss=${ss }&page=${endPage+1 }">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
  </div>
</div>
</body>
</html>