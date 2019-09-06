package board.action;

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
		
		// DB
		BoardDTO boardDTO = BoardDAO.getInstance().getBoard(seq);
		
		// 응답
		request.setAttribute("boardDTO", boardDTO);
		request.setAttribute("pg", pg);
		
		return "/board/boardView.jsp";
	}
}
