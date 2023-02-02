package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class RcomDAO {
	private Connection conn;
	private PreparedStatement ps;
	public RcomVO RentrcomData(int rcno)
	{
	     RcomVO vo = new RcomVO();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT rcno,all_cate_no,rname,rctel,rcaddr,star "
					+ "FROM jj_rcom_1 " 
					+"WHERE rcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rcno);
			ResultSet rs=ps.executeQuery();
             rs.next();				
				vo.setRcno(rs.getInt(1));
				vo.setAll_cate_no(rs.getInt(2));
				vo.setRname(rs.getString(3));
				vo.setRctel(rs.getString(4));
				vo.setRcaddr(rs.getString(5));
				vo.setStar(rs.getDouble(6));
			
			rs.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
}
