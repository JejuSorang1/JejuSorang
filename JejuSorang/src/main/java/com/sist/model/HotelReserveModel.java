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
		
		HotelReserveVO vo=new HotelReserveVO();
		vo.setId(id);
		vo.setHno(Integer.parseInt(hno));
		vo.setRno(vo.getRno());
		
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
		
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/hotel_before_reserve.do")
	public String hotel_before_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HotelReserveVO hrvo=new HotelReserveVO();
		String hno=request.getParameter("hno");
		String rno=request.getParameter("rno");
		String room_no=request.getParameter("room_no");
		String ckin_rent=request.getParameter("ckin_rent");
		String ckout_rent=request.getParameter("ckout_rent");
		String ckin=request.getParameter("ckin");
		String ckout=request.getParameter("ckout");
		String room_price=request.getParameter("room_price");
		HotelDAO hdao=new HotelDAO();
		RoomDAO rdao=new RoomDAO();
		HotelVO hvo=hdao.hotel_detail(Integer.parseInt(hno));
		RoomVO rvo=rdao.room_detail();
		int ss=Integer.parseInt(ckin);
		int ee=Integer.parseInt(ckout);
		
		String s=rvo.getRoom_price();
		s=s.replace(",", "");
		int total=(ee-ss)*Integer.parseInt(s);
		request.setAttribute("s", total);
		rvo.setRoom_price(String.valueOf(total));
		request.setAttribute("hname", hvo.getName());
		request.setAttribute("rname", rvo.getRoom_name());
		request.setAttribute("hvo", hvo);
		request.setAttribute("rvo", rvo);
		
		hvo.setHno(Integer.parseInt(hno));
		hrvo.setRno(Integer.parseInt(rno));
		
		return "../main/main.jsp";
	}
	
}