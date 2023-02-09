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
<<<<<<< HEAD
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
		vo.setRno(Integer.parseInt(rno));
		return "redirect:../mypage/reserve.do";
	}
	
	@RequestMapping("reserve/hotel_reserve.do")
	public String hotel_reserve(HttpServletRequest request,HttpServletResponse response)
=======
>>>>>>> branch 'master' of https://github.com/JejuSorang1/JejuSorang.git
	{
<<<<<<< HEAD
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		HotelReserveDAO dao=new HotelReserveDAO();

=======
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String hno=request.getParameter("hno");
		String start=request.getParameter("start");
		
		request.setAttribute("main_jsp", "../reserve/hotel_reserve.jsp");
		CommonsModel.footerData(request);
>>>>>>> branch 'master' of https://github.com/JejuSorang1/JejuSorang.git
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/hotel_before_reserve.do")
	public String hotel_before_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		HotelReserveVO hrvo=new HotelReserveVO();
		String hno=request.getParameter("hno");
		
		
		return "../main/main.jsp";
	}
	
}