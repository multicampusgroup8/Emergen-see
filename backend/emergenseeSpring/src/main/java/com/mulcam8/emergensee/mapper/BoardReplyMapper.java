package com.mulcam8.emergensee.mapper;

import java.util.List;

import com.mulcam8.emergensee.vo.BoardReplyVO;

public interface BoardReplyMapper {
	public List<BoardReplyVO> replySelect(int post_no);
	public int replyInsert(BoardReplyVO vo);
	public int replyUpdate(BoardReplyVO vo);
	public int replyDelete(int comment_no);
}
