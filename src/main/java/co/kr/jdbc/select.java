package co.kr.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class select {

	public static void main(String[] args) {
		String id="root";
		String pwd="6937544";
		String url="jdbc:mysql://localhost:3306/study_db";
		String sql="SELECT *FROM 'member'";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;////////select에서만20210427
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 conn=DriverManager.getConnection(url, id, pwd);///진짜 php 보다훨씬 짜증난다 ㅋㅋ
			System.out.println(conn+"접속완료");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);////////select에서만20210427이유는 여러정보를 가져오기 때문
			while(rs.next())///행이있으면 true반환
			{
			String iid=rs.getString("id");
			String ppwd=rs.getString("pwd");
			String name=rs.getString("name");
			String postion=rs.getString("position");
			System.out.println(iid);
			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally {
				try {
					conn.close();
					stmt.cancel();
					rs.close();
					
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
	}

}
