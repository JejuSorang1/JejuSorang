package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class HotelReserveModel {
	@RequestMapping("reserve/hotel_reserve_ok.do")
	public String hotel_reserve_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String hno=request.getParameter("hno");
		String ckin=request.getParameter("ckin");
		String ckout=request.getParameter("ckout");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		HotelReserveVO hrvo=(HotelReserveVO)session.getAttribute("roomVO");
		
		HotelReserveVO vo=new HotelReserveVO();
		vo.setId(id);
		vo.setHno(hrvo.getHno());
		vo.setRno(hrvo.getRno());
		vo.setCkin(hrvo.getCkin());
		vo.setCkout(hrvo.getCkout());
		
		HotelReserveDAO dao=new HotelReserveDAO();
		dao.hotelReserveOk(vo);
		return "redirect:../mypage/reserve.do";
	}
	
	@RequestMapping("reserve/hotel_reserve.do")
	public String hotel_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		HotelReserveDAO dao=new HotelReserveDAO();
		List<HotelReserveVO> list=dao.hotelReserveMyPageData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_hotle_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/hotel_before_reserve.do")
	public String hotel_before_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HotelReserveVO hrvo=new HotelReserveVO();
		String hotel_no=request.getParameter("hotel_no");
		String room_no=request.getParameter("room_no");
		String room_price=request.getParameter("room_price");
		String start_rent=request.getParameter("start_rent");
		String end_rent=request.getParameter("end_rent");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		System.out.println("hotel_no"+hotel_no+" "+"room_no"+room_no);
		RoomDAO rdao=new RoomDAO();
		RoomVO rvo=rdao.room_detail2(Integer.parseInt(hotel_no), Integer.parseInt(room_no));
		int ss=Integer.parseInt(start);
		int ee=Integer.parseInt(end);
		
		String s=rvo.getRoom_price();
		s=s.replace(",", "");
		int total=(ee-ss)*Integer.parseInt(s);
		request.setAttribute("s", total);
		rvo.setRoom_price(String.valueOf(total));
		request.setAttribute("hotel_name", rvo.getHotel_name());
		request.setAttribute("rvo", rvo);
		
		/*
		 * rvo.setCar_no(Integer.parseInt(car_no));
		rvo.setStart_rent(start_rent);
		rvo.setEnd_rent(end_rent);
		HttpSession session=request.getSession();
		System.out.println(car_no+" "+start_rent + " " + end_rent);
		
		
		session.setAttribute("carVO", rvo);
		request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		return "../main/main.jsp";
		 */
		hrvo.setHno(Integer.parseInt(hotel_no));
		hrvo.setRno(Integer.parseInt(room_no));
		hrvo.setCkin(start_rent);
		hrvo.setCkout(end_rent);
		HttpSession session=request.getSession();
		
		session.setAttribute("hrvo", hrvo);
		request.setAttribute("main_jsp", "../reserve/hotel_reserve.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/hotel_reserve.do")
	public String mypage_hotel_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  HotelReserveDAO dao=new HotelReserveDAO();
		  List<HotelReserveVO> list=dao.hotelReserveMyPageData(id);
		  request.setAttribute("list", list);
		  request.setAttribute("mypage_jsp", "../mypage/mypage_hotel_reserve.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	    
		
	}
	
	 @RequestMapping("adminpage/admin_hotelReserve.do")
	  public String hotel_admin_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  HotelReserveDAO dao=new HotelReserveDAO();
		  List<HotelReserveVO> list=dao.hotelReserveAdminPageData();
		  request.setAttribute("list", list);
		  request.setAttribute("adminpage_jsp", "../adminpage/admin_hotel_reserve.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }
}