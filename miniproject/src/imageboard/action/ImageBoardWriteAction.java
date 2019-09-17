package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;

import board.dao.BoardDAO;
import imageboard.bean.ImageBoardDTO;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		
		// 업로드
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
		
		// 데이터
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		String image1 = multi.getOriginalFileName("image1");
		
		
		System.out.println("imageId: "+imageId);
		System.out.println("imageName: "+imageName);
		System.out.println("imagePrice: "+imagePrice);
		System.out.println("imageQty: "+imageQty);
		System.out.println("imageContent: "+imageContent);
		System.out.println("image1: "+image1);
		
		// DB
		ImageBoardDTO imageBoardDTO = new ImageBoardDTO();
		imageBoardDTO.setImageId(imageId);
		imageBoardDTO.setImageName(imageName);
		imageBoardDTO.setImagePrice(imagePrice);
		imageBoardDTO.setImageQty(imageQty);
		imageBoardDTO.setImageContent(imageContent);
		imageBoardDTO.setImage1(image1);
		
		ImageBoardDAO.getInstance().write(imageBoardDTO);
		// 응답
		return "/imageboard/imageBoardWrite.jsp";
	}

}


// C:\Users\Jisu\Documents\GitHub\java_ee\miniproject\WebContent\storage

// C:\Users\Jisu\Documents\GitHub\java_ee\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\miniproject\storage
