package com.mulcam8.emergensee.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mulcam8.emergensee.vo.UserVO;



@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int loginCheck(UserVO vo) throws Exception {
		return sqlSession.selectOne("User.loginCheck", vo);
	}
}
