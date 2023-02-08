package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public String move_login(HttpServletRequest request,HttpServletResponse response) {
		
		//footer
		CommonsModel.footerData(request);
		
		
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../main/main.jsp";
	}
	
	// => javaScript => Ajax, Vue, React (단독으로 수행) ../main/main.jsp가 아니라 따로 띄워야함
	@RequestMapping("member/idcheck.do")
	public String member_idCheck(HttpServletRequest request, HttpServletResponse response) {
		
		return "../member/idcheck.jsp";
	}
	
	@RequestMapping("member/idcheck_result.do")
	public String member_idcheck_result(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		MemberDAO dao=new MemberDAO();
		int count=dao.memberIdCheck(id);
		request.setAttribute("count", count);
		return "../member/idcheck_result.jsp";
	}
	
	@RequestMapping("member/postfind.do")
	public String member_postfind(HttpServletRequest request, HttpServletResponse response) {
		return "../member/postfind.jsp";
	}
	
	@RequestMapping("member/postfind_result.do")
	public String member_postfind_result(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String dong=request.getParameter("dong");
		MemberDAO dao=new MemberDAO();
		int count=dao.memberPostCount(dong);
		List<ZipcodeVO> list=dao.memberPostFind(dong);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "../member/postfind_result.jsp";
	}
	
	@RequestMapping("member/email_check.do")
	public String member_email_check(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		MemberDAO dao=new MemberDAO();
		int count=dao.memberEmailCheck(email);
		request.setAttribute("count", count);
		return "../member/email_check.jsp";
	}
	
	@RequestMapping("member/tel_check.do")
	public String member_tel_check(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");
		MemberDAO dao=new MemberDAO();
		int count=dao.memberPhoneCheck(phone);
		request.setAttribute("count", count);
		return "../member/tel_check.jsp";
	}
	
	@RequestMapping("member/join_ok.do")
	public String member_insert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		/*
		 * ID       NOT NULL VARCHAR2(20)  
			PWD      NOT NULL VARCHAR2(20)  
			NAME     NOT NULL VARCHAR2(34)  
			EMAIL             VARCHAR2(100) 
			BIRTHDAY NOT NULL VARCHAR2(20)  
			POST     NOT NULL VARCHAR2(20)  
			ADDRESS1 NOT NULL VARCHAR2(200) 
			ADDRESS2 NOT NULL VARCHAR2(200) 
			PHONE             VARCHAR2(20)  
			ADMIN    NOT NULL CHAR(1)      
		 */
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String birthday=request.getParameter("birthday");
		String post=request.getParameter("post");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirthday(birthday);
		vo.setPost(post);
		vo.setAddress1(address1);
		vo.setAddress2(address2);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		MemberDAO dao=new MemberDAO();
		dao.memberInsert(vo);
		
		return "redirect:../main/main.do";
	}
	
	@RequestMapping("member/login_check.do")
	public String member_login(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberDAO dao=new MemberDAO();
		//결과값 받기
		MemberVO vo=dao.memberLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			//session에 저장 => 모든 JSP에서 사용이 가능하게 만듦
			//session생성
			HttpSession session=request.getSession();
			//session,cookie => request를 이용해서 생성한다
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
			session.setAttribute("birthday", vo.getBirthday());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("phone", vo.getPhone());
		}
		request.setAttribute("result", vo.getMsg());
		return "../member/login_check.jsp";
	}
	
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate();//모든 정보 해제
		return "redirect:../main/main.do";
	}
	
	/*@RequestMapping("member/idfind.do")
	   public String member_idfind(HttpServletRequest request,HttpServletResponse response)
	   {
	      request.setAttribute("main_jsp", "../member/idfind.jsp");
	      return "../main/main.jsp";
	   }
	   @RequestMapping("member/idfind_ok.do")
	   public void member_idfind_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	      String tel=request.getParameter("tel");
	      MemberDAO dao=new MemberDAO();
	      String res=dao.memberIdfind(tel);
	      try
	      {
	         PrintWriter out=response.getWriter();
	         out.println(res);
	      }catch(Exception ex) {}
	   }
	   @RequestMapping("member/idfind2_ok.do")
	   public void member_idfind2_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	      String email=request.getParameter("email");
	      MemberDAO dao=new MemberDAO();
	      String res=dao.memberIdfind2(email);
	      try
	      {
	         PrintWriter out=response.getWriter();
	         out.println(res);
	      }catch(Exception ex) {}
	   }*/
	   
	   
	   // => 회원수정, 회원탈퇴 시 주의점: session 변경해서 다시 저장, session을 해제시켜야 함 
	   @RequestMapping("member/join_update.do")
	   public String member_join_update(HttpServletRequest request,HttpServletResponse response)
	   {
	      HttpSession session=request.getSession();
	      String id=(String)session.getAttribute("id");
	      MemberDAO dao=new MemberDAO();
	      //db연동
	      MemberVO vo=dao.memberJoinUpdateData(id);
	      
	      request.setAttribute("vo", vo);
	      
	      
	      return "../member/join_update.jsp";
	   }
	   @RequestMapping("member/join_update_ok.do")
	   public void member_join_update_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	      // ajax이용
	      try
	      {
	         request.setCharacterEncoding("UTF-8");
	      }catch(Exception ex) {}
	      String id=request.getParameter("id");
	      String pwd=request.getParameter("pwd");
	      String name=request.getParameter("name");
	      String birthday=request.getParameter("birthday");
	      String post=request.getParameter("post");
	      String address1=request.getParameter("address1");
	      String address2=request.getParameter("address2");
	      String email=request.getParameter("email");
	      String phone=request.getParameter("phone");
	      
	      MemberVO vo=new MemberVO();
	      vo.setId(id);
	      vo.setPwd(pwd);
	      vo.setName(name);
	      vo.setBirthday(birthday);
	      vo.setPost(post);
	      vo.setAddress1(address1);
	      vo.setAddress2(address2);
	      vo.setEmail(email);
	      vo.setPhone(phone);
	      
	      MemberDAO dao=new MemberDAO();
	      boolean bCheck=dao.memberJoinUpdate(vo);
	      try
	      {
	         PrintWriter out=response.getWriter(); //브라우저에 값을 보내겠다
	         if(bCheck==true)
	         {
	            out.println("yes");
	            HttpSession session=request.getSession();
	            session.setAttribute("name", vo.getName());
	         }
	         else
	         {
	            out.println("no");
	         }
	      }catch(Exception ex) {}
	   }
	   
	   @RequestMapping("member/join_delete.do")
	   public String member_delete(HttpServletRequest request,HttpServletResponse response) {
		   
		   
		   CommonsModel.footerData(request);
		   return "../member/join_delete.jsp";
	   }
	   
	   @RequestMapping("member/join_delete_ok.do")
	   public void member_delete_ok(HttpServletRequest request,HttpServletResponse response) {
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String pwd=request.getParameter("pwd");
		   MemberDAO dao=new MemberDAO();
		   boolean bCheck=dao.memberJoinDelete(id, pwd);
		   try {
			   PrintWriter out=response.getWriter();
			   if(bCheck==true) {
				   out.println("yes");
				   session.invalidate();
			   }else {
				   out.println("no");
			   }
		   }catch(Exception e) {e.printStackTrace();}
	   }
}
