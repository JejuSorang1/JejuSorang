package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.RentDAO;
import com.sist.dao.RentReserveDAO;

import java.util.*;
import com.sist.vo.*;
import java.text.*;
@Controller
public class RentReserveModel {
	@RequestMapping("reserve/rent_reserve.do")
	  public String reserve_user(HttpServletRequest request,HttpServletResponse response)
	  {
		  String cno=request.getParameter("car_no");
		  String start=request.getParameter("start_reserve");
		  String end=request.getParameter("end_reserve");
		  
		  RentDAO dao=new RentDAO();
		  CarVO vo=dao.car_detail(Integer.parseInt(cno));
		  
		  request.setAttribute("vo", vo);
		  //데이터 베이스 연결

		
		  request.setAttribute("start", start);
		  request.setAttribute("end", end);
		  request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }
	
	
}

	
