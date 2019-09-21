package imageboard.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardPaging;
import board.dao.BoardDAO;
import imageboard.bean.ImageBoardDTO;
import imageboard.bean.ImageBoardPaging;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// 1페이지당 3개씩
		int endNum = pg * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		// DB
		List<ImageBoardDTO> list = ImageBoardDAO.getInstance().imageboardList(map);
		int totArticle = ImageBoardDAO.getInstance().getImageboardTotalArticle();
		int totPage = (totArticle + 2) / 3;

		// 페이징
		ImageBoardPaging boardPaging = new ImageBoardPaging(); // 클래스 생성
		int totalA = ImageBoardDAO.getInstance().getImageboardTotalArticle(); // 총글수를 board테이블에서 가져오기
		boardPaging.setCurrentPage(pg); // 현재 페이지는 pg
		boardPaging.setPageBlock(3); // 1블록당 페이지 3개씩
		boardPaging.setPageSize(3); // 1페이지당 글 3개씩
		boardPaging.setTotalA(totalA); // 총글수
		boardPaging.makePagingHTML(); // 페이징html

		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		
		request.setAttribute("display", "/imageboard/imageBoardList.jsp");
		return "/main/index.jsp";
	}

}
