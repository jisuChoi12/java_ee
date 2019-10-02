package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;

import board.bean.QnaDTO;
import board.dao.QnaDAO;

public class QnaWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		
		// 업로드
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
		
		// 데이터
		String qna_id = multi.getParameter("qna_id");
		String qna_subject = multi.getParameter("qna_subject");
		String qna_content = multi.getParameter("qna_content");
		String qna_file = multi.getOriginalFileName("qna_file");
		
		System.out.println(qna_id);
		System.out.println(qna_subject);
		System.out.println(qna_content);
		System.out.println(qna_file);
		
		// DB
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setQna_id(qna_id);
		qnaDTO.setQna_subject(qna_subject);
		qnaDTO.setQna_content(qna_content);
		qnaDTO.setQna_file(qna_file);
		
		QnaDAO.getInstance().write(qnaDTO);
	
		return "/qna/qnaWrite.jsp";
	}
}
