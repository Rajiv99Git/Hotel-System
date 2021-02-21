package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class Servlet1
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet1() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("pass");
		String address=request.getParameter("add");
		String mobile=request.getParameter("mobile");
		String gmail=request.getParameter("gmail");
		
		String sql="insert into store values ('"+name+"','"+address+"','"+mobile+"','"+gmail+"','"+password+"')";
		try
		{
		 Class.forName("com.mysql.jdbc.Driver");
		 
		 Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javafsd","root","123456");  

		 Statement st=con.createStatement();

		 int i=st.executeUpdate(sql);
		 System.out.println(i);
		 out.println("Registration has been succesfull");
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
