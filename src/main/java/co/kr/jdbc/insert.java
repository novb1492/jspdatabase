package co.kr.jdbc;

import java.sql.*;

public class insert {

	public static void main(String[] args) {
		String id="root";
		String pwd="6937544";
		String url="jdbc:mysql://localhost:3306/study_db";
		Connection conn=null;
		Statement stmt=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection(url, id, pwd);///��¥ php �����ξ� ¥������ ����
		System.out.println(conn+"���ӿϷ�");
		stmt=conn.createStatement();
		String sql="INSERT INTO member(id,pwd,name,position)VAlUES('ki93dsdds','1234ddsdsd','junddss','midsddsdd')";
		int a=stmt.executeUpdate(sql);
		if(a==1)
		{
			System.out.println("����");
		}
		else
		{
			System.out.println("����");
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
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}

}
