package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.QnaDTO;
import board.dao.QnaDAO;

public class QnaViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		// DB
		QnaDTO qnaDTO = QnaDAO.getInstance().getQna(seq);
		
		// 응답
		request.setAttribute("qnaDTO", qnaDTO);
		request.setAttribute("sessionID", request.getAttribute("memId"));
		request.setAttribute("display", "/qna/qnaView.jsp");
		return "/main/index.jsp";
	}
}
