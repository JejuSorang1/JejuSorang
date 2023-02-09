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
			/*
			 * HRNO     NOT NULL NUMBER        
				CKIN     NOT NULL VARCHAR2(100) 
				CKOUT    NOT NULL VARCHAR2(100) 
				HRENO      
				HPRICE   NOT NULL NUMBER        
				HPYCHECK          CHAR(1)       
				ID                VARCHAR2(20)  
				HNO               NUMBER        
				RNO               NUMBER    
			 */
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO jj_hreserve_1 VALUES("
				    +"(SELECT NVL(MAX(hrno)+1,1) FROM jj_hreserve_1),?,?,?,?,'N',?,?,?)";
			ps.setString(1, vo.getCkin());
			ps.setString(2, vo.getCkout());
			ps.setString(3, vo.getHreno());
			ps.setInt(4, vo.getHprice());
			ps.setString(5, vo.getId());
			ps.setInt(6, vo.getHno());
			ps.setInt(7, vo.getRno());
			ps=conn.prepareStatement(sql);
			
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
	
	//예약정보 마이페이지에서 읽기
	public List<HotelReserveVO> hotelReserveMyPageData(String id)
	{
		List<HotelReserveVO> list=new ArrayList<HotelReserveVO>();
		try
		{
			
			conn=CreateConnection.getConnection();
			String sql="SELECT hrno,h.name,h.hotel_image,ckin,ckout,hprice,r.hno,hpycheck "
					+"FROM jj_hotel_1 h,jj_hreserve_1 r "
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
				vo.setHprice(rs.getInt(6));
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
	}
	
	public List<HotelReserveVO> hotelReserveAdminPageData()
	{
		List<HotelReserveVO> list=new ArrayList<HotelReserveVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT hrno,r.hno,ckin,ckout,hotel_image,name,hpycheck "
					+"FROM jj_hotel_1 h,jj_hreserve_1 r "
					+"WHERE h.hno=r.hno "
					+"AND id=? "
					+"ORDER BY hrno DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				HotelReserveVO vo=new HotelReserveVO();
				vo.setHrno(rs.getInt(1));
				vo.getHvo().setHno(rs.getInt(2));
				vo.setCkin(rs.getString(3));
				vo.setCkout(rs.getString(4));
				vo.getHvo().setHotel_image(rs.getString(5));
				vo.getHvo().setName(rs.getString(5));
				vo.setHpycheck(rs.getString(7));
				list.add(vo);
			}
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
	
	//예약 승인
	public void hotelReserveAdminOk(int hrno)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE jj_hreserve_1 SET "
					+"hpycheck='y' "
					+ "WHERE hrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hrno);
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
	
	public HotelReserveVO hotelMyPageReserveInfo(int hrno)
	{
		HotelReserveVO vo=new HotelReserveVO();
		try 
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT hrno,r.hno,ckin,ckout,hotel_image,name "
					+"FROM jj_hotel_1 h,jj_hreserve_1 "
					+"WHERE h.hno=r.hno "
					+"AND hrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hrno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setHrno(rs.getInt(1));
			vo.getHvo().setHno(rs.getInt(2));
			vo.setCkin(rs.getString(3));
			vo.setCkout(rs.getString(4));
			vo.getHvo().setHotel_image(rs.getString(5));
			vo.getHvo().setName(rs.getString(6));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	public void hotelReserveDelete(int hrno)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM jj_hreserve_1 "
					+"WHERE hrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hrno);
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