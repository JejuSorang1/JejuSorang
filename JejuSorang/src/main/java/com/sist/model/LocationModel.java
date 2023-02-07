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
	public String location_main(HttpServletRequest request,HttpServletResponse response)
	{
		  request.setAttribute("main_jsp", "../location/location_main.jsp");
		 // CommonsModel.footerData(request);
		  return "../main/main.jsp";
	}
	@RequestMapping("location/location_list.do")
	  public String location_list(HttpServletRequest request,HttpServletResponse response)
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
		  //request.setAttribute("main_jsp", "../location/location_list.jsp");
		  return "../location/location_list.jsp";
	  }
	@RequestMapping("location/location_detail.do")
	public String location_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String lno=request.getParameter("lno");
		System.out.println("lno="+lno);
		LocationDAO dao=new LocationDAO();
		LocationVO vo=dao.location_detail(Integer.parseInt(lno));
		String type=vo.getType();
		
		request.setAttribute("lno", lno);
		request.setAttribute("vo", vo);
		request.setAttribute("type", type);
		request.setAttribute("main_jsp", "../location/location_detail.jsp");
		return "../location/location_detail.jsp";
	}
}