package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

@Controller
public class NoticeModel {
	private String[] prefix= {"","일반공지","이벤트공지","맛집공지","여행공지","상품공지"};
	@RequestMapping("notice/list.do")
	public String notice_list(HttpServletRequest request,HttpServletResponse response) {
		//사용자 보내준 데이터 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		NoticeDAO dao=new NoticeDAO();
		List<NoticeVO> list=dao.noticeListData(curpage);
		
		for(NoticeVO vo:list) {
			vo.setPrefix("["+prefix[vo.getType()]+"]");
		}
		int totalpage=dao.noticeTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		request.setAttribute("main_jsp", "../notice/list.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	

}
