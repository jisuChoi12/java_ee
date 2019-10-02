package board.bean;

import lombok.Data;

@Data
public class QnaDTO {
	private int seq;
	private String qna_id;
	private String qna_subject;
	private String qna_content;
	private String qna_file;
	private String qna_reply_status;
	private String qna_reply_content;
	private String qna_write_logtime;
}
