package guestbook.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		ArrayList<GuestbookDTO> list = guestbookDAO.getList();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>방명록</h1>");
		for (GuestbookDTO guestbookDTO : list) {
			out.println("<table border='1' style='table-layout:fixed'>");
			out.println("<tr><th>작성자</th><td><input readonly type='text' name='name' value="+guestbookDTO.getName()+">");
			out.println("</td><th>작성일</th><td><input readonly type='text' name='logtime' value="+guestbookDTO.getLogtime()+"></td></tr>");
			out.println("<tr><th>이메일</th><td colspan='3'><input readonly type='text' name='email' value="+guestbookDTO.getEmail()+" style='width: 405px'></td></tr>");
			out.println("<tr><th>홈페이지</th><td colspan='3'><input readonly type='text' name='homepage' value="+guestbookDTO.getHomepage()+" style='width: 405px'></td></tr>");
			out.println("<tr><th>제목</th><td colspan='3'><input readonly type='text' name='subject' value="+guestbookDTO.getSubject()+" style='width: 405px'></td></tr>");
			out.println("<tr><td colspan='4' height='100' width='475'><pre style='white-space:pre-wrap'>"+guestbookDTO.getContent()+"</pre></td></tr>");
			out.println("</table>");
			out.println("<br><br>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}