package com.mulcam8.emergensee.service;

import org.springframework.stereotype.Service;

import com.mulcam8.emergensee.vo.*;

@Service
public interface UserService {
	public int loginCheck(UserVO vo) throws Exception;
}
