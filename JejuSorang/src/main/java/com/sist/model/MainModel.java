package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.dao.RentDAO;
import com.sist.vo.CarVO;
import com.sist.vo.HotelVO;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session=request.getSession();
//		session.setAttribute("id", "hong");
//		session.setAttribute("admin", "y");
		//테스트용 session

		HotelDAO hdao=new HotelDAO();
		List<HotelVO> hlist=hdao.hotel_rank();
		RentDAO rdao=new RentDAO();
		List<CarVO> clist=rdao.car_rank();
		
		
		//footer
		CommonsModel.footerData(request);
		
		//include할 파일명을 전송
		request.setAttribute("hlist", hlist);
		request.setAttribute("clist", clist);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
