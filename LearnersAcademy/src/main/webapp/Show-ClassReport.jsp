<%@page import="java.sql.Statement"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
if (session.getAttribute("admin_Email") == null) {
	response.sendRedirect("index.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add Students</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="colorlib-regform-7/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Class Report</h2>
						<form method="post" class="register-form" id="register-form" action="Class-info.jsp">
							<div class="form-group">
								<label for="name"><i
									class="fa fa-book"></i></label> <input
									type="text" name="subName" id="name" placeholder="Subject Name" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="add" id="signup" class="form-submit"
									value="Show" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="colorlib-regform-7/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="adminDashboard.jsp" class="signup-image-link">Go To
							Dashboard</a>
					</div>
				</div>
			</div>
		</section>



	</div>

	<!-- JS -->
	<script src="colorlib-regform-7/vendor/jquery/jquery.min.js"></script>
	<script src="colorlib-regform-7/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
