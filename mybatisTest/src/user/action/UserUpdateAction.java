package user.action;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		// 찾고자 하는 아이디 입력 : angel
		// 찾고자 하는 아이디가 없습니다
		// ------------------------
		// 찾고자 하는 아이디 입력 : yap
		// 김얍얍		yap		123
		// 수정할 이름 입력: 김얍쓰
		// 수절할 비밀번호 입력: 111
		// 데이터를 수정하였습니다
		
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
			// 데이터
			System.out.println(userDTO.getName()+"\t"+userDTO.getId()+"\t"+userDTO.getPwd());
			System.out.print("수정할 이름 입력: ");
			String name = scan.next();
			System.out.print("수정할 비밀번호 입력: ");
			String pwd = scan.next();
			
			// DB
			userDTO.setName(name);
			userDTO.setPwd(pwd);
			userDTO.setId(id);
			userDAO.update(userDTO);
			
			// 응답
			System.out.println("데이터를 수정하였습니다");
		}
	}
}
