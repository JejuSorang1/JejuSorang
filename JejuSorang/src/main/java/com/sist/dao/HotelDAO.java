package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;


import java.sql.*;
import com.sist.vo.*;
public class HotelDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//1. 전체 리스트 출력
	public List<HotelVO> HotelListData(int page)
	{
		List<HotelVO> list=new ArrayList<HotelVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT hno,name,hotel_image,addr,grade,star,time,num "
					+"FROM (SELECT hno,name,hotel_image,addr,grade,star,time,rownum as num "
					+"FROM (SELECT /*+INDEX_ASC(jj_hotel_1 hotel_hno_pk_1)*/ hno,name,hotel_image,addr,grade,star,time "
					+"FROM jj_hotel_1)) "
					+"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				HotelVO vo=new HotelVO();
				vo.setHno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setHotel_image(rs.getString(3));
				vo.setAddr(rs.getString(4));
	            vo.setGrade(rs.getString(5));
	            vo.setStar(rs.getDouble(6));
	            vo.setTime(rs.getString(7));
	            
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
	public int HotelRowCount()
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM jj_hotel_1";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return count;
	}
	//2. 검색
	public List<HotelVO> HotelFindList(int page, String ss)
	{
		List<HotelVO> list=new ArrayList<HotelVO>();
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT hno,name,hotel_image,addr,grade,star,time,num "
	                 +"FROM (SELECT hno,name,hotel_image,addr,grade,star,time,rownum as num "
	                 +"FROM (SELECT hno,name,hotel_image,addr,grade,star,time "
	                 +"FROM jj_hotel_1 "
	                 +"WHERE addr LIKE '%'||?||'%')) "
	                 +"WHERE num BETWEEN ? AND ?";
	           
	         ps=conn.prepareStatement(sql);
	         int rowSize=20;
	         int start=(rowSize*page)-(rowSize-1);
	         int end=rowSize*page;
	   
	         ps.setString(1, ss);  
	         ps.setInt(2, start);
	         ps.setInt(3, end);
	         ResultSet rs=ps.executeQuery();
	         while(rs.next())
	         {
	            HotelVO vo=new HotelVO();
	            vo.setHno(rs.getInt(1));
	            vo.setName(rs.getString(2));
	            vo.setHotel_image(rs.getString(3));
	            vo.setAddr(rs.getString(4));
	            vo.setGrade(rs.getString(5));
	            vo.setStar(rs.getDouble(6));
	            vo.setTime(rs.getString(7));
	            
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
	public int HotelFindTotalPage(String ss) //검색 총페이지
	{     
		int total=0;
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT CEIL(COUNT(*)/20.0) FROM jj_hotel_1";
	    
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, ss);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         total=rs.getInt(1);
	         rs.close();
	      }catch(Exception ex)
	      {
	         ex.printStackTrace();
	      }
	      finally
	      {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return total;
	}
	//3. 호텔 상세보기
	public HotelVO hotel_detail(int hno)
	{
		HotelVO vo = new HotelVO();
		try
		{
			conn =CreateConnection.getConnection();
			String sql ="SELECT hno,name,addr,time,hotel_image,grade,star "
					+ "FROM jj_hotel_1 "
					+ "WHERE hno=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setHno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setAddr(rs.getString(3));
			vo.setTime(rs.getString(4));
			vo.setHotel_image(rs.getString(5));
			vo.setGrade(rs.getString(6));
			vo.setStar(rs.getDouble(7));
			
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
			
		}
		
		return vo;
	}
	//4. 객실 상세보기
	public List<RoomVO> room_detail(int hno)
	{
		List<RoomVO> list = new ArrayList<RoomVO>();
		try
		{
			conn =CreateConnection.getConnection();
			String sql ="SELECT room_no,room_name,room_price,room_image,room_person,room_bed_info,account "
					+ "from jj_room_1 "
					+ "where hno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				RoomVO vo=new RoomVO();
				vo.setRoom_no(rs.getInt(1));
				vo.setRoom_name(rs.getString(2));
				vo.setRoom_price(rs.getString(3));
				vo.setRoom_image(rs.getString(4));
				vo.setRoom_persons(rs.getString(5));
				vo.setRoom_bed_info(rs.getString(6));
				vo.setAccount(rs.getInt(7));
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
	
	//호텔 인기순위
	public List<HotelVO> hotel_rank(){
		List<HotelVO> list= new ArrayList<HotelVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT hno,name,addr,star,hotel_image,RANK "
					+ "FROM (SELECT hno,name,addr,star,hotel_image,ROW_NUMBER() OVER (ORDER BY star DESC) RANK "
					+ "FROM jj_hotel_1 "
					+ "WHERE star is NOT NULL) "
					+ "WHERE RANK BETWEEN 1 AND 3";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HotelVO vo=new HotelVO();
				vo.setHno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddr(rs.getString(3));
				vo.setStar(rs.getDouble(4));
				vo.setHotel_image(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
}
