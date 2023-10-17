package com.mulcam8.emergensee.service;

import java.util.List;

import com.mulcam8.emergensee.vo.BoardReplyVO;

public interface BoardReplyService {
	public List<BoardReplyVO> replySelect(int post_no);
	public int replyInsert(BoardReplyVO vo);
	public int replyUpdate(BoardReplyVO vo);
	public int replyDelete(int comment_no);
}
