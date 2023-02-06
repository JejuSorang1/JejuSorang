package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class AllReviewModel {
	/*
	 ALL_REVIEW_NO NOT NULL NUMBER       
	 ID                     VARCHAR2(20) 
	 CATE_NO       NOT NULL NUMBER       
	 DETAIL_NO     NOT NULL NUMBER       
	 MSG           NOT NULL CLOB         
	 REGDATE       NOT NULL DATE         
	 STAR                   NUMBER  
*/
   String[] url={"","../hetel/hotel_detail.do?hno=","../rent/car_detail.do?rcno="};
   @RequestMapping("all_review/all_review_insert.do")
   public String all_review_insert(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   String all_review_no=request.getParameter("all_review_no");
	   String cate_no=request.getParameter("cate_no");
	   String msg=request.getParameter("msg");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   AllReviewDAO dao=new AllReviewDAO();
	   AllReviewVO vo=new AllReviewVO();
	   vo.setCate_no(Integer.parseInt(cate_no));
	   vo.setAll_review_no(Integer.parseInt(all_review_no));
	   vo.setMsg(msg);
	   vo.setId(id);
	   dao.allReviewInsert(vo);
	   return "redirect:"+url[Integer.parseInt(cate_no)]+all_review_no;
   }
   
   @RequestMapping("all_review/all_review_delete.do")
   public String all_reply_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String detail_no=request.getParameter("detail_no");
	   String all_review_no=request.getParameter("all_review_no");
	   String cate_no=request.getParameter("cate_no");
	   // DAO연결
	   AllReviewDAO dao=new AllReviewDAO();
	   dao.allReviewDelete(Integer.parseInt(all_review_no));
	   return "redirect:"+url[Integer.parseInt(cate_no)]+all_review_no;
   }
   
   @RequestMapping("all_review/all_review_update.do")
   public String all_review_update(HttpServletRequest request,HttpServletResponse response)
   {
	   // Java => 브라우저 => Java
	   //    encoding   decoding
	   /*
	    *    byte[]  ==> 원상복귀 
	    *    자바(%EC%9E%90%EB%B0%94) ==>  %EC%9E%90%EB%B0%94(자바)
	    *    
	    *    POST => GET (server.xml => windows 10) => 자동으로 처리 
	    *    windows => linux (AWS) PaaS (운영체제) => 호스팅 
	    */
	   try
	   {
		   request.setCharacterEncoding("UTF-8"); 
	   }catch(Exception ex) {}
	   String detail_no=request.getParameter("detail_no");
	   String all_review_no=request.getParameter("all_review_no");
	   String cate_no=request.getParameter("cate_no");
	   String msg=request.getParameter("msg");
	   // 데이터베이스 연결 
	   AllReviewDAO dao=new AllReviewDAO();
	   dao.allReviewUpdate(Integer.parseInt(all_review_no), msg); 
	   return "redirect:"+url[Integer.parseInt(cate_no)]+all_review_no;
   }
}