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
		String hno=request.getParameter("hno");
		String rno=request.getParameter("rno");
		String ckin=request.getParameter("ckin");
		String ckout=request.getParameter("ckout");
		String room_price=request.getParameter("room_price");
		String hotel_name=request.getParameter("hotel_name");
		HotelDAO hdao=new HotelDAO();
		RoomDAO rdao=new RoomDAO();
		HotelVO hvo=hdao.hotel_detail(Integer.parseInt(hno));
		List<RoomVO> rlist=rdao.room_detail(Integer.parseInt(hno));
		int ss=Integer.parseInt(ckin);
		int ee=Integer.parseInt(ckout);
		
		String s=rlist.get(4).getRoom_price();
		s=s.replace(",", "");
		int total=(ee-ss)*Integer.parseInt(s);
		request.setAttribute("s", total);
		rlist.get(4).setRoom_price(String.valueOf(total));
		request.setAttribute("hname", hvo.getName());
		request.setAttribute("rname", rlist.get(4).getRoom_name());
		request.setAttribute("hvo", hvo);
		request.setAttribute("rlist", rlist);
		
		hvo.setHno(Integer.parseInt(hno));
		hrvo.getRvo().setRoom_no(Integer.parseInt(rno));
		hrvo.setCkin(ckin);
		hrvo.setCkout(ckout);
		HttpSession session=request.getSession();
		
		session.setAttribute("HotelVO", hrvo);
		session.setAttribute("RoomVO", hrvo);
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