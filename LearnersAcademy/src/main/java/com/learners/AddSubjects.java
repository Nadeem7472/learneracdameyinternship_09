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
 * Servlet implementation class AddSubjects
 */
@WebServlet("/AddSubjects")
public class AddSubjects extends HttpServlet {
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



		String subName = request.getParameter("subName");
		String subTime = request.getParameter("time");
		
		//String sequence = "learnersId.nextVal";
		
		try {
			
			
			String INSERT_USERS_SQL = "INSERT INTO LEARNERSUBJECTS" + "  (ID,SNAME,TIME) VALUES "
					+ " (learnersId.nextVal,?,?)";
			
			pst = 	conn.prepareStatement(INSERT_USERS_SQL);
			
			pst.setString(1,subName);
			pst.setString(2,subTime);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next())
			{
				response.getWriter().write("<script>alert('Record Inserted');"
						+ "window.location.href='Subject-info.jsp';</script>");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
