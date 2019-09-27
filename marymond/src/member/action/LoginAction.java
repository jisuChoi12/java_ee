package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		if(id.equals("yap") && pwd.equals("123")) {
			request.setAttribute("result","ok"); 
		}
		 	
		System.out.println("id: "+id+" pwd: "+pwd);
	
		request.setAttribute("display", "/template/body.jsp");
		return "/main/index.jsp";
	}
}
