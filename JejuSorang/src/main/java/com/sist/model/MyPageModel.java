package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AllReviewDAO;
import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

@Controller
public class MyPageModel {

	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/jjim_hotel_list.do")
	  public String mypage_hotel_jjim(HttpServletRequest request,HttpServletResponse response) {
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  JjimDAO dao=new JjimDAO();
		  List<JjimVO> list=dao.jjimHotelListData(id);
		  request.setAttribute("list", list);
		  CommonsModel.footerData(request);
		  return "../jjim/jjim_hotel_list.jsp";
	  }
	
	@RequestMapping("mypage/jjim_rent_list.do")
	public String mypage_rent_jjim(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		JjimDAO dao=new JjimDAO();
		List<JjimVO> list=dao.jjimRentListData(id);
		request.setAttribute("list", list);
		CommonsModel.footerData(request);
		return "../jjim/jjim_rent_list.jsp";
	}
	  
	  @RequestMapping("mypage/jjim_delete.do")
	  public String mypage_jjim_delete(HttpServletRequest request,HttpServletResponse response) {
		  String jno=request.getParameter("no");
		  JjimDAO dao=new JjimDAO();
		  dao.jjimDelete(Integer.parseInt(jno));
		  return "redirect:jjim_hotel_list.do";
	  }
	  
	  @RequestMapping("mypage/hotel_review_list.do")
	  public String mypage_hotel_review(HttpServletRequest request,HttpServletResponse response) {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  AllReviewDAO dao=new AllReviewDAO();
		  
		  return "../reply/hotel_reply_list.jsp";
	  }
	  
	  @RequestMapping("mypage/rent_reserve_list.do")
	  public String mypage_rent_reserve(HttpServletRequest request,HttpServletResponse response) {
		    HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			
			
//			request.setAttribute("list", list);
			CommonsModel.footerData(request);
		  return "../reserve/rent_reserve_list.jsp";
	  }
	  @RequestMapping("mypage/hotel_reserve_list.do")
	  public String mypage_hotel_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  return "../hotel/hotel_detail.jsp";
	  }
}
