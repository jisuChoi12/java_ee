package board.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// 쿠키
		Cookie[] cookies = request.getCookies(); // 모든 쿠키 얻어오기 (특정 쿠키만 가져오기 안됨)
		Cookie viewCookie = null; // 비교를 위한 새로운 쿠키 초기값은 null
		if (cookies != null && cookies.length > 0) { // 쿠키가 있을 경우
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("memHit")) {
					viewCookie = cookies[i]; // viewCookie에 값 주기
				}
			}
		}
		
		if (viewCookie == null) { // 처음 방문
			Cookie newCookie = new Cookie("memHit", "[" + seq + "]"); // 새로운 쿠키 생성
			response.addCookie(newCookie); // 쿠키 담기	
			BoardDAO.getInstance().boardHit(seq); // 조회수 증가 
		}
		
		// DB
		BoardDTO boardDTO = BoardDAO.getInstance().getBoard(seq);
		
		// 응답
		request.setAttribute("boardDTO", boardDTO);
		request.setAttribute("pg", pg);
		
		
		request.setAttribute("display", "/board/boardView.jsp");
		return "/main/index.jsp";
	}
}
