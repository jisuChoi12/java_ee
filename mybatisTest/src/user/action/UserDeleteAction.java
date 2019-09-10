package user.action;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		// 데이터
		System.out.print("찾고자 하는 아이디 입력: ");
		String id = scan.next();
		
		// DB
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.search(id);
		
		// 응답
		if(userDTO == null) {
			System.out.println("찾고자 하는 아이디가 없습니다");
		} else {
			userDAO.delete(id);
			System.out.println("데이터를 삭제하였습니다");
		}
	}
}
