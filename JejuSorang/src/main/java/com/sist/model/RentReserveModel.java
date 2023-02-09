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
        
        String s=vo.getCar_price();
		s=s.replace(",", "");
		request.setAttribute("s", s);
		request.setAttribute("name", vo.getCar_name());
        request.setAttribute("vo", vo);
        //데이터 베이스 연결
      
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
        CommonsModel.footerData(request);
        return "../main/main.jsp";
     }
   @RequestMapping("reserve/rent_reserve_ok.do")
	public String rent_reserve_ok (HttpServletRequest request,HttpServletResponse response)
	{
		try
		  {
			request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String car_no=request.getParameter("car_no");
		  String start=request.getParameter("start");
		  String end=request.getParameter("end");
//		  SimpleDateFormat format=new SimpleDateFormat("mm/dd/yyyy");
//		  Date std = null;
//		  Date ed = null;
//		try {
//			std = format.parse(start);
//			ed = format.parse(end);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		  String start_rent = new SimpleDateFormat("yyyy-mm-dd").format(std);
//		  String end_rent = new SimpleDateFormat("yyyy-mm-dd").format(ed);
		 // 날짜 계산 후 금액 값 곱하기 		
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  

		  RentReserveVO vo=new RentReserveVO();
		  vo.setId(id);
		  vo.setCar_no(Integer.parseInt(car_no));
//		  vo.setStart_rent(start_rent);
//		  vo.setEnd_rent(end_rent);
		 // vo.setRprice()
		  
		  //DAO연동 
		  RentReserveDAO dao=new RentReserveDAO();
		  dao.rentreserveOk(vo);
		  return "redirect:../mypage/reserve.do";
	}
	@RequestMapping("mypage/rent_reserve.do")
	public String mypage_rent_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		RentReserveDAO dao=new RentReserveDAO();
	    
		return "../main/main.jsp";
	}

//		  request.setAttribute("vo", vo);
//		  //데이터 베이스 연결
//
//		
//		  request.setAttribute("start", start);
//		  request.setAttribute("end", end);
//		  request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
//		  CommonsModel.footerData(request);
//		  return "../main/main.jsp";
//	  }
//	
	/*
	 * private int rrno,rprice,car_no;
private String id,start_rent,end_rent,rpycheck;;
private CarVO cvo;
private MemberVO mvo;
	 */
	@RequestMapping("reserve/rent_before_reserve.do")
	public String reserve_before_rent(HttpServletRequest request,HttpServletResponse response)
	{
		RentReserveVO vo=new RentReserveVO();
		String car_no=request.getParameter("car_no");
		String start_rent=request.getParameter("start_rent");
		String end_rent=request.getParameter("end_rent");
		vo.setCar_no(Integer.parseInt(car_no));
		vo.setStart_rent(start_rent);
		vo.setEnd_rent(end_rent);
		HttpSession session=request.getSession();
		System.out.println(car_no+" "+start_rent + " " + end_rent);
		
		session.setAttribute("carVO", vo);
		request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		return "../main/main.jsp";
	}
}

   