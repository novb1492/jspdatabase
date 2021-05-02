package co.kr.jdbc.user.model;

import java.sql.*;
import java.util.*;

public class userdao {
	
	private String dbid="root";
	private String dbpwd="6937544";
	private String url="jdbc:mysql://localhost:3306/study_db";
	
	private userdao()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	private static userdao dao=new userdao();
	
	public static userdao getinstance()
	{
		if(dao!=null)
		{
			dao=new userdao();
		}
		return dao;
	}
	public static void join()
	{
		String sql= "insert into users(name,id,pwd,phone1,phone2,phone3,gender)values(?,?,?,?,?,?,?)";
		Connection conn= null;
		PreparedStatement pstmt=null;
		try {
			conn =DriverManager.getConnection(url,dbid,dbpwd);
			p
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
			
}//database전담 처리 20210502
