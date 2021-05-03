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
	public int join(uservo users)
	{
		String sql= "insert into users(name,id,pwd,phone1,phone2,phone3,gender)values(?,?,?,?,?,?,?)";
		Connection conn= null;
		PreparedStatement pstmt=null;
		int rn=0;
		try {
			conn =DriverManager.getConnection(url,dbid,dbpwd);
			System.out.println(conn+"立加肯丰");
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getId());
			pstmt.setString(3, users.getPwd());
			pstmt.setString(4, users.getPhone1());
			pstmt.setString(5, users.getPhone2());
			pstmt.setString(6, users.getPhone3());
			pstmt.setString(7, users.getGender());
			System.out.println(pstmt);
			rn=	pstmt.executeUpdate();
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
		return rn;
	}
	public ArrayList<uservo>select(String id,String pwd)
	{
		ArrayList<uservo>array=new ArrayList<uservo>();
		String sql= "select *from users where id=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn =DriverManager.getConnection(url,dbid,dbpwd);
			System.out.println(conn+"立加肯丰");
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(pstmt);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("pwd").equals(pwd))
				{	
				uservo users =new uservo(rs.getString("name"),id,pwd,rs.getString("phone1"),rs.getString("phone2"),rs.getString("phone3"),rs.getString("gender"));
				array.add(users);
				System.out.println(array);
				}
				else
				{
					array.add(null);
				}
			}
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
		return array;
	}

}//database傈淬 贸府 20210502
