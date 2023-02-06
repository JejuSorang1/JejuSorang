package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

@Controller
public class JjimModel {
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request,HttpServletResponse response)
	{
		String hno=request.getParameter("hno");
		String cate_no=request.getParameter("cate_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		JjimVO vo=new JjimVO();
		vo.setNo(Integer.parseInt(hno));
		vo.setId(id);
		//데이터베이스연동
		JjimDAO dao=new JjimDAO();
		dao.jjimInsert(vo,Integer.parseInt(cate_no));
		return "redirect:../hotel/hotel_detail.do?hno="+hno;  
	}
	@RequestMapping("jjim/rent_jjim_insert.do")
	public String rent_jjim_insert(HttpServletRequest request,HttpServletResponse response)
	{
		String rcno=request.getParameter("rcno");
		String cate_no=request.getParameter("cate_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		JjimVO vo=new JjimVO();
		vo.setNo(Integer.parseInt(rcno));
		vo.setId(id);
		
		JjimDAO dao=new JjimDAO();
		dao.jjimInsert(vo, Integer.parseInt(cate_no));
		return "redirect:../rent/car_detail.do?rcno="+rcno;
	}
}
