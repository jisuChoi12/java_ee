package imageboard.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageBoardDTO;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pg", pg);
		map.put("seq", seq);
		
		// DB
		ImageBoardDTO imageBoardDTO = ImageBoardDAO.getInstance().getImageBoard(map);
		
		// 응답
		request.setAttribute("imageBoardDTO", imageBoardDTO);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/imageboard/imageBoardView.jsp");
		
		return "/main/index.jsp";
	}

}
