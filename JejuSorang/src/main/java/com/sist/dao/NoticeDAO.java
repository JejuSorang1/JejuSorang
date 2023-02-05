package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.NoticeVO;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//footer에 저장
	public List<NoticeVO> noticeTop5(){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT no,name,subject,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),rownum "
					+ "FROM (SELECT no,name,subject,regdate "
					+ "FROM jj_notice_1 ORDER BY hit DESC) "
					+ "WHERE rownum<=5";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				NoticeVO vo=new NoticeVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	public List<NoticeVO> noticeListData(int page){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT no,type,name,subject,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),hit,num "
					+ "FROM (SELECT no,type,name,subject,regdate,hit,rownum as num "
					+ "FROM (SELECT /* INDEX_DESC(jj_notice_1 jj_notice_no_pk_1)*/no,type,name,subject,regdate,hit "
					+ "FROM jj_notice_1)) "
					+ "WHERE rownum BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				NoticeVO vo=new NoticeVO();
				vo.setNo(rs.getInt(1));
				vo.setType(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setSubject(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	public int noticeTotalPage() {
		int total=0;
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM jj_notice_1";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			CreateConnection.disConnection(conn, ps);
		}
		return total;
	}
	
	public void noticeInsert(NoticeVO vo)
	   {
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="INSERT INTO jj_notice_1 VALUES("
	               +"jj_notice_seq_1.nextval,?,?,?,?,SYSDATE,0)";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, vo.getType());
	         ps.setString(2, vo.getName());
	         ps.setString(3, vo.getSubject());
	         ps.setString(4, vo.getContent());
	         ps.executeUpdate(); //commit()
	         
	      }catch(Exception ex)
	      {
	         ex.printStackTrace();
	      }
	      finally
	      {
	         CreateConnection.disConnection(conn, ps);
	      }
	   }
	   public void noticeDelete(int no)
	   {
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="DELETE FROM jj_notice_1 "
	               +"WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
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
	   public NoticeVO noticeUpdateData(int no)
	   {
	      NoticeVO vo=new NoticeVO();
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT no,name,subject,content,type "
	               +"FROM jj_notice_1 "
	               +"WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         vo.setNo(rs.getInt(1));
	         vo.setName(rs.getString(2));
	         vo.setSubject(rs.getString(3));
	         vo.setContent(rs.getString(4));
	         vo.setType(rs.getInt(5));
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
	   
	   public void noticeUpdate(NoticeVO vo) {
		   try {
			   conn=CreateConnection.getConnection();
			   String sql="UPDATE jj_notice_1 SET "
			   		+ "type=?,subject=?,content=? "
			   		+ "WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getType());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getNo());
			   ps.executeUpdate();
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	   
	   public NoticeVO noticeDetailData(int no)
	   {
	      NoticeVO vo=new NoticeVO();
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="UPDATE jj_notice_1 SET "
	         		+ "hit=hit+1 "
	         		+ "WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
	         ps.executeUpdate();
	         
	         sql="SELECT no,name,subject,content,type,hit,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
	               +"FROM jj_notice_1 "
	               +"WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         vo.setNo(rs.getInt(1));
	         vo.setName(rs.getString(2));
	         vo.setSubject(rs.getString(3));
	         vo.setContent(rs.getString(4));
	         vo.setType(rs.getInt(5));
	         vo.setHit(rs.getInt(6));
	         vo.setDbday(rs.getString(7));
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
