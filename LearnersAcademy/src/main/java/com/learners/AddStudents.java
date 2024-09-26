package com.learners;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddStudents")
public class AddStudents extends HttpServlet {

	Connection conn;
	ServletContext context;
	String userName,password,url,driver;
	PreparedStatement pst;

	@Override
	public void init(ServletConfig config) throws ServletException {


		context = config.getServletContext();

		userName = context.getInitParameter("userName");
		password  = context.getInitParameter("password");
		url = context.getInitParameter("url");
		driver = context.getInitParameter("driver");

		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, userName, password);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		String stuName = request.getParameter("stuname");
		String stuEmail = request.getParameter("stuemail");
		String stuSubject = request.getParameter("stusubject");
		
		//String sequence = "learnersId.nextVal";
		
		try {
			
			
			String INSERT_USERS_SQL = "INSERT INTO LEARNERSTUDENTS" + "  (ID,NAME,EMAIL,SUBJECT) VALUES "
					+ " (learnersId.nextVal,?,?,?)";
			
			pst = 	conn.prepareStatement(INSERT_USERS_SQL);
			
			pst.setString(1,stuName);
			pst.setString(2,stuEmail);
			pst.setString(3,stuSubject);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next())
			{
				response.getWriter().write("<script>alert('Record Inserted');"
						+ "window.location.href='adminDashboard.jsp';</script>");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
