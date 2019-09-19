package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	public static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public void write(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.write", boardDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> boardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}

	public int getTotalArticle() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalArticle");
		sqlSession.close();
		return totalA;
	}

	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		return boardDTO;
	}
	
	public void boardHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardModify(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify",map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 삭제할 글의 원글을 찾아서 답글수 1 감소 (update)
		sqlSession.update("boardSQL.boardDelete1", seq);
		// 삭제할 글의 답글을 찾아서 제목에 [원글이 삭제된 답글] 추가 (upadte)
		sqlSession.update("boardSQL.boardDelete2", seq);
		// 글 삭제 (delete)		
		sqlSession.delete("boardSQL.boardDelete3", seq);
		
//		sqlSession.delete("boardSQL.boardDelete",seq);
		
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> boardSearch(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardSearch", map);
		sqlSession.close();
		return list;
	}

	public int getSearchTotalArticle(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getSearchTotalArticle",map);
		sqlSession.close();
		return totalA;
	}

	public void boardReply(BoardDTO boardDTO) {
		BoardDTO pDTO = getBoard(boardDTO.getPseq()); // 원글
		SqlSession sqlsession = sqlSessionFactory.openSession();
		// step update
		sqlsession.update("boardSQL.boardReply1", pDTO);
		
		// insert
		boardDTO.setRef(pDTO.getRef()); // 원글ref
		boardDTO.setLev(pDTO.getLev()+1); // 원글lev+1
		boardDTO.setStep(pDTO.getStep()+1); // 원글step+1
		sqlsession.insert("boardSQL.boardReply2", boardDTO);
		
		// reply update
		sqlsession.update("boardSQL.boardReply3", boardDTO.getPseq());
		
		sqlsession.commit();
		sqlsession.close();
	}
	
	
}