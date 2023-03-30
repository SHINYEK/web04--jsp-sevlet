package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;

/**
 * Servlet implementation class UserSevlet
 */
@WebServlet(value= {"/login","/logout"})
public class UserSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO dao = new UserDAO();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/home.jsp");
		HttpSession session = request.getSession();
		switch(request.getServletPath()) {
		case "/login":
			request.setAttribute("pageName", "/users/login.jsp");
			dis.forward(request, response);
			break;
			
		case "/logout":
			session.invalidate();
			response.sendRedirect("/posts");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		switch(request.getServletPath()) {
		case "/login":
			String uid = request.getParameter("uid");
			String upass = request.getParameter("upass");
			HttpSession session = request.getSession();
			UserVO vo = dao.read(uid);
			int result = 0;
			if(vo.getUid()!=null) {
				if(vo.getUpass().equals(upass)) {
					result = 1;
					session.setAttribute("uid", uid);
					session.setAttribute("uname", vo.getUname());
				}else {
					result = 2;
				}
			}
			out.println(result);
			break;
	
		}
	}

}
