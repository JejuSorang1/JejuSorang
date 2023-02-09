package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class AllReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	/*
	 * ALL_REVIEW_NO NOT NULL NUMBER 
	 * ID VARCHAR2(20) 
	 * CATE_NO NOT NULL NUMBER
	 * DETAIL_NO NOT NULL NUMBER 
	 * MSG NOT NULL CLOB 
	 * REGDATE NOT NULL DATE 
	 * STAR NUMBER
	 */
	
	 // 댓글 올리기
	  public void allReviewInsert(AllReviewVO vo) { //jar_all_review_no_seq
	  try {
	        conn=CreateConnection.getConnection(); 
	        String sql="INSERT INTO jj_all_review_1 VALUES(jar_all_review_no_seq.nextval,?,?,?,?,SYSDATE,?)";
	        ps=conn.prepareStatement(sql); 
	        ps.setString(1, vo.getId()); 
	        ps.setInt(2,vo.getCate_no());
	        ps.setInt(3, vo.getDetail_no()); 
	        ps.setString(4, vo.getMsg());
	        ps.setInt(5, vo.getStar()); 
	        ps.executeUpdate(); 
	        }catch(Exception ex) 
	        {
	          ex.printStackTrace();
	        } finally 
	        { 
	          CreateConnection.disConnection(conn, ps); 
	        }
	  }
	  
		/*
		 * ALL_REVIEW_NO NOT NULL NUMBER 
		 * ID VARCHAR2(20) 
		 * CATE_NO NOT NULL NUMBER
		 * DETAIL_NO NOT NULL NUMBER 
		 * MSG NOT NULL CLOB 
		 * REGDATE NOT NULL DATE 
		 * STAR NUMBER
		 */
	 
	 // 2. 댓글 목록
	  public List<AllReviewVO> allReviewListData(int detail_no,int cate_no) {
	  

	  List<AllReviewVO> list=new ArrayList<AllReviewVO>(); 
	  try {
	        conn=CreateConnection.getConnection(); 
	        String sql="SELECT all_review_no,id,cate_no,detail_no,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
	                  +"FROM jj_all_review_1 " 
	                  +"WHERE detail_no=? AND cate_no=?" 
	                  +"ORDER BY all_review_no DESC";
	        ps=conn.prepareStatement(sql); 
	        ps.setInt(1, detail_no);
	        ps.setInt(2, cate_no);
	        
	        ResultSet rs=ps.executeQuery(); 
	        while(rs.next()) 
	        { 
	          AllReviewVO vo=new AllReviewVO(); 
	          vo.setAll_review_no(rs.getInt(1)); 
	          vo.setId(rs.getString(2));
	          vo.setCate_no(rs.getInt(3)); 
	          vo.setDetail_no(rs.getInt(4));
	          vo.setMsg(rs.getString(5));
	          vo.setDbday(rs.getString(6));
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
	  
	  //삭제 
	  public void allReviewDelete(int all_review_no) { 
	   try 
	   {
	     conn=CreateConnection.getConnection(); 
	     String sql="DELETE FROM jj_all_review_1 " 
	               +"WHERE all_review_no=?";
	     ps=conn.prepareStatement(sql); 
	     ps.setInt(1, all_review_no); 
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
	  // 수정 
	  public void allReplyUpdate(int all_review_no,String msg) { 
	  try 
	  {
	    conn=CreateConnection.getConnection(); 
	    String sql="UPDATE jj_all_review_1 SET " 
	              +"msg=? " 
	              +"WHERE all_review_no=?";
	    ps=conn.prepareStatement(sql); 
	    ps.setString(1, msg); 
	    ps.setInt(2, all_review_no);
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

	// 수정 
	  public void allReviewUpdate(int all_review_no,String msg)
	  {
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="UPDATE jj_all_review_1 SET "
					    +"msg=? "
					    +"WHERE all_review_no=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, msg);
			  ps.setInt(2, all_review_no);
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