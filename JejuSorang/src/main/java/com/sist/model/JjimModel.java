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
	
}
/*
 * String[]url={"","../seoul/seoul_detail.do?no=","../food/food_detail.do?fno=",
 * "../goods/goods_detail.do?gno="};
 * 
 * @RequestMapping("all_reply/all_reply_insert.do") 
 * public String all_reply_insert(HttpServletRequest request,HttpServletResponse response) {
 * try 
 * { 
 *   request.setCharacterEncoding("UTF-8"); 
 * }catch(Exception ex) {} 
 * String no=request.getParameter("no"); 
 * String cate_no=request.getParameter("cate_no"); 
 * String msg=request.getParameter("msg"); 
 * HttpSession session=request.getSession();
 * String id=(String)session.getAttribute("id"); 
 * String name=(String)session.getAttribute("name"); 
 * AllReplyDAO dao=new AllReplyDAO();
 * AllReplyVO vo=new AllReplyVO(); 
 * vo.setCate_no(Integer.parseInt(cate_no));
 * vo.setNo(Integer.parseInt(no));
 * vo.setMsg(msg); vo.setId(id);
 * vo.setName(name); dao.allReplyInsert(vo);
 *  return "redirect:"+url[Integer.parseInt(cate_no)]+no; 
 *  }
 */