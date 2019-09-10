package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	public static UserDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public UserDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // 환경설정 파일을 모두 읽어 오기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // 읽어 온 환경설정 파일로 sqlSessionFactory 생성
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static UserDAO getInstance() {
		if(instance==null) {
			synchronized (UserDAO.class) {
				instance = new UserDAO();
			}
		}
		return instance;
	}

	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// sqlSession.insert("namespace/id(mapper파일 안에 들어있는 namespace와 id)", 데이터);
		sqlSession.insert("userSQL.write",userDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete",id);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		sqlSession.close();
	
		return list;
	}

	public UserDTO search(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.search", id);
		sqlSession.close();
		
		return userDTO;
	}

	public void update(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();
	}
}


// mybatis-config 안에 있는 resources -> sqlSessionFactoryBuilder -> sqlSessionFactory -> sqlSession