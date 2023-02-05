package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class LocationModel {
	@RequestMapping("location/location_main.do")
	public String reserve_main(HttpServletRequest request,HttpServletResponse response)
	{
		  request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	}
	@RequestMapping("location/location_list.do")
	  public String reserve_food_list(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String ss=request.getParameter("ss");
		  if(ss==null)
			   ss="관람";
		  String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		  int curpage=Integer.parseInt(page);
		  
		  LocationDAO dao=new LocationDAO();
		  List<LocationVO> list=dao.LocationFindData(curpage, ss);
		  int totalpage=dao.LocationTotalPage(ss);
		   
		  request.setAttribute("list", list);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("ss", ss);
		  
		  request.setAttribute("main_jsp", "../location/location_list.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }
}