package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.Rent_ReserveDAO;
import java.util.*;
import com.sist.vo.*;
import java.text.*;
@Controller
public class Rent_ReserveModel {
	@RequestMapping("reserve/rent_reserve.do")
	  public String reserve_main(HttpServletRequest request,HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../reserve/rent_reserve.jsp");
		  CommonsModel.footerData(request);
		  return "../main/main.jsp";
	  }
	  
}
