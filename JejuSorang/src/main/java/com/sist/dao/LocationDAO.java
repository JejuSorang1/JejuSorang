package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
/*
 * 	LNO       NOT NULL NUMBER        
	SIGUN     NOT NULL VARCHAR2(30)  
	DONG      NOT NULL VARCHAR2(30)  
	LI        NOT NULL VARCHAR2(30)  
	TITLE     NOT NULL VARCHAR2(100) 
	TYPE      NOT NULL VARCHAR2(30)  
	ADDR_DORO          VARCHAR2(500) 
	ADDR_JI   NOT NULL VARCHAR2(500) 
	INFO      NOT NULL CLOB          
	CLOSE              VARCHAR2(70)  
	TIME               VARCHAR2(200) 
	PRICE              CLOB          
	PURPOSE            VARCHAR2(100) 
	FACIL              VARCHAR2(300) 
	MANAGER            VARCHAR2(100) 
	TEL                VARCHAR2(50)  
	JL_JJIM            NUMBER        
	JL_LIKE            NUMBER
 */
public class LocationDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public ArrayList<LocationVO> LocationFindData(int lno,String ss)
	   {
		   ArrayList<LocationVO> list=new ArrayList<LocationVO>();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT lno,sigun,dong,li,title,type,addr_doro,addr_ji,info,close,time,price,purpose,facil,manager,tel,jl_jjim,jl_like "
					     +"FROM (SELECT lno,sigun,dong,li,title,type,addr_doro,addr_ji,info,close,time,price,purpose,facil,manager,tel,jl_jjim,jl_like "
					     +"FROM jj_location_1 "
					     +"WHERE type LIKE '%'||?||'%')) "
					     +"WHERE lno=?";
			   // 인라인뷰 => Top-N만 가능 
			   // 인기순위 5개 
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, ss);
			   ps.setInt(2, lno);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   LocationVO vo=new LocationVO();
				   vo.setLno(rs.getInt(1));
				   vo.setSigun(rs.getString(2));
				   vo.setDong(rs.getString(3));
				   vo.setLi(rs.getString(4));
				   vo.setTitle(rs.getString(5));
				   vo.setType(rs.getString(6));
				   vo.setAddr_doro(rs.getString(7));
				   vo.setAddr_ji(rs.getString(8));
				   vo.setInfo(rs.getString(9));
				   vo.setClose(rs.getString(10));
				   vo.setTime(rs.getString(11));
				   vo.setPrice(rs.getString(12));
				   vo.setPurpose(rs.getString(13));
				   vo.setFacil(rs.getString(14));
				   vo.setManager(rs.getString(15));
				   vo.setTel(rs.getString(16));
				   vo.setJl_jjim(rs.getInt(17));
				   vo.setJl_like(rs.getInt(18));
				   
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

	   public LocationVO location_detail(int lno)
	   {
		   LocationVO vo=new LocationVO();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT lno,sigun,dong,li,title,type,addr_doro,addr_ji,info,close,time,price,purpose,facil,manager,tel,jl_jjim,jl_like "
					   +"FROM jj_location_1 "
					   +"WHERE lno=?"; 
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, lno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setLno(rs.getInt(1));
			   vo.setSigun(rs.getString(2));
			   vo.setDong(rs.getString(3));
			   vo.setLi(rs.getString(4));
			   vo.setTitle(rs.getString(5));
			   vo.setType(rs.getString(6));
			   vo.setAddr_doro(rs.getString(7));
			   vo.setAddr_ji(rs.getString(8));
			   vo.setInfo(rs.getString(9));
			   vo.setClose(rs.getString(10));
			   vo.setTime(rs.getString(11));
			   vo.setPrice(rs.getString(12));
			   vo.setPurpose(rs.getString(13));
			   vo.setFacil(rs.getString(14));
			   vo.setManager(rs.getString(15));
			   vo.setTel(rs.getString(16));
			   vo.setJl_jjim(rs.getInt(17));
			   vo.setJl_like(rs.getInt(18));
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
}