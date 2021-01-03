package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.entities.Note;
import com.entities.User;
import com.helper.FactoryProvider;

public class SaveNoteServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SaveNoteServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			Note note = new Note(title, content, new Date(),user.getId());
			
			//hibernate save
			Session s = FactoryProvider.getFactory().openSession();
			
			s.beginTransaction();
			s.save(note);
			s.getTransaction().commit();
			
			s.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all Notes</a></h1>");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
