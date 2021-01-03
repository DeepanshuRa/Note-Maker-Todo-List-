<%@page errorPage="error.jsp" %>

<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit your Note</h1>
		<br>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note) s.get(Note.class, noteId);
			s.close();
		%>

		<!-- this is add form -->
		<form action="UpdateServlet" method="post">
		
			<input value="<%= note.getId() %>" name="noteId" type="hidden" />
		
			<div class="form-group">
				<label for="title">Note Title</label> <input type="text"
					class="form-control" id="title" name="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%= note.getTitle() %>"
					 required>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea class="form-control" name="content" style="height: 300px;"
					id="content" placeholder="Enter your content here" required><%= note.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>

	</div>
</body>
</html>