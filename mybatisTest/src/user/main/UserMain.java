package user.main;

import java.util.Scanner;

import user.action.UserAction;
import user.action.UserDeleteAction;
import user.action.UserInsertAction;
import user.action.UserSearchAction;
import user.action.UserSelectAction;
import user.action.UserUpdateAction;

public class UserMain {

	public void menu() {
		UserAction userAction = null;
		Scanner scan = new Scanner(System.in);
		int num;
		while (true) {
			System.out.println("*******************");
			System.out.println("1.입력");
			System.out.println("2.출력");
			System.out.println("3.수정");
			System.out.println("4.삭제");
			System.out.println("5.검색");
			System.out.println("6.끝");
			System.out.println("*******************");
			System.out.print("번호: ");
			num = scan.nextInt();
			if (num == 6) { // 끝
				break;
			}
			if (num == 1) { // 입력
				userAction = new UserInsertAction();
			} else if (num == 2) { // 출력
				userAction = new UserSelectAction();
			} else if (num == 3) { // 수정
				userAction = new UserUpdateAction();
			} else if (num == 4) { // 삭제
				userAction = new UserDeleteAction();
			} else if (num == 5) { // 검색
				userAction = new UserSearchAction();
			} else { // 그 외
				System.out.println("1~5까지 가능합니다");
				continue;
			}
			
			userAction.execute();
			
		} // while
	}

	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("프로그램을 종료합니다");
	}
}
