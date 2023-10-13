package com.multicampus.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multicampus.web.dao.UserDAO;
import com.multicampus.web.vo.UserVO;

@Repository
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDao;
	
	@Override
	public int loginCheck(UserVO vo) throws Exception {
		return userDao.loginCheck(vo);
	}

}
