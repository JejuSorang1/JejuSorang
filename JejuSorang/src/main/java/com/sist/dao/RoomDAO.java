package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.RoomVO;

public class RoomDAO {
	private Connection conn;
	private PreparedStatement ps;
	public List<RoomVO> room_detail(int hno)
	{
		List<RoomVO> list = new ArrayList<RoomVO>();
		try
		{
			conn =CreateConnection.getConnection();
			String sql ="SELECT hno,room_no,room_name,room_price,room_image,room_persons,room_bed_info,account "
					+ "from jj_room_1 "
					+ "where hno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				RoomVO vo=new RoomVO();
				vo.setHno(rs.getInt(1));
				vo.setRoom_no(rs.getInt(2));
				vo.setRoom_name(rs.getString(3));
				vo.setRoom_price(rs.getString(4));
				vo.setRoom_image(rs.getString(5));
				vo.setRoom_persons(rs.getString(6));
				vo.setRoom_bed_info(rs.getString(7));
				vo.setAccount(rs.getInt(8));
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
			
		}
		
		return list;
	}
}
