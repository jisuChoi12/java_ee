package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import imageboard.bean.ImageBoardDTO;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String imageId = request.getParameter("imageId");
		String imageName = request.getParameter("imageName");
		Double imagePrice = Double.parseDouble(request.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(request.getParameter("imageQty"));
		String imageContent = request.getParameter("imageContent");
		String image1 = request.getParameter("image1");
		
		
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
