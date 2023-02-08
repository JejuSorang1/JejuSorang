package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

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
		List<RoomVO> list=dao.reserveRoomListData(Integer.parseInt(hno));
		request.setAttribute("list", list);
		request.setAttribute("hno", hno);
		return "../reserve/reserve_room.jsp";
	}
	@RequestMapping("reserve/reserve_date.do")
	public String reserve_date(HttpServletRequest request,HttpServletResponse response)
	{
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(date);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  
		  String strYear=st.nextToken();
		  String strMonth=st.nextToken();
		  String strDay=st.nextToken();
		  
		  
		  String syear=request.getParameter("year");
		  String smonth=request.getParameter("month");
		  String fno=request.getParameter("hno");
		  
		  if(syear==null)
		  {
			  syear=strYear;
		  }
		  if(smonth==null)
		  {
			  smonth=strMonth;
		  }
		  
		  
		  int year=Integer.parseInt(syear);
		  int month=Integer.parseInt(smonth);
		  int day=Integer.parseInt(strDay);
		  
		  // 요일 
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  // 마지막 날 
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  
		  // 요일 
		  String[] strWeek={"일","월","화","수","목","금","토"};
		  
		  // 전송 
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week-1);
		  request.setAttribute("lastday", lastday);
		  request.setAttribute("strWeek", strWeek);
		  //request.setAttribute("year", year); => 예약 가능한 날 (food_location) => 예약일 => 시간 시간 => 인원
		  HotelReserveDAO dao=new HotelReserveDAO();
		  String rdate=dao.reserveDayData(Integer.parseInt(fno));
		  int[] rdays=new int[32];
		  String[] temp=rdate.split(",");
		  for(String ss:temp)
		  {
			  if(Integer.parseInt(ss)>=day)
			  {
			     rdays[Integer.parseInt(ss)]=1;
			  }
		  }
		  request.setAttribute("rdays", rdays);
		  return "../reserve/reserve_date.jsp";
	}
	
}