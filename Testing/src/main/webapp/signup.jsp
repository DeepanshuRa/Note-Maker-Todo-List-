<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		
		<br>
		<div class="container m-3">
		<form action="SignUpServlet" method="post">
		<div class="form-group">
				<label for="name">Full Name</label> <input
					type="text" class="form-control" id="name" name="name"
					aria-describedby="emailHelp" placeholder="Enter name">
			</div>
			<div class="form-group">
				<label for="email">Email address</label> <input
					type="email" class="form-control" id="email" name="email"
					aria-describedby="emailHelp" placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="Password">
			</div>
			
			<button type="submit" class="btn btn-primary">Sign Up</button>
		</form>
		</div>
	</div>
</body>
</html>