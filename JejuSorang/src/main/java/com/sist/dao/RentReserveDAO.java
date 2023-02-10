package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class RentReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	public void rentreserveOk(RentReserveVO vo)
	  {
		/*  예약정보 저장
		 *  ID                  VARCHAR2(20) 
			RRNO       NOT NULL NUMBER       
			RPRICE     NOT NULL NUMBER       
			RPYCHECK            CHAR(1)      
			CAR_NO              NUMBER       
			START_RENT          VARCHAR2(20) 
			END_RENT            VARCHAR2(20) 

		 */
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="INSERT INTO jj_rent_reserve_1 VALUES("
					    +"?,(SELECT NVL(MAX(rrno)+1,1) FROM jj_rent_reserve_1),?,'N',?,?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getId());
			  ps.setInt(2, vo.getRprice());
			  ps.setInt(3, vo.getCar_no());
			  ps.setString(4, vo.getStart_rent());
			  ps.setString(5, vo.getEnd_rent());
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
	// 예약 정보를 마이페이지에서 읽기
	  public List<RentReserveVO> rentreserveMyPageData(String id)
	  {
		  List<RentReserveVO> list=new ArrayList<RentReserveVO>();
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="SELECT rrno,r.car_no,start_rent,end_rent,car_name,car_image,rprice,car_option1,rpycheck "
					    +"FROM jj_car_1 c,jj_rent_reserve_1 r "
					    +"WHERE c.car_no=r.car_no "
					    +"AND id=? "
					    +"ORDER BY rrno DESC";
			  
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				RentReserveVO  vo= new RentReserveVO();
				vo.setRrno(rs.getInt(1));
				vo.setCar_no(rs.getInt(2));
				vo.setStart_rent(rs.getString(3));
				vo.setEnd_rent(rs.getString(4));
				vo.getCvo().setCar_name(rs.getString(5));
				vo.getCvo().setCar_image(rs.getString(6));
				vo.setRprice(rs.getInt(7));
				vo.getCvo().setCar_option1(rs.getString(8));
				vo.setRpycheck(rs.getString(9));
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
	  public List<RentReserveVO> rentreserveAdminPageData()
	  {
		  List<RentReserveVO> list=new ArrayList<RentReserveVO>();
		  
		  try {  
			  conn=CreateConnection.getConnection();
			  String sql="SELECT rrno,r.car_no,start_rent,end_rent,car_name,car_image,rprice,car_option1,rpycheck,id "
					    +"FROM jj_car_1 c,jj_rent_reserve_1 r "
					    +"WHERE c.car_no=r.car_no "
					    +"ORDER BY rrno DESC";
			  
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				RentReserveVO  vo= new RentReserveVO();
				vo.setRrno(rs.getInt(1));
				vo.getCvo().setCar_no(rs.getInt(2));
				vo.setStart_rent(rs.getString(3));
				vo.setEnd_rent(rs.getString(4));
				vo.getCvo().setCar_name(rs.getString(5));
				vo.getCvo().setCar_image(rs.getString(6));
				vo.setRprice(rs.getInt(7));
				vo.getCvo().setCar_option1(rs.getString(8));
				vo.setRpycheck(rs.getString(9));
				vo.setId(rs.getString(10));
				list.add(vo);
			  }
			  rs.close();
		  
		  }
			
		  catch (Exception e) {
			e.printStackTrace();
	      }finally {
	    	  CreateConnection.disConnection(conn, ps);
	         }
		  return list;
         }
	  //에약승인
	  public void rentreserveAdminOk(int rrno)
	  {
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="UPDATE jj_rent_reserve_1 SET "
					    +"rpycheck='Y' "
					    +"WHERE rrno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, rrno);
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
	  public RentReserveVO rentmypageReserveInfo(int rrno)
	  {
		  RentReserveVO vo=new RentReserveVO();
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="SELECT rrno,r.car_no,start_rent,end_rent,car_name,car_image,rprice,car_option1 "
					    +"FROM jj_car_1 c,jj_rent_reserve_1 r "
					    +"WHERE c.car_no=r.car_no "
					    +"AND rrno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, rrno);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
				vo.setRrno(rs.getInt(1));
				vo.getCvo().setCar_no(rs.getInt(2));
				vo.setStart_rent(rs.getString(3));
				vo.setEnd_rent(rs.getString(4));
				vo.getCvo().setCar_name(rs.getString(5));
				vo.getCvo().setCar_image(rs.getString(6));
				vo.setRprice(rs.getInt(7));
				vo.getCvo().setCar_option1(rs.getString(8));
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
	  public void renteserveDelete(int rrno)
	  {
		  try
		  {
			  conn=CreateConnection.getConnection();
			  String sql="DELETE FROM jj_rent_reserve_1 "
					    +"WHERE rrno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, rrno);
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



