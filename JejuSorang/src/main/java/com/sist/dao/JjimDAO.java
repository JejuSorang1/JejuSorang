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
	
	public List<JjimVO> jjimHotelListData(String id)
	{
		List<JjimVO> list=new ArrayList<JjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "select /*+ INDEX_DESC(jj_jjim_1 jj_jno_pk_1)*/all_cate_no,jno, no, " // 서브쿼리
                    +"(select distinct name from jj_hotel_1 where hno = jj_jjim_1.no), "
                    +"(select distinct hotel_image from jj_hotel_1 where hno = jj_jjim_1.no) "
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
		            vo.setHotel_image(rs.getString(5));
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
	
	public int hotelJjimCount(int hno) //호텔
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM jj_jjim_1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hno);
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
	public int rentJjimCount(int car_no)
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM jj_jjim_1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, car_no);
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
	public int locJjimCount(int lno) //관광지
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM jj_jjim_1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, lno);
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
	// 렌트카 jjim 목록 출력
	public List<JjimVO> jjimRentListData(String id)
	{  
		
		List<JjimVO> list=new ArrayList<JjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "select /*+ INDEX_DESC(jj_jjim_1 jj_jno_pk_1)*/all_cate_no,jno, no, " // 서브쿼리
                    +"(select distinct car_name from jj_car_1 where car_no = jj_jjim_1.no), "
                    +"(select distinct car_image from jj_car_1 where car_no = jj_jjim_1.no) "
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
		            vo.setCar_name(rs.getString(4));
		            vo.setCar_image(rs.getString(5));
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