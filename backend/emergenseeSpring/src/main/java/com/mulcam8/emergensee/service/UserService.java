package com.mulcam8.emergensee.service;

import org.springframework.stereotype.Service;

import com.mulcam8.emergensee.vo.*;

@Service
public interface UserService {
	public int loginCheck(UserVO vo) throws Exception;
	public void registerSubmit(UserVO vo) throws Exception;
	public int idDuplicateCheck(String userid) throws Exception;
	//��й�ȣ ��Ȯ���ϱ�
	
}
