package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.bean.BoardDTO;

public class BoardDAO {
	public static BoardDAO instance;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public BoardDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insert(BoardDTO boardDTO) {
		int cnt=0;
		getConnection();
		String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,seq_board.currval,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "yap");
			pstmt.setString(2, "김얍얍");
			pstmt.setString(3, "yapyap@gmail.com");
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.setString(6, "0");
			pstmt.setString(7, "0");
			pstmt.setString(8, "0");
			pstmt.setString(9, "0");
			pstmt.setString(10, "0");
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
}
