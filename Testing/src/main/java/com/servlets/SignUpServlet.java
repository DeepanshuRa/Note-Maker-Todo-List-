package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.entities.User;
import com.helper.FactoryProvider;

public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			User user = new User(name, email, password);
			
			Session s = FactoryProvider.getFactory().openSession();
			
			s.beginTransaction();
			
			s.save(user);
			s.getTransaction().commit();
			s.close();
			
			response.sendRedirect("login.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
