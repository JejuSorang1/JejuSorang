package com.sist.dao;
import java.util.*;

import javax.servlet.http.HttpSession;

import java.sql.*;
import com.sist.vo.*;

public class HotelReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void hotelReserveOk(RoomVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO jj_hreserver_1 VALUES("
					+"(SELECT NVL(MAX(hrno)+1,1) FROM jj_hreserve_1),"
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