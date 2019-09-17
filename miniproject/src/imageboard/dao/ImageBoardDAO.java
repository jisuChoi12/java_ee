package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageBoardDTO;

public class ImageBoardDAO {
	public static ImageBoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public ImageBoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static ImageBoardDAO getInstance() {
		if (instance == null) {
			synchronized (ImageBoardDAO.class) {
				instance = new ImageBoardDAO();
			}
		}
		return instance;
	}
	
	public void write(ImageBoardDTO imageBoardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("imageBoardSQL.write", imageBoardDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<ImageBoardDTO> imageboardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImageBoardDTO> list = sqlSession.selectList("imageBoardSQL.imageboardList", map);
		sqlSession.close();
		return list;
	}

	public int getTotalArticle() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("imageBoardSQL.getTotalArticle");
		sqlSession.close();
		return totalA;
	}

	public ImageBoardDTO getImageBoard(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageBoardDTO imageBoardDTO = sqlSession.selectOne("imageBoardSQL.getImageBoard", map);
		sqlSession.close();
		return imageBoardDTO;
	}


}
