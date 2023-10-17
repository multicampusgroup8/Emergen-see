package com.mulcam8.emergensee.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mulcam8.emergensee.vo.UserVO;



@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int loginCheck(UserVO vo) throws Exception {
		return mybatis.selectOne("User.loginCheck", vo);
	}
	public void registerSubmit(UserVO vo) throws Exception {
		mybatis.insert("User.registerSubmit", vo);
	}
	public int idDuplicateCheck(String userid) throws Exception{
		return mybatis.selectOne("User.idDuplicateCheck", userid);
	}
	public int isAdminCheck(String userid) throws Exception{
		return mybatis.selectOne("User.isAdminCheck",userid);
	}
}
