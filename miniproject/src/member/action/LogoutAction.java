package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 세션
		HttpSession session = request.getSession(); // 생성
		session.invalidate(); // 모든 세션 종료
		
		// 응답
		request.setAttribute("display", "/member/logout.jsp");
		return "/main/index.jsp";
	}
}
