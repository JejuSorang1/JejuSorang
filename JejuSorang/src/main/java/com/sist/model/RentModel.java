package com.sist.model;
 import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
 import com.sist.vo.*;
 
 @Controller
public class RentModel {

	//@RequestMapping("rent/rent_all.do")
	//public String rent_all(HttpServletRequest request,HttpServletResponse response)
	//{
//		 try
//		   {
//			   // 한글 변환 
//			   request.setCharacterEncoding("UTF-8");
//		   }catch(Exception ex){}
//		   String ss=request.getParameter("ss");
//		   if(ss==null)
//			   ss="";
//		  String page=request.getParameter("page");
//		   if(page==null)
//		   page="1";
//		// 현재페이지 지정 
//		   int curpage=Integer.parseInt(page);
//		// DAO에서 해당 페이지의 데이터 읽기 
//		   RentDAO dao=new RentDAO();
//		   List<CarVO> list=dao.CarListData(curpage,ss);
//		   int totalpage=dao.RentAllTotalPage();
//		   
//		   final int BLOCK=5;
//		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
//		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
//		   if(endPage>totalpage)
//			   endPage=totalpage;
//		   
//		   request.setAttribute("list", list);
//		   request.setAttribute("curpage", curpage);
//		   request.setAttribute("ss", ss);
//		   request.setAttribute("totalpage", totalpage);
//		   request.setAttribute("startPage", startPage);
//		   request.setAttribute("endPage", endPage);
//		   request.setAttribute("main_jsp", "../rent/rent_all.jsp");
//		   
//		return "../main/main.jsp";
	//}
	@RequestMapping("rent/rent_search.do")
	public String rent_search(HttpServletRequest request,HttpServletResponse response)
	{
	    try
	     {
		   // 한글 변환 
		   request.setCharacterEncoding("UTF-8");
	     }catch(Exception ex){
		   
	     }
	    
	     //초기화
	  	 String type = "";
	  	 
	  	 //검색어 버튼 때 type이 없는 경우, 체크박스로 type이 있는 경우  // true/false boolean
	  	 if(request.getParameterMap().containsKey("type")) {
	  		 type = request.getParameter("type");
	  	 }
	  	 
	  	 //초기화
	  	 String searchText = "";
	  	 if(type.equals("cbx")) {
	  		searchText=request.getParameter("cbxList");
	  	 }else {
	  		searchText=request.getParameter("search");
	  	 }
	   	   
		   if(searchText==null)
			   searchText="";
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		// 현재페이지 지정 
		   int curpage=Integer.parseInt(page);
		// DAO에서 해당 페이지의 데이터 읽기 
		   //변수 선언
		   RentDAO dao=new RentDAO();
		   int totalpage = 0;
		   ArrayList<CarVO> list = null;
		   
		   if(type.equals("cbx")) {
			   list=dao.CarTypeSearchData(curpage, searchText);
			   totalpage=dao.CarTypeTotalPage(searchText);
		   }else{
			   list=dao.RentSearchData(curpage, searchText);
			   totalpage=dao.RentSearchTotalPage(searchText);
		   }
		   
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
			
			//footer
			CommonsModel.footerData(request);
	  	   if(type.equals("cbx")) {
	  		 request.setAttribute("rtnCbxList", searchText);
	  	   }else {
	  		 request.setAttribute("search",searchText);
	  	   }
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
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
   
   //데이터 베이스 연결
   RentDAO dao=new RentDAO();
   CarVO vo=dao.car_detail(Integer.parseInt(cno));
   
   
   //footer
   request.setAttribute("vo", vo);
   request.setAttribute("main_jsp","../rent/car_detail.jsp");
   
   HttpSession session=request.getSession();
   //int all_cate_no=(int) session.getAttribute("all_cate_no");
   String id=(String)session.getAttribute("id");
   JjimDAO jdao=new JjimDAO();
   int jcount=jdao.jjimCount(/*all_cate_no,*/Integer.parseInt(cno),id);
   request.setAttribute("jjim_count", jcount);  
   
   // 화면 출력 
   request.setAttribute("main_jsp", "../rent/car_detail.jsp");
   AllReviewDAO adao=new AllReviewDAO();
   List<AllReviewVO> rList=adao.allReviewListData(Integer.parseInt(cno), 2);
   request.setAttribute("rList", rList);
   request.setAttribute("count", rList.size());
   
   return "../main/main.jsp";
   
   }

	
 }
