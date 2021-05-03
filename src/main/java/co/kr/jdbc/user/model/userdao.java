package co.kr.jdbc.user.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class userdao {
	
	private DataSource ds;
	
	private Connection conn= null;
	private PreparedStatement pstmt=null;
	private userdao()
	{
		try{
			Context ct = new InitialContext();///context.xml읽기 위한
			ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
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
		conn= null;
		 pstmt=null;
		int rn=0;
		try {
			conn =ds.getConnection();
			System.out.println(conn+"접속완료");
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
		 conn= null;
		 pstmt=null;
		ResultSet rs=null;
		try {
			conn =ds.getConnection();
			System.out.println(conn+"접속완료");
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

}//database전담 처리 20210502
