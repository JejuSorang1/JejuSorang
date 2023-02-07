package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class HotelModel {
   @RequestMapping("hotel/hotel_all.do") //호텔 전체 목록
   public String hotel_list(HttpServletRequest request, HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      
      HotelDAO dao=new HotelDAO();
  
      List<HotelVO> list=dao.HotelListData(curpage);
      HotelVO vo=dao.hotel_detail(Integer.parseInt(page));
      String address=vo.getAddr();
      //제주 서귀포시 성산읍 섭지코지로 107
      String addr1=address.substring(3,5);
      String addr2=address.substring(3,6);
      request.setAttribute("vo", vo);
      request.setAttribute("addr1", addr1);
      request.setAttribute("addr2", addr2);
      
      int count=dao.HotelRowCount();
      int totalpage=(int)(Math.ceil(count/20.0));

      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;
      
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("list", list);
      request.setAttribute("count", count);

      /*HttpSession session=request.getSession();
      String id=(String)session.getAttribute("id");
      JjimDAO jdao=new JjimDAO();*/
     
      //footer
      CommonsModel.footerData(request);
      
      request.setAttribute("main_jsp", "../hotel/hotel_all.jsp");
      return "../main/main.jsp";
   }
   @RequestMapping("hotel/hotel_detail.do") //호텔 상세보기
   public String hotel_detail(HttpServletRequest request,HttpServletResponse response)
   {
      String hno=request.getParameter("hno");
      
      HotelDAO dao=new HotelDAO();
      HotelVO hvo=dao.hotel_detail(Integer.parseInt(hno));
      String addr=hvo.getAddr();
      
      request.setAttribute("hvo", hvo);
      request.setAttribute("addr", addr);
      
      RoomDAO adao=new RoomDAO();
      List<RoomVO> rList=adao.room_detail(Integer.parseInt(hno));
      request.setAttribute("rList", rList); 
      
      
      HttpSession session=request.getSession();
      //int all_cate_no=(int) session.getAttribute("all_cate_no");
      String id=(String)session.getAttribute("id");
      JjimDAO jdao=new JjimDAO();
      int jc=jdao.jjimCount(Integer.parseInt(hno),id);
      int jt=jdao.hotelJjimCount(Integer.parseInt(hno));
      request.setAttribute("jjim_count", jc);  
      request.setAttribute("jjim_total", jt);
      
      LikeDAO ldao=new LikeDAO();
      int mc=ldao.myLikeCount(Integer.parseInt(hno), id);
      int tc=ldao.hotelLikeCount(Integer.parseInt(hno));
      request.setAttribute("like_count", mc);
      request.setAttribute("like_total", tc);
      
      request.setAttribute("main_jsp", "../hotel/hotel_detail.jsp");
      AllReviewDAO redao=new AllReviewDAO();
      List<AllReviewVO> reList=redao.allReviewListData(Integer.parseInt(hno), 1);
      request.setAttribute("reList", reList);
      request.setAttribute("count", reList.size());
      //footer
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
   
   @RequestMapping("hotel/hotel_findlist.do") //검색 후
   public String hotel_findlist(HttpServletRequest request, HttpServletResponse response)
   {
      String ss=request.getParameter("ss");
      if(ss==null)
         ss="제주";
      
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      
      int curpage=Integer.parseInt(page);
      
      HotelDAO dao=new HotelDAO();
      
      List<HotelVO> list=dao.HotelFindList(curpage,ss);
      int count=dao.HotelRowCount();
      int totalpage=(int)(Math.ceil(count/20.0));
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;
      
       
      
      
      
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("list", list);
      request.setAttribute("count", count);
      
      
      
      request.setAttribute("main_jsp", "../hotel/hotel_findlist.jsp");
      
      //footer
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
}