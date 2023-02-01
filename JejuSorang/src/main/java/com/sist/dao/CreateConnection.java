package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
//DAO마다 사용 => 공통으로 사용되는 부분은 클래스화 => 공통모듈
public class CreateConnection {
    private static Connection conn;
    public static Connection getConnection() {
    	try {
    		Context init=new InitialContext();
    		Context c=(Context)init.lookup("java://comp/env");
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		conn=ds.getConnection();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return conn;
    }
    
    public static void disConnection(Connection conn,PreparedStatement ps) {
    	try {
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
}
