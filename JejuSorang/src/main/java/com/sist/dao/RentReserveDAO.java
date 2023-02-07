package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class RentReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 선택된 렌트카 데이터
	public CarVO ReserveRentData(int car_no)
	{
	      CarVO vo=new CarVO();
	      try {
	    	  CreateConnection.getConnection();
	    	  String sql="SELECT car_no,car_name,car_price "
	    	  		+ "FROM jj_car_1 "
	    	  		+ "WHERE car_no=?";
	    	  ps=conn.prepareStatement(sql);
	    	  ps.setInt(1, car_no);
	    	  ResultSet rs=ps.executeQuery();
	    	  rs.next();
	    	  vo.setCar_no(rs.getInt(1));
	    	  vo.setCar_name(rs.getString(2));
	    	  vo.setCar_price(rs.getString(3));
	    	  rs.close();
	    	  
	      }catch (Exception e) {
	    	  e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
	      return vo;
		
	}
   // 예약자 정보
	public MemberVO ReserveMemberData()
	{
		MemberVO vo=new MemberVO();
		try {
			CreateConnection.getConnection();
			String sql="SELECT id,pwd,name,email,birthday,phone "
					+ "FROM jj_member_1";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setId(rs.getString(1));
			vo.setPwd(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setEmail(rs.getString(4));
			vo.setBirthday(rs.getString(5));
			vo.setPhone(rs.getString(6));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
}



