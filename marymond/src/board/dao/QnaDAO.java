package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.QnaDTO;

public class QnaDAO {
	public static QnaDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public QnaDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static QnaDAO getInstance() {
		if (instance == null) {
			synchronized (QnaDAO.class) {
				instance = new QnaDAO();
			}
		}
		return instance;
	}

	public void write(QnaDTO qnaDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("qnaSQL.write", qnaDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<QnaDTO> getQnaList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<QnaDTO> list = sqlSession.selectList("qnaSQL.getQnaList",id);
		sqlSession.close();
		return list;
	}

	public QnaDTO getQna(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		QnaDTO qnaDTO = sqlSession.selectOne("qnaSQL.getQna", seq);
		sqlSession.close();
		return qnaDTO;
	}
}
