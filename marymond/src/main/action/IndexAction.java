package main.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class IndexAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("cookie_ID")) {
					System.out.println("쿠키: " + cookie.getName() + " / " + cookie.getValue());
					HttpSession session = request.getSession();
					session.setAttribute("memId", cookie.getValue());
				}
			}
		}

		request.setAttribute("display", "/template/body.jsp");
		return "/main/index.jsp";
	}

}
