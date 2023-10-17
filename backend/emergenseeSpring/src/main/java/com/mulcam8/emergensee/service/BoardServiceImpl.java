package com.mulcam8.emergensee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam8.emergensee.dao.BoardDAO;
import com.mulcam8.emergensee.mapper.BoardMapper;
import com.mulcam8.emergensee.vo.BoardVO;
import com.mulcam8.emergensee.vo.CommentVO;
import com.mulcam8.emergensee.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardMapper mapper;
	
	@Autowired
	BoardDAO boardDao = new BoardDAO();

	@Override
	public String write() {
		return mapper.write();
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return mapper.boardInsert(vo);
	}

	@Override
	public List<BoardVO> boardPageList(PagingVO vo) {
		return mapper.boardPageList(vo);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return mapper.totalRecord(pVO);
	}

	@Override
	public BoardVO boardSelect(int post_no) {
		return mapper.boardSelect(post_no);
	}

	@Override
	public void hitCount(int no) {
		mapper.hitCount(no);
		
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return mapper.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int post_no) {
		return mapper.boardDelete(post_no);
	}

	@Override
	public List<BoardVO> boardTypeList(PagingVO pVO) {
		return mapper.boardTypeList(pVO);
	}

	@Override
	public List<BoardVO> getBoardByUser(String userid) {
		return boardDao.getBoardByUser(userid);
	}

	@Override
	public List<CommentVO> getCommentByUser(String userid) {
		return boardDao.getCommentByUser(userid);
	}
	


}
