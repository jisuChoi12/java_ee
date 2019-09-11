package user.bean;

import lombok.Data;

@Data
public class UserDTO {
	private String name;
	private String id;
	private String pwd;
}

// DTO 필드명 == DB 컬럼명 == 입력상자 인풋태그