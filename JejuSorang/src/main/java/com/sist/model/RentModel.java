package com.sist.model;
 import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
 import com.sist.vo.*;
 
 @Controller
public class RentModel {

@RequestMapping("rent/rent_all.do")
public String rent_all(HttpServletRequest request,HttpServletResponse response)
{

	 
	 try
	   {
		   // 한글 변환 
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex){}
	   String ss=request.getParameter("ss");
	   if(ss==null)
		   ss="";
	  String page=request.getParameter("page");
	   if(page==null)
	   page="1";
	// 현재페이지 지정 
	   int curpage=Integer.parseInt(page);
	// DAO에서 해당 페이지의 데이터 읽기 
	   RentDAO dao=new RentDAO();
	   List<CarVO> list=dao.CarListData(curpage,ss);
	   int totalpage=dao.RentAllTotalPage();
	   
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("ss", ss);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("main_jsp", "../rent/rent_all.jsp");
	   
	return "../main/main.jsp";
}
@RequestMapping("rent/rent_search.do")
public String rent_search(HttpServletRequest request,HttpServletResponse response)
{
	  try
	   {
		   // 한글 변환 
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex){}
	   String ss=request.getParameter("ss");
	   if(ss==null)
		   ss="";
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	// 현재페이지 지정 
	   int curpage=Integer.parseInt(page);
	// DAO에서 해당 페이지의 데이터 읽기 
	   RentDAO dao=new RentDAO();
	   ArrayList<CarVO> list=dao.RentSearchData(curpage, ss);
	   int totalpage=dao.RentSearchTotalPage(ss);
	   
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
		
		//footer
		CommonsModel.footerData(request);
		
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("ss",ss);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("main_jsp", "../rent/rent_search.jsp");
	   
	   
	return "../main/main.jsp";
	}
@RequestMapping("rent/car_detail.do")
public String car_detail(HttpServletRequest request,HttpServletResponse response)
{
   String cno=request.getParameter("car_no");
   System.out.println(cno);
   
   //데이터 베이스 연결
   RentDAO dao=new RentDAO();
   CarVO vo=dao.car_detail(Integer.parseInt(cno));
	
	//footer
	CommonsModel.footerData(request);
	
   
   request.setAttribute("vo", vo);
   request.setAttribute("cno", cno);
   request.setAttribute("main_jsp","../rent/car_detail.jsp");
   return "../main/main.jsp";
   
	}
}
