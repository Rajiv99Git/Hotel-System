package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		boolean temp=false;
		String uname="";
		String pass="";
		
		String sql="select * from store";
		try
		{
		 Class.forName("com.mysql.jdbc.Driver");
		 
		 Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javafsd","root","123456");  
		
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery(sql);
		 while(rs.next()) {
		  uname=rs.getString(1);
		  pass=rs.getString(5);
		  if(name.equalsIgnoreCase(uname) && password.equalsIgnoreCase(pass)) {
			  temp=true;
		  } 
		 }
		 if(temp) {
			 out.println("LoginSuccesfull");
		 }
		 else {
			 
			 out.println("Something wrong");
			 RequestDispatcher rd=request.getRequestDispatcher("LoginServlet");  
			
			  
			rd.include(request, response);
		 }
		
		
		 
		
		}
		 
		 
		
		catch(SQLException e)
		{
		    out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
