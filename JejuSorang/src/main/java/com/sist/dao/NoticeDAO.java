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
					+ "FROM (SELECT /* INDEX_DESC(project_notice pro_no_pk)*/no,type,name,subject,regdate,hit "
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
}
