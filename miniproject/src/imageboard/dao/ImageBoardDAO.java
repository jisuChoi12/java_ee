package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
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

	public int getImageboardTotalArticle() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("imageBoardSQL.getImageboardTotalArticle");
		sqlSession.close();
		return totalA;
	}

	public ImageBoardDTO getImageBoard(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageBoardDTO imageBoardDTO = sqlSession.selectOne("imageBoardSQL.getImageBoard", map);
		sqlSession.close();
		return imageBoardDTO;
	}

	public void deleteImage(String[] check) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
//		sqlSession.delete("imageBoardSQL.deleteImage", check); 
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("check", check);
		sqlSession.delete("imageBoardSQL.deleteImage", map);
		
		sqlSession.commit();
		sqlSession.close(); 
	}
	
	/*
	 * public void deleteImage(String[] seq) { SqlSession sqlSession =
	 * sqlSessionFactory.openSession();
	 * sqlSession.delete("imageBoardSQL.deleteImage", seq); sqlSession.commit();
	 * sqlSession.close(); }
	 */
}
