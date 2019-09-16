package board.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String memId = "";
		HttpSession session = request.getSession();
		if ((String) session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId");
		}
		
		// 쿠키
		Cookie[] cookies = request.getCookies(); // 쿠기 불러오기
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("memHit")) {
					cookies[i].setMaxAge(0); // 쿠키삭제
					response.addCookie(cookies[i]); // 클라이언트에 저장
				}
			}
		}
		
		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");	
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("columnName",searchOption);
		map.put("keyword", keyword);
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = BoardDAO.getInstance().boardSearchList(map);
		int totArticle = BoardDAO.getInstance().getTotalSearchArticle(map);
		int totPage = (totArticle + 4) / 5;
		
		BoardPaging boardPaging = new BoardPaging(); // 클래스 생성
		int totalA = BoardDAO.getInstance().getTotalSearchArticle(map); // 총글수를 board테이블에서 가져오기
		boardPaging.setCurrentPage(pg); // 현재 페이지는 pg
		boardPaging.setPageBlock(3); // 1블록당 페이지 3개씩
		boardPaging.setPageSize(5); // 1페이지당 글 5개씩
		boardPaging.setTotalA(totalA); // 총글수
		boardPaging.makePagingHTML(); // 페이징html
		
		request.setAttribute("pg", pg);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("list", list);
		
		request.setAttribute("display", "/board/boardSearchList.jsp");
		return "/main/index.jsp";
	}

}
