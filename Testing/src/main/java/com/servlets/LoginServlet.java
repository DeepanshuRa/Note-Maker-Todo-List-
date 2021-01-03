package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.*;
import org.hibernate.Session;

import com.entities.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Session s = FactoryProvider.getFactory().openSession();
		
		Query q = s.createQuery("from User where email=:x and password=:y");
		q.setParameter("x",email);
		q.setParameter("y",password);
		
		User user = (User)q.uniqueResult();
		
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		response.sendRedirect("add_notes.jsp");
		
		s.close();
		
		
	}

}
