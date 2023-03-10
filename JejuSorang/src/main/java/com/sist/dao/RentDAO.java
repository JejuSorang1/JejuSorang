package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;


public class RentDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	
	  //전체 리스트
	   public List<CarVO> CarListData(int page,String ss)
	   {
	      List<CarVO> list=new ArrayList<CarVO>();
	      try {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT car_no,car_name,car_image,car_price,car_option1,car_type,num "
	                 +"FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type,rownum as num "
	                 +"FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type "
	                 +"FROM jj_car_1 "
	                 +"WHERE car_name LIKE '%'||?||'%')) "
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
	               CarVO vo=new CarVO();
	               vo.setCar_no(rs.getInt(1));
	               vo.setCar_name(rs.getString(2));
	               vo.setCar_image(rs.getString(3));
	               vo.setCar_price(rs.getString(4));
	               vo.setCar_option1(rs.getString(5));
	               vo.setCar_type(rs.getString(6));
	               list.add(vo);
	            }
	            rs.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return list;         
	   }
	    public int RentAllTotalPage()
	      {
	         int total=0;
	         try
	         {
	            conn=CreateConnection.getConnection();
	            String sql="SELECT CEIL(COUNT(*)/20.0) FROM jj_car_1";
	            ps=conn.prepareStatement(sql);
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
	   // 검색 
	    public ArrayList<CarVO> RentSearchData(int page,String ss)
	      {
	         ArrayList<CarVO> list=new ArrayList<CarVO>();
	         try
	         {
	            conn=CreateConnection.getConnection();
	            String sql="SELECT car_no,car_name,car_image,car_price,car_option1,car_type,num "
	                    +    "FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type,rownum as num "
	                    +	  	     "FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type "
	                    +                    "FROM jj_car_1 "
	                    +                   "WHERE car_name LIKE '%'||?||'%')) "
	                    +           "WHERE num BETWEEN ? AND ?";
	            
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
	               CarVO vo=new CarVO();
	               vo.setCar_no(rs.getInt(1));
	               vo.setCar_name(rs.getString(2));
	               vo.setCar_image(rs.getString(3));
	               vo.setCar_price(rs.getString(4));
	               vo.setCar_option1(rs.getString(5));
	               vo.setCar_type(rs.getString(6));
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
	    public int RentSearchTotalPage(String ss)
	      {
	         int total=0;
	         try
	         {
	            conn=CreateConnection.getConnection();
	            String sql="SELECT CEIL(COUNT(*)/20.0) FROM jj_car_1 "
	                   +"WHERE car_name LIKE '%'||?||'%'";
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
	   //등급검색
	    public ArrayList<CarVO> CarTypeSearchData(int page,String typeVal)
	    {
	       ArrayList<CarVO> list=new ArrayList<CarVO>();
	       try
	       {  
	    	   
	          String[] typeList = typeVal.split(",");
	          conn=CreateConnection.getConnection();
	          String sql="SELECT car_no,car_name,car_image,car_price,car_option1,car_type,num "
	                  +    "FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type,rownum as num "
	                  +	  	     "FROM (SELECT car_no,car_name,car_image,car_price,car_option1,car_type "
	                  +                    "FROM jj_car_1 "
	                  +                   "WHERE ";
	          //체크박스 리스트
	          for(var i=0; i<typeList.length; i++) {
	        	  sql += "car_type LIKE '" + typeList[i] + "%'" + " OR ";
	          };
	          
	          sql = sql.substring(0, sql.length() - 4);
	          sql += "))";
	          sql += "WHERE num BETWEEN ? AND ?";
	          
	          
	          ps=conn.prepareStatement(sql);
	          int rowSize=20;
	          int start=(rowSize*page)-(rowSize-1);
	          int end=rowSize*page;
	          ps.setInt(1, start);
	          ps.setInt(2, end);
	          ResultSet rs=ps.executeQuery();
	          while(rs.next())
	          {
	             CarVO vo=new CarVO();
	             vo.setCar_no(rs.getInt(1));
	             vo.setCar_name(rs.getString(2));
	             vo.setCar_image(rs.getString(3));
	             vo.setCar_price(rs.getString(4));
	             vo.setCar_option1(rs.getString(5));
	             vo.setCar_type(rs.getString(6));
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
	   //등급 페이지
	    public int CarTypeTotalPage(String typeVal)
	    {
	       int total=0;
	       try
	       {
	    	  String[] typeList = typeVal.split(",");
	          conn=CreateConnection.getConnection();
	          String sql="SELECT CEIL(COUNT(*)/20.0) FROM jj_car_1 "
	                 +"WHERE ";
	          
	          //체크박스 리스트 
	          for(var i=0; i<typeList.length; i++) {
	        	  sql += "car_type LIKE '" + typeList[i] + "%'" + " OR ";
	          };
	          
	          sql = sql.substring(0, sql.length() - 4);
	          
	          ps=conn.prepareStatement(sql);
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
	//렌트카 상세보기
	 public CarVO car_detail(int car_no)
     {
        CarVO vo=new CarVO();
        try
        {
           conn=CreateConnection.getConnection();
           String sql="SELECT car_no,rcno,account,car_name,car_image,car_price,car_option1,car_option2,"
                     +"(SELECT DISTINCT rname FROM jj_rcom_1 WHERE rcno=jj_car_1.rcno),"
                     +"(SELECT DISTINCT rctel FROM jj_rcom_1 WHERE rcno=jj_car_1.rcno),"
                     +"(SELECT DISTINCT rcaddr FROM jj_rcom_1 WHERE rcno=jj_car_1.rcno),"
                     +"(SELECT DISTINCT star FROM jj_rcom_1 WHERE rcno=jj_car_1.rcno) "
                     + "FROM jj_car_1 "
                    + "WHERE car_no=?";
           ps=conn.prepareStatement(sql);
           ps.setInt(1, car_no);
           ResultSet rs=ps.executeQuery();
           rs.next();
              vo.setCar_no(rs.getInt(1));
              vo.setRcno(rs.getInt(2));
              vo.setAccount(rs.getInt(3));
              vo.setCar_name(rs.getString(4));
              vo.setCar_image(rs.getString(5));
              vo.setCar_price(rs.getString(6));
              vo.setCar_option1(rs.getString(7));
              vo.setCar_option2(rs.getString(8));
              vo.setRname(rs.getString(9));
              vo.setRctel(rs.getString(10));
              vo.setRcaddr(rs.getString(11));
              vo.setStar(rs.getDouble(12));
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

	
	 	 
	
	
	
	//렌트카 순위
	public List<CarVO> car_rank(){
		List<CarVO> list=new ArrayList<CarVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT car_no,car_name,car_price,car_image,car_option1,price,rank "
					+ "FROM (SELECT car_no,car_name,car_price,car_image,car_option1,price,ROW_NUMBER() OVER (ORDER BY price ASC) as rank "
					+ "FROM (SELECT car_no,car_name,car_price,car_image,car_option1,TO_NUMBER(REPLACE(car_price,',')) as price "
					+ "FROM jj_car_1)) "
					+ "WHERE RANK BETWEEN 1 AND 3";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CarVO vo=new CarVO();
				vo.setCar_no(rs.getInt(1));
				vo.setCar_name(rs.getString(2));
				vo.setCar_price(rs.getString(3));
				vo.setCar_image(rs.getString(4));
				vo.setCar_option1(rs.getString(5));
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