package com.sist.dao;
import java.util.*;

import javax.servlet.http.HttpSession;

import java.sql.*;
import com.sist.vo.*;

public class HotelReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public List<RoomVO> reserveRoomListData(int hno)
	{
		List<RoomVO> list=new  ArrayList<RoomVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT hno,room_no,room_name,room_price,room_image "
					+"FROM jj_room_1 "
					+"WHERE hno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				RoomVO vo=new RoomVO();
				vo.setHno(rs.getInt(1));
				vo.setRoom_no(rs.getInt(2));
				vo.setRoom_name(rs.getString(3));
				vo.setRoom_price(rs.getString(4));
				vo.setRoom_image(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
		
	}
}