<%@page errorPage="error.jsp"%>

<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>

<%@include file="all_js_css.jsp" %>
</head>
<body>

	<%
		User user = (User)request.getSession().getAttribute("user");
	
		if(user == null){
			response.sendRedirect("login.jsp");
		}
	%>


	<div class="container">
		<%@include file="navbar.jsp" %>
		<br>
		<h2>Please fill your note detail</h2>
		<br>

		<!-- this is add form -->
		<form action="SaveNoteServlets" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input
					type="text" class="form-control" id="title"
					name="title"
					aria-describedby="emailHelp" placeholder="Enter here" required>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea class="form-control"
				name = "content"
				style="height: 300px;"
				id="content" placeholder="Enter your content here" required></textarea>
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>