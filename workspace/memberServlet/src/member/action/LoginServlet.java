package member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		String name = memberDAO.checkLogin(memberDTO);
		
		//응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		if(name!=null) {
			out.println(name+"님 로그인");
		} else {
			out.println("아이디 또는 비밀번호가 틀립니다");
		}
		out.print("</body>");
		out.print("</html>");
		
	}

}

// 모델1기법 