package com.sist.dao;
import java.util.*;

import javax.servlet.http.HttpSession;

import java.sql.*;
import java.sql.Date;

import com.sist.vo.*;

public class HotelReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void hotelReserveOk(HotelReserveVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO jj_hreserve_1 VALUES("
				    +"(SELECT NVL(MAX(hrno)+1,1) FROM jj_hreserve_1),?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,vo.getId());
			ps.setInt(2, vo.getHprice());
			ps.setString(3, vo.getHpycheck());
			ps.setInt(4, vo.getHno());
			ps.setInt(5, vo.getRno());
			ps.setString(6, vo.getCkin());
			ps.setString(7, vo.getCkout());
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
	
	//마이페이지에서 읽기
	/*public List<HotelReserveVO> hotelReserveMyPageData(String id)
	{
		List<HotelReserveVO> list=new ArrayList<HotelReserveVO>();
		try
		{
			
			conn=CreateConnection.getConnection();
			String sql="SELECT hrno,h.name,h.hotel_image,ckin,ckout,hprice,hno,hpycheck "
					+"FROM jj_hotel_1 h,jj_room_1 r "
					+"WHERE h.hno=r.hno "
					+"AND id=? "
					+"ORDER BY hrno DESC";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{  
				HotelReserveVO vo=new HotelReserveVO();
				vo.setHrno(rs.getInt(1));
				vo.getHvo().setName(rs.getString(2));
				vo.getHvo().setHotel_image(rs.getString(3));
				vo.setCkin(rs.getString(4));
				vo.setCkout(rs.getString(5));
				vo.setHprice(rs.getShort(6));
				vo.setHno(rs.getInt(7));
				vo.setHpycheck(rs.getString(8));
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
	}*/

	 
	  
}