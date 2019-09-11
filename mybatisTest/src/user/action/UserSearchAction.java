package user.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		String columnName=null;
		String value=null;
		int num;
		
		System.out.println("*******************");
		System.out.println("1.이름 검색");
		System.out.println("2.아이디 검색");
		System.out.println("*******************");
		System.out.print("번호: ");
		num = scan.nextInt();
		
		if(num==1) { // 이름검색
			System.out.print("검색할 이름 입력: ");
			columnName = "name";
			value = scan.next();	
		} else if(num==2) { // 아이디검색
			System.out.print("검색할 아이디 입력: ");
			columnName = "id";
			value = scan.next();
		} else { // 그 외
			System.out.println("1~2까지 가능합니다");
			return;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("columnName", columnName);
		map.put("value", value);
		List<UserDTO> list = UserDAO.getInstance().search(map);
		
		for (UserDTO userDTO : list) {
			System.out.println(userDTO.getName()+"\t"+userDTO.getId()+"\t"+userDTO.getPwd());
		}
	}
}
