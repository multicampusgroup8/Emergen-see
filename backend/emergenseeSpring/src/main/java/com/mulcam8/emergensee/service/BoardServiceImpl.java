package com.emergen.see.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.emergen.see.mapper.BoardMapper;
import com.emergen.see.vo.BoardVO;
import com.emergen.see.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardMapper mapper;
	
	

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

	
	


}