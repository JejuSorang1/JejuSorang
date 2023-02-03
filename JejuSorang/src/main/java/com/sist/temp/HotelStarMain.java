package com.sist.temp;
import java.util.*;
import java.sql.*;
public class HotelStarMain {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   
   public HotelStarMain()
   {
      try
      {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      }catch(Exception ex) {}
   }
   public void getConnection()
   {
      try
      {
         conn=DriverManager.getConnection(URL,"hr","happy");
      }catch(Exception ex) {}
   }
   public void disConnection()
   {
      try
      {
         if(ps!=null) ps.close();
         if(conn!=null) conn.close();
      }catch(Exception ex) {}
   }
   public void HotelStarInsert(int hno,double star)
   {
      try
      {
         getConnection();
         String sql="UPDATE jj_hotel_1 SET "
               +"star=? "
               +"WHERE hno=?";
         ps=conn.prepareStatement(sql);
         ps.setDouble(1, star);
         ps.setInt(2, hno);
         ps.executeUpdate();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         disConnection();
      }
   }
   public static void main(String[] args) {
      HotelStarMain hs=new HotelStarMain();
      for(int i=1;i<=287;i++)
      {
         double rand=(double)(Math.random()*2.0)+3.0;
         double rand1=Math.round(rand*10.0)/10.0;
      hs.HotelStarInsert(i, rand1);
         try
         {
            Thread.sleep(30);
         }catch(Exception ex) {}
         System.out.println("i="+i+" "+rand1);
      }
      System.out.println("수량 추가 종료");
   }
}