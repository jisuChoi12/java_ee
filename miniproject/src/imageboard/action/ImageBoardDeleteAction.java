package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageBoardDAO;

public class ImageBoardDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
//		String[] check = request.getParameter("check").split(",");
		String[] check = request.getParameterValues("check");
		
		// DB
//		for (int i = 0; i < check.length; i++) {
//			ImageBoardDAO.getInstance().deleteImage(check[i]);			
//		}
		ImageBoardDAO.getInstance().deleteImage(check);
		
		// 응답
		return "/imageboard/imageboardDeleteOk.jsp";
	}

}
