package guestbook.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
		// 데이터 받아오기
		int pg = Integer.parseInt(request.getParameter("pg"));

		int endNum = pg * 2;
		int startNum = endNum - 1;

		// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		List<GuestbookDTO> list = guestbookDAO.getList(startNum, endNum);

		// 총 글 수 가 있어야
		int totArticle = GuestbookDAO.getInstance().getTotalArticle();
		// 총 페이지 번호 를 나타낼 수 있다.
		int totPage = (totArticle + 1) / 2;
		// if 10페이지씩 이라면 >> (totArticle + 9 ) /10
		// (totArticle / 2) + (totArticle % 2);

		// 응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<style>");
		out.println("#currentPaging { color: red; text-decoration: underline; }");
		out.println("#paging { color: black; text-decoration: none; }");
		out.println("</style>");
		if (list != null) {
			for (GuestbookDTO guestbookDTO : list) {
				out.println("<table border='1'>");
				out.println("<tr><th>작성자</th><td><input readonly type='text' name='name' value="
						+ guestbookDTO.getName() + ">");
				out.println("</td><th>작성일</th><td><input readonly type='text' name='logtime' value="
						+ guestbookDTO.getLogtime() + "></td></tr>");
				out.println("<tr><th>이메일</th><td colspan='3'><input readonly type='text' name='email' value="
						+ guestbookDTO.getEmail() + " style='width: 405px'></td></tr>");
				out.println("<tr><th>홈페이지</th><td colspan='3'><input readonly type='text' name='homepage' value="
						+ guestbookDTO.getHomepage() + " style='width: 405px'></td></tr>");
				out.println("<tr><th>제목</th><td colspan='3'><input readonly type='text' name='subject' value="
						+ guestbookDTO.getSubject() + " style='width: 405px'></td></tr>");
				out.println(
						"<td colspan = '4'><pre style ='overflow: auto; white-space:pre-line; word-break: break-all; width: 480px; height: 100px;'>"
								+ guestbookDTO.getContent() + "</pre></td>");
				out.println("</table>");
				out.println("<br>");
				out.println("<hr width = 500 align = 'left' color= red>");
			}
			for (int i = 1; i <= totPage; i++) {
				if (i == pg)
					out.println("<a id ='currentPaging' href = '/guestbookServlet/GuestbookListServlet?pg=" + i + "'>"
							+ "[" + i + "]" + "</a>");
				else
					out.println("<a id ='paging' href = '/guestbookServlet/GuestbookListServlet?pg=" + i + "'>" + "["
							+ i + "]" + "</a>");

			}
		}
		out.println("</body>");
		out.println("</html>");
	}
}