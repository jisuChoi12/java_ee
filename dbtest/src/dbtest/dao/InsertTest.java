package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertTest {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";

	private Connection conn;
	private PreparedStatement pstmt;

	public InsertTest() {
		try {
			Class.forName(driver); // 생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password); // jabc:oracle:드라이버명:서버:포트:데이터베이스명
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertArticle() {
		try {
			// 데이터
			Scanner scan = new Scanner(System.in);
			System.out.print("이름 입력: ");
			String name = scan.next();
			System.out.print("나이 입력: ");
			int age = scan.nextInt();
			System.out.print("키 입력: ");
			Double height = scan.nextDouble();

			this.getConnection(); // 접속
			String sql = "insert into dbtest values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql); // 생성
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);

			int su = pstmt.executeUpdate(); // 실행 ... insert 개수 리턴

			System.out.println(su + " row created");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) { // 에러방지
					pstmt.close();
				}
				if (conn != null) { // 에러방지
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		InsertTest it = new InsertTest();
		it.insertArticle();
	}
}
