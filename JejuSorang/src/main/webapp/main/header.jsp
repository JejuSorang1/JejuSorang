<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="main_menu">
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="../main/main.do"> <img src="../img/logo1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="../main/main.do">메인화면</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../hotel/hotel_all.do">호텔</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../rent/rent_search.do">렌트카</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../location/location_main.do">관광지</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../notice/list.do">공지사항</a>
                                    </li>
                                </ul>
                            </div>
                            <c:if test="${sessionScope.id==null }">
                            <a href="../member/login.do" class="btn_1 d-none d-lg-block">로그인</a>
                            </c:if>
                            <c:if test="${sessionScope.id!=null }">
                             <c:if test="${sessionScope.admin=='n' }">
                               <a href="../mypage/mypage_main.do" class="btn_1 d-none d-lg-block">내 정보</a>
                               &nbsp;<a href="../member/logout.do" class="btn_1 d-none d-lg-block" id="logoutBtn">로그아웃</a>
                             </c:if>
                             <c:if test="${sessionScope.admin=='y' }">
                               <a href="../adminpage/admin_main.do" class="btn_1 d-none d-lg-block">관리자페이지</a>
                               &nbsp;<a href="../member/logout.do" class="btn_1 d-none d-lg-block" id="logoutBtn">로그아웃</a>
                             </c:if>
                            </c:if>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>