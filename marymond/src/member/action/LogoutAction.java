package member.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.control.CommandProcess;

public class LogoutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		// String id = request.getParameter("id");
		// System.out.println("로그아웃 할 사람: "+id);

		// 세션
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		System.out.println("로그아웃 할 사람: " + id);

		// 쿠키
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// 쿠키삭제
				System.out.println(id + "의 쿠키 삭제 : " + cookie.getName() + "/ " + cookie.getValue());
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		// 세션
		session.invalidate(); // 모든 세션 종료

		// 응답
		return "/member/logoutResult.jsp";
	}
}
