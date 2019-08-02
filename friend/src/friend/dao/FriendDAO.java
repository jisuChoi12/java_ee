package friend.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import friend.bean.FriendDTO;

public class FriendDAO {
	private static FriendDAO instance; // SingleTon
	private String driver = "oracle.jdbc.driver.OracleDriver"; // driverLoading
	private Connection conn; // connection
	private PreparedStatement pstmt; // statement
	private ResultSet rs;
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";

	public FriendDAO() {
		try {
			Class.forName(driver); // 생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static FriendDAO getInstance() { // SingleTon
		if (instance == null) {
			synchronized (FriendDAO.class) {
				instance = new FriendDAO();
			}
		}
		return instance;
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password); // jabc:oracle:드라이버명:서버:포트:데이터베이스명
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FriendDTO> getFriendList() {
		getConnection();
		ArrayList<FriendDTO> arrayList = new ArrayList<FriendDTO>();
		try {
			String sql = "select * from friend order by seq desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FriendDTO dto = new FriendDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setName(rs.getString("name"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setGender(rs.getInt("gender"));
				dto.setRead(rs.getInt("read"));
				dto.setMovie(rs.getInt("movie"));
				dto.setMusic(rs.getInt("music"));
				dto.setGame(rs.getInt("game"));
				dto.setShopping(rs.getInt("shopping"));
				arrayList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			arrayList = null; // try-catch 안에서 에러가 나면 리스트를 리턴하면 안되니까 null 
		} finally {
			try {
				if (rs != null) { // 에러방지
					rs.close();
				}
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
		return arrayList;
	}

	public int getSeq() {
		getConnection();
		int seq = 0;
		try {
			String sql = "select seq_friend.nextval from dual";
			pstmt = conn.prepareStatement(sql); // 생성
			rs = pstmt.executeQuery(); // 실행 ... select 결과물 리턴
			if (rs.next()) {
				seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) { // 에러방지
					rs.close();
				}
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
		return seq;
	}
	
	

	public int insertFriend(FriendDTO dto) {
		int su = 0;
		try {
			// 접속
			this.getConnection();

			// DB
			String sql = "insert into friend values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql); // 생성
			pstmt.setInt(1, dto.getSeq());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getTel1());
			pstmt.setString(4, dto.getTel2());
			pstmt.setString(5, dto.getTel3());
			pstmt.setInt(6, dto.getGender());
			pstmt.setInt(7, dto.getRead());
			pstmt.setInt(8, dto.getMovie());
			pstmt.setInt(9, dto.getMusic());
			pstmt.setInt(10, dto.getGame());
			pstmt.setInt(11, dto.getShopping());

			su = pstmt.executeUpdate(); // 실행 ... insert/update/delete 개수 리턴

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
		return su;
	}

	public void updateFriend() {
		// 접속
		this.getConnection();

		// DB
		String sql = "update friend set ~~~~ where ~~~~";
	}

	public void deleteFriend() {

//		DB

	}



}
