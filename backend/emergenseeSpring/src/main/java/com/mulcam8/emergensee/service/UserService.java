package com.multicampus.web.service;

import org.springframework.stereotype.Service;

import com.multicampus.web.vo.UserVO;

@Service
public interface UserService {
	public int loginCheck(UserVO vo) throws Exception;
}
