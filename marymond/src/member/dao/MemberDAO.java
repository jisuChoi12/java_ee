package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	public static MemberDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // 환경설정 파일을 모두 읽어 오기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // 읽어 온 환경설정 파일로 sqlSessionFactory 생성
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		if(instance==null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	public boolean isExistId(String id) {
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId",id);
		sqlSession.close();
		if(memberDTO != null) {
			exist = true;
		}
		return exist;
	}

	public int insert(MemberDTO memberDTO) {
		int cnt = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		cnt = sqlSession.insert("memberSQL.insert",memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}
	
	public MemberDTO login(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login",map);
		sqlSession.close();
		return memberDTO;
	}
}
