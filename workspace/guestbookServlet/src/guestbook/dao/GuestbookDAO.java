package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {

	public static GuestbookDAO instance;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "java";
	private String password = "dkdlxl";
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public static GuestbookDAO getInstance() {
		if (instance == null) {
			synchronized (GuestbookDAO.class) {
				instance = new GuestbookDAO();
			}
		}
		return instance;
	}

	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void write(GuestbookDTO guestbookDTO) {
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			pstmt.executeUpdate();
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
	}

//	public ArrayList<GuestbookDTO> getList() {
//		ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
//		String sql = "select name,email,homepage,subject,content,to_char(logtime,'YYYY.MM.dd') as logtime from guestbook order by seq desc";
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				GuestbookDTO guestbookDTO = new GuestbookDTO();
//				guestbookDTO.setName(rs.getString("name"));
//				guestbookDTO.setEmail(rs.getString("email"));
//				guestbookDTO.setHomepage(rs.getString("homepage"));
//				guestbookDTO.setSubject(rs.getString("subject"));
//				guestbookDTO.setContent(rs.getString("content"));
//				guestbookDTO.setLogtime(rs.getString("logtime"));
//				list.add(guestbookDTO);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try { // 종료
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
//	}
	
	public List<GuestbookDTO> getList(int startNum, int endNum) {
		getConnection();
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		//인터페이스는 new할 수 없으니, 자식 클래스인 ArrayList 로 new 한다. 
		String sql = "select * from "
				+ "(select rownum rn, temp.* from "
				+ "(select seq, name, email, homepage, subject, content, to_CHAR(logtime, 'YYYY.MM.DD') as logtime from guestbook order by seq desc) temp) "
				+ "where rn between ? and ?";		
				//seq 와 별개로, 페이지 당 2개씩 가져올 수 있도록 행번호를 부여. between 1 and 2, 3and 4, 5 and 6.... 
				//from 절 뒤에 서브쿼리 : 인덱스 뷰 (서브쿼리의 종류)
				//where절 뒤에 서브쿼리 : 단행 /다행 서브쿼리
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String logtime = rs.getString("logtime");
				
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getString("logtime"));
				
				list.add(guestbookDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				list = null; // 에러 발생 시 list를 비워주어야 return 될 때 에러 방지.
			}
		}
				
		return list;
	}

	public int getTotalArticle() {
		int totArticle = 0;
		getConnection();
		
		String sql = "select count(*) as totArticle from guestbook";
		
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totArticle = rs.getInt("totArticle");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return totArticle;
	}
}
