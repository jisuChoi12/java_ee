package board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String subject = (String)request.getParameter("subject");
		String content = (String)request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB
		Map<String,String> map = new HashMap<String,String>(); 
		map.put("seq", seq+"");
		map.put("subject",subject);
		map.put("content",content);
		BoardDAO.getInstance().boardModify(map);
		
		request.setAttribute("pg", pg);
		
		return "/board/boardModify.jsp";
	}

}
