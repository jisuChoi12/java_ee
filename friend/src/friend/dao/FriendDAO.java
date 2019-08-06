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
			Class.forName(driver); // ����
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static FriendDAO getInstance() { // SingleTon
		if (instance == null) { // static���� ��Ƴ��ұ� ������ ó�� ������ �� �� �ѹ� null
			synchronized (FriendDAO.class) {
				instance = new FriendDAO();
			}
		}
		return instance;
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password); // jabc:oracle:����̹���:����:��Ʈ:�����ͺ��̽���
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
			while (rs.next()) {
				FriendDTO dto = new FriendDTO(); // Ŭ������@���۷����� -> Ŭ������ ��°� �ƴ϶� �ּҰ��� ��´�
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
			arrayList = null; // try-catch �ȿ��� ������ ���� ����Ʈ�� �����ϸ� �ȵǴϱ� null
		} finally {
			try {
				if (rs != null) { // ��������
					rs.close();
				}
				if (pstmt != null) { // ��������
					pstmt.close();
				}
				if (conn != null) { // ��������
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
			String sql = "select seq_friend.nextval from dual"; // ������ ��ü���� �������� ������ ����
			pstmt = conn.prepareStatement(sql); // ����
			rs = pstmt.executeQuery(); // ���� ... select ����� ����
			if (rs.next()) {
				seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) { // ��������
					rs.close();
				}
				if (pstmt != null) { // ��������
					pstmt.close();
				}
				if (conn != null) { // ��������
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
			// ����
			this.getConnection();

			// DB
			String sql = "insert into friend values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql); // ����
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

			su = pstmt.executeUpdate(); // ���� ... insert/update/delete ���� ����

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) { // ��������
					pstmt.close();
				}
				if (conn != null) { // ��������
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public int updateFriend(FriendDTO dto) {
		int su = 0;
		// ����
		try {
			this.getConnection(); // ����

			// DB
			String sql = "update friend set name=?, tel1=?, tel2=?, tel3=?, gender=?, read=?, movie=?, music=?, game=?, shopping=? where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel1());
			pstmt.setString(3, dto.getTel2());
			pstmt.setString(4, dto.getTel3());
			pstmt.setInt(5, dto.getGender());
			pstmt.setInt(6, dto.getRead());
			pstmt.setInt(7, dto.getMovie());
			pstmt.setInt(8, dto.getMusic());
			pstmt.setInt(9, dto.getGame());
			pstmt.setInt(10, dto.getShopping());
			pstmt.setInt(11, dto.getSeq());

			su = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) { // ��������
					pstmt.close();
				}
				if (conn != null) { // ��������
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public int deleteFriend(int seq) {
		int su = 0;
		try {
			getConnection(); // ����

			String sql = "delete friend where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);

			su = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) { // ��������
					pstmt.close();
				}
				if (conn != null) { // ��������
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

}
