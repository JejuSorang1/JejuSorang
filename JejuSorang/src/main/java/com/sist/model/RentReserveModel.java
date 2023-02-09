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
	@RequestMapping("reserve/rent_before_reserve.do")
	public String reserve_before_rent(HttpServletRequest request,HttpServletResponse response)
	{
		RentReserveVO rvo=new RentReserveVO();
		String car_no=request.getParameter("car_no");
		String start_rent=request.getParameter("start_rent");
		String end_rent=request.getParameter("end_rent");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		String car_price=request.getParameter("car_price");
		RentDAO dao=new RentDAO();
        CarVO cvo=dao.car_detail(Integer.parseInt(car_no));
        int ss=Integer.parseInt(start);
		int ee=Integer.parseInt(end);
		
        String s=cvo.getCar_price();
		s=s.replace(",", "");
		int total=(ee-ss)*Integer.parseInt(s);
		request.setAttribute("s", total);
		cvo.setCar_price(String.valueOf(total));
		request.setAttribute("name", cvo.getCar_name());
        request.setAttribute("cvo", cvo);
        //데이터 베이스 연결
		rvo.setCar_no(Integer.parseInt(car_no));
		rvo.setStart_rent(start_rent);
		rvo.setEnd_rent(end_rent);
		HttpSession session=request.getSession();
		System.out.println(car_no+" "+start_rent + " " + end_rent);
		
		
		session.setAttribute("carVO", rvo);
		request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		return "../main/main.jsp";
	}

   @RequestMapping("reserve/rent_reserve_ok.do")
	public String rent_reserve_ok (HttpServletRequest request,HttpServletResponse response)
	{
		try
		  {
			request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  
		/*  예약정보 저장
		 *  ID                  VARCHAR2(20) 
			RRNO       NOT NULL NUMBER       
			RPRICE     NOT NULL NUMBER       
			RPYCHECK            CHAR(1)      
			CAR_NO              NUMBER       
			START_RENT          VARCHAR2(20) 
			END_RENT            VARCHAR2(20) 

		 */
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  RentReserveVO cvo=(RentReserveVO)session.getAttribute("carVO");
		  

		  RentReserveVO vo=new RentReserveVO();
		  vo.setId(id);
		  vo.setCar_no(cvo.getCar_no());
		  vo.setStart_rent(cvo.getStart_rent());
		  vo.setEnd_rent(cvo.getEnd_rent());
		  vo.setRprice(cvo.getRprice());
		  
		  //DAO연동 
		  RentReserveDAO dao=new RentReserveDAO();
		  dao.rentreserveOk(vo);
		  return "redirect:../mypage/mypage_main.do";
	}
	@RequestMapping("mypage/rent_reserve.do")
	public String mypage_rent_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  RentReserveDAO dao=new RentReserveDAO();
		  List<RentReserveVO> list=dao.rentreserveMyPageData(id);
		  request.setAttribute("list", list);
		  request.setAttribute("mypage_jsp", "../mypage/mypage_rent_reserve.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	    
		
	}
	
	 @RequestMapping("adminpage/admin_reserve.do")
	  public String rent_admin_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  RentReserveDAO dao=new RentReserveDAO();
		  List<RentReserveVO> list=dao.rentreserveAdminPageData();
		  request.setAttribute("list", list);
		  request.setAttribute("adminpage_jsp", "../adminpage/admin_rent_reserve.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }

}

   