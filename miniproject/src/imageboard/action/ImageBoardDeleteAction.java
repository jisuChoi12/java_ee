package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageBoardDAO;

public class ImageBoardDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String[] seq = request.getParameter("seqs").split(",");
		
		// DB
		for (int i = 0; i < seq.length; i++) {
			ImageBoardDAO.getInstance().deleteImage(seq[i]);			
		}
		
		// 응답
		return "/imageboard/imageboardDeleteOk.jsp";
	}

}
