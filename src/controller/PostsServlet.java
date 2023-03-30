package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.CommentDAO;
import model.CommentVO;
import model.PostDAO;
import model.PostVO;



@WebServlet(value={"/posts","/posts/insert","/posts.json","/posts/read","/posts/delete","/posts/update", "/comments.json", "/comments/insert", "/comments/delete"})
public class PostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		PostDAO dao = new PostDAO();
		CommentDAO cdao = new CommentDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher dis = request.getRequestDispatcher("/home.jsp");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		switch(request.getServletPath()) {
		case "/posts":
			request.setAttribute("pageName", "/posts/list.jsp");
			dis.forward(request, response);
			break;
			
		case "/posts.json":
			int page = Integer.parseInt(request.getParameter("page"));
			int pageSize = Integer.parseInt(request.getParameter("pageSize"));
			JSONObject object = new JSONObject();
			JSONArray array = new JSONArray();			
			for(PostVO vo:dao.list(page,pageSize)) {
				JSONObject obj = new JSONObject();
				obj.put("id", vo.getId());
				obj.put("title", vo.getTitle());
				obj.put("writer", vo.getWriter());
				obj.put("date", sdf.format(vo.getDate()));
				array.add(obj);
			}
			object.put("total",dao.total());
			object.put("list", array);		
			out.print(object);
			break;
			
		case "/posts/read":
			int id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("post", dao.read(id));
			request.setAttribute("pageName", "/posts/read.jsp");
			dis.forward(request, response);
			break;
			
		case "/comments.json":
			int postid = Integer.parseInt(request.getParameter("postid"));
			page = Integer.parseInt(request.getParameter("page"));
			int size = Integer.parseInt(request.getParameter("size"));
			
			object = new JSONObject();
			array = new JSONArray();
			
			for(CommentVO vo: cdao.list(postid,page,size)) {
				JSONObject obj = new JSONObject();
				obj.put("id", vo.getId());
				obj.put("body", vo.getBody());
				obj.put("writer", vo.getWriter());
				obj.put("date", sdf.format(vo.getDate()));
				array.add(obj);
			}
			object.put("total",cdao.total(postid));
			object.put("list", array);
			out.println(object);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		switch(request.getServletPath()) {
		case "/comments/insert":
			CommentVO vo = new CommentVO();
			vo.setBody(request.getParameter("body"));
			vo.setPostid(Integer.parseInt(request.getParameter("postid")));
			vo.setWriter(request.getParameter("writer"));
			cdao.insert(vo);
			break;
		case "/comments/delete":
			int id = Integer.parseInt(request.getParameter("id"));
			cdao.delete(id);
			break;
		}
	}

}
