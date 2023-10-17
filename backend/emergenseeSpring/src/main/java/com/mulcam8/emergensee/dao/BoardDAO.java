package com.mulcam8.emergensee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mulcam8.emergensee.vo.BoardVO;
import com.mulcam8.emergensee.vo.CommentVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> getBoardByUser(String userid) {
		return mybatis.selectList("User.getBoardByUser", userid);
	}
	public List<CommentVO> getCommentByUser(String userid) {
		return mybatis.selectList("User.getCommentByUser", userid);
	}
	

}
