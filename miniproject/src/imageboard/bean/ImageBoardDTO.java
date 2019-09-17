package imageboard.bean;

import lombok.Data;

@Data
public class ImageBoardDTO {
	private int seq;
	private String imageId;
	private String imageName;
	private int imagePrice;
	private int imageQty;
	private String imageContent;
	private String image1;
	private String logtime;
}
