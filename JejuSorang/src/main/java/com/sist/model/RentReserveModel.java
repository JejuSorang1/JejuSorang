package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.RentDAO;
import com.sist.dao.RentReserveDAO;
import java.util.*;
import com.sist.vo.*;
import java.text.*;
@Controller
public class RentReserveModel {
	@RequestMapping("reserve/rent_reserve.do")
	  public String reserve_main(HttpServletRequest request,HttpServletResponse response)
	  {
		  String cno=request.getParameter("car_no");
		  //데이터 베이스 연결
		  RentReserveDAO dao=new RentReserveDAO();
		  request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }
	@RequestMapping("rent/car_detail.do")
	public String car_detail(HttpServletRequest request,HttpServletResponse response)
	{
	   String cno=request.getParameter("car_no");
	   
	   //데이터 베이스 연결
	   RentDAO dao=new RentDAO();
	   CarVO vo=dao.car_detail(Integer.parseInt(cno));
	   
	   //footer
	   request.setAttribute("vo", vo);

	   request.setAttribute("main_jsp","../rent/car_detail.jsp");
	   return "../main/main.jsp";
	   
	   }
}
