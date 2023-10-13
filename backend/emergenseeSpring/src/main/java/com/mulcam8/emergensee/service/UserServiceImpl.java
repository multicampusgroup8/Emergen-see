package com.mulcam8.emergensee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mulcam8.emergensee.dao.UserDAO;
import com.mulcam8.emergensee.vo.UserVO;


@Repository
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDao;
	
	@Override
	public int loginCheck(UserVO vo) throws Exception {
		return userDao.loginCheck(vo);
	}

}
