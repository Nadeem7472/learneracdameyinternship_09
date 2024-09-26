package com.learners;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteSubject
 */
@WebServlet("/DeleteSubject")
public class DeleteSubject extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	Connection con;
	PreparedStatement pst;
	
	ServletContext context;
	String userName,password,url,driver;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		context = config.getServletContext();
		userName = context.getInitParameter("userName");
		password = context.getInitParameter("password");
		url = context.getInitParameter("url");
		driver = context.getInitParameter("driver");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userName, password);
			//System.out.println(con);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			pst = con.prepareStatement("delete from LEARNERSUBJECTS where id=?");
			
			pst.setInt(1,id);
			
			ResultSet rs=  pst.executeQuery();
			
			if(rs.next())
			{
				response.sendRedirect("Subject-info.jsp");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
