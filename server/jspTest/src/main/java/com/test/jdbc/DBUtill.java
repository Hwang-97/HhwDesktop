package com.test.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtill {
	
	public static Connection open() {
		
		//1. DB 연결
		Connection conn = null;

		//연결 문자열(Connection String)
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "java1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		      
		    //DB 접속한 정보를 가지고 있는 Connection 객체 생성
		    //conn = new Connection();
		    conn = DriverManager.getConnection(url, id, pw);
		    return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
