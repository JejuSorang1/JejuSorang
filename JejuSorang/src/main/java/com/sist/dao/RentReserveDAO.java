package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class RentReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	public void reserveOk(RentReserveVO vo)
	  {
		/*
		 *  ID                  VARCHAR2(20) 
			RRNO       NOT NULL NUMBER       
			RPRICE     NOT NULL NUMBER       
			RPYCHECK            CHAR(1)      
			CAR_NO              NUMBER       
			START_RENT          VARCHAR2(20) 
			END_RENT            VARCHAR2(20) 

		 */
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="INSERT INTO jj_rent_reserve_1 VALUES("
					    +"(SELECT NVL(MAX(rrno)+1,1) FROM jj_rent_reserve_1),?,?,?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getId());
			  ps.setInt(2, vo.getCar_no());
			  ps.setString(3, vo.getStart_rent());
			  ps.setString(4, vo.getEnd_rent());
			  ps.executeUpdate();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  CreateConnection.disConnection(conn, ps);
		  }
	  }
	
}



