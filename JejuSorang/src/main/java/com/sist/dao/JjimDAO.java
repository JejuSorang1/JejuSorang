package com.sist.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
  
import com.sist.vo.JjimVO;

public class JjimDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void jjimInsert(JjimVO vo,int cate_no)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO jj_jjim_1 VALUES("
					+"?,jj_jjim_jno_seq_1.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cate_no);
			ps.setInt(2, vo.getNo());
			ps.setString(3, vo.getId());
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
	// jjim확인
	public int jjimCount(/*int all_cate_no,*/int no,String id)
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM jj_jjim_1 "
					+"WHERE no=? AND id=?"; //all_cate_no=? AND no=?
			ps=conn.prepareStatement(sql);
			//ps.setInt(1, all_cate_no);
			ps.setInt(1, no);
			ps.setString(2, id);
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
	
	public List<JjimVO> jjimListData(String id)
	{
		List<JjimVO> list=new ArrayList<JjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "select /*+ INDEX_DESC(jj_jjim_1 jj_jno_pk_1)*/all_cate_no,jno, no, " // 서브쿼리
                    +"(select distinct name from jj_hotel_1 where hno = jj_jjim_1.no), "
                    +"(select distinct hotel_image from project_food where hno = jj_jjim_1.no), "
                    +"(select distinct addr from project_food where hno = jj_jjim_1.no) "
                    +"from jj_jjim_1 "
                    +"where id=?";
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, id);
		         ResultSet rs=ps.executeQuery();
		         while(rs.next()) {
		            JjimVO vo=new JjimVO();
		            vo.setAll_cate_no(rs.getInt(1));
		            vo.setJno(rs.getInt(2));
		            vo.setNo(rs.getInt(3));
		            vo.setName(rs.getString(4));
		            String hotel_image=rs.getString(5);
		            hotel_image=hotel_image.substring(0,hotel_image.indexOf("^"));
		            hotel_image=hotel_image.replace("#", "&");
		            vo.setHotel_image(hotel_image);
		            vo.setAddr(rs.getString(6));
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
	// 렌트카 jjim 목록 출력
	public List<JjimVO> rent_jjimListData(String id)
	{  
		//rname,rctel,rcaddr
		List<JjimVO> list=new ArrayList<JjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "select /*+ INDEX_DESC(jj_jjim_1 jj_jno_pk)*/all_cate_no,jno, no, " // 서브쿼리
                    +"(select distinct rname from jj_rcom_1 where rcno = jj_jjim_1.no), "
                    +"(select distinct rctel from jj_rcom_1 where rcno = jj_jjim_1.no), "
                    +"(select distinct rcaddr from jj_rcom_1 where rcno = jj_jjim_1.no) "
                    +"from jj_jjim_1 " 
                    +"where id=?";
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, id);
		         ResultSet rs=ps.executeQuery();
		         while(rs.next()) {
		            JjimVO vo=new JjimVO();
		            vo.setAll_cate_no(rs.getInt(1));
		            vo.setJno(rs.getInt(2));
		            vo.setNo(rs.getInt(3));
		            vo.setName(rs.getString(4));
		            vo.setRname(rs.getString(5));
		            vo.setRctel(rs.getString(6));
		            vo.setRcaddr(rs.getString(7));
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
	// jjim 취소 
	 public void jjimDelete(int jno)
	  {
		  try
		   {
			  conn=CreateConnection.getConnection();
			  String sql="DELETE FROM jj_jjim_1 "
					    +"WHERE jno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, jno);
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