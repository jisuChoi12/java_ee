package board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.QnaDTO;
import board.dao.QnaDAO;

public class QnaListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 세션
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		// DB
		List<QnaDTO> list = QnaDAO.getInstance().getQnaList(id);
		System.out.println("qna 리스트 사이즈: "+list.size());
		
		// 응답
		request.setAttribute("list", list);
		request.setAttribute("display", "/qna/qnaList.jsp");
		return "/main/index.jsp";
	}
}
