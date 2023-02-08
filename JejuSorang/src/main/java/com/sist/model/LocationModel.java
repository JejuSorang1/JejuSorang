package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		  
		  LocationDAO dao=new LocationDAO();
		  String lno=request.getParameter("lno");
		  List<LocationVO> list=dao.LocationFindData(Integer.parseInt(lno), ss);
		  LocationVO lvo=dao.location_detail(Integer.parseInt(lno));
		  HttpSession session=request.getSession();
	      //int all_cate_no=(int) session.getAttribute("all_cate_no");
	      String id=(String)session.getAttribute("id");
	      JjimDAO jdao=new JjimDAO();
	      int jc=jdao.jjimCount(Integer.parseInt(lno),id);
	      int jt=jdao.hotelJjimCount(Integer.parseInt(lno));
	      request.setAttribute("jjim_count", jc);  
	      request.setAttribute("jjim_total", jt);
	      request.setAttribute("lvo", lvo);
		  request.setAttribute("list", list);
		  request.setAttribute("lno", lno);
		  request.setAttribute("ss", ss);
		  request.setAttribute("main_jsp", "../location/location_list.jsp");
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