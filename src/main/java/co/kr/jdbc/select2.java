package co.kr.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class select2 {

	public static void main(String[] args) {
		String id="root";
		String pwd="6937544";
		String url="jdbc:mysql://localhost:3306/study_db";
		Scanner sc=new Scanner(System.in);
		String input=sc.next();
		String sql="SELECT * FROM member  where id='"+input+"'";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;////////select������20210427
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 conn=DriverManager.getConnection(url, id, pwd);///��¥ php �����ξ� ¥������ ����
			System.out.println(conn+"���ӿϷ�");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);////////select������20210427������ ���������� �������� ����
		if(rs.next()) {
			String iid=rs.getString("id");
			String ppwd=rs.getString("pwd");
			String name=rs.getString("name");
			String position=rs.getString("position");
			System.out.println("���̵�"+iid+ppwd+name+position);
			}
		else
		{
			System.out.println("�������� �ʴ�ȸ������");
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
