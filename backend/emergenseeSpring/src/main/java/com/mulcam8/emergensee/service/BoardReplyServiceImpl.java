package com.mulcam8.emergensee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mulcam8.emergensee.mapper.BoardReplyMapper;
import com.mulcam8.emergensee.vo.BoardReplyVO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService{
	@Inject
	BoardReplyMapper mapper;

	@Override
	public List<BoardReplyVO> replySelect(int post_no) {
		return mapper.replySelect(post_no);
	}

	@Override
	public int replyInsert(BoardReplyVO vo) {
		return mapper.replyInsert(vo);
	}

	@Override
	public int replyUpdate(BoardReplyVO vo) {
		return mapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int comment_no) {
		return mapper.replyDelete(comment_no);
	}
}
