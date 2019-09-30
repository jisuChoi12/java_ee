package member.bean;

import lombok.Data;

@Data
public class MemberDTO {
	private String name;
	private String id;
	private String pwd;
	private String email1;
	private String email2;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
}
