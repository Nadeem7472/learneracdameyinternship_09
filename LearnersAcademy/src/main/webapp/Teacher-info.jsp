<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%
if (session.getAttribute("admin_Email") == null) {
	response.sendRedirect("index.jsp");
}
%>

<%!String userName, password, url, driver;

	PreparedStatement pst;
	ServletContext context;
	Connection con;
	public ResultSet rs;%>

<%
context = config.getServletContext();

userName = context.getInitParameter("userName");
password = context.getInitParameter("password");
url = context.getInitParameter("url");
driver = context.getInitParameter("driver");

con = DriverManager.getConnection(url, userName, password);

try {
	Class.forName(driver);
	pst = con.prepareStatement("select * from LEARNERTEACHERS");
	rs = pst.executeQuery();

}

catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>


<!doctype html>
<html lang="en">
<head>
<title>Teachers</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dashboardsidebar/css/style.css">


<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="TableFixedHeader/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/css/util.css">
<link rel="stylesheet" type="text/css"
	href="TableFixedHeader/css/main.css">
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4">
				<h1>
					<a href="index.html" class="logo">Menu</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li ><a href="adminDashboard.jsp"><span
							class="fa fa-user mr-3"></span>STUDENTS INFO</a></li>
					<li class="active"><a href="Teacher-info.jsp"><span class="fa fa-user-circle-o mr-3"></span>TEACHERS
							INFO</a></li>
					<li><a href="Subject-info.jsp"><span class="fa fa-book mr-3"></span>SUBJECTS
							INFO</a></li>
					<li><a href="Class-info.jsp"><span class="fa fa-sticky-note mr-3"></span>CLASS
							INFO</a></li>
					<li><a href="logout.jsp"><span
							class="fa fa-sign-out mr-3"></span>LOGOUT</a></li>
				</ul>



			</div>


		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100 ver1 m-b-110">
							<div class="table100-head">
								<table>
									<thead>
										<tr class="row100 head">
											<th class="cell100 column1">ID</th>
											<th class="cell100 column2">NAME</th>
											<th class="cell100 column3">EMAIL</th>
											<th class="cell100 column4">SUBJECT</th>
											<th class="cell100 column5">ACTION</th>
										</tr>

									</thead>
								</table>
							</div>

							<div class="table100-body js-pscroll">
								<table>
									<tbody>
										<%
										while (rs.next()) {
										%>
										<tr class="row100 body">
											<td class="cell100 column1"><%=rs.getInt("id")%></td>
											<td class="cell100 column2"><%=rs.getString("Tname")%></td>
											<td class="cell100 column3"><%=rs.getString("Temail")%></td>
											<td class="cell100 column4"><%=rs.getString("Tsubject")%></td>
											<td class="cell100 column5"><a
												href="DeleteTeacher?id=<%=rs.getInt("id")%>">Delete</a></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<h2>
		<a href="addTeacher.jsp"
			style="position: absolute; left: 353px; bottom: 20px; top: 500px">Add
			Teacher</a>
	</h2>
	<script src="dashboardsidebar/js/jquery.min.js"></script>
	<script src="dashboardsidebar/js/popper.js"></script>
	<script src="dashboardsidebar/js/bootstrap.min.js"></script>
	<script src="dashboardsidebar/js/main.js"></script>


	<!-- =========== table Js -->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="TableFixedHeader/vendor/bootstrap/js/popper.js"></script>
	<script src="TableFixedHeader/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="TableFixedHeader/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="TableFixedHeader/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="TableFixedHeader/js/main.js"></script>

</body>
</html>