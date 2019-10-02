package member.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String keepLogin = request.getParameter("keepLogin");

		System.out.println("로그인 상태 유지: " + keepLogin);

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);

		// DB
		MemberDTO memberDTO = MemberDAO.getInstance().login(map);

		if (memberDTO != null) { // 로그인 성공
			// 자동 로그인
			if (keepLogin.equals("true")) {
				Cookie cookie = new Cookie("cookie_ID", id);
				cookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
				cookie.setPath("/");
				response.addCookie(cookie);
				System.out.println(id + "의 쿠키 생성 : " + cookie.getName() + "/ " + cookie.getValue());
			} else if (keepLogin.equals("false")) {
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("cookie_ID")) {
							// 쿠키삭제
							System.out.println(id + "의 쿠키 삭제 : " + cookie.getName() + "/ " + cookie.getValue());
							cookie.setMaxAge(0);
							cookie.setPath("/");
							response.addCookie(cookie);
						}
					}
				}
			}

			// 세션
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
			request.setAttribute("memberDTO", memberDTO);
		}
		return "/member/loginResult.jsp";
	}
}
