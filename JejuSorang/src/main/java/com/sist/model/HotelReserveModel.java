package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class HotelReserveModel {
	@RequestMapping("reserve/hotel_reserve.do")
	public String hotel_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../reserve/hotel_reserve.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/reserve_room.do")
	public String reserve_room(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String hno=request.getParameter("hno");
		HotelReserveDAO dao=new HotelReserveDAO();

		
		return "../reserve/reserve_room.jsp";
	}
	
}