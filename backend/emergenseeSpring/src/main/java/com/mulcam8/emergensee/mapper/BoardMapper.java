package com.mulcam8.emergensee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mulcam8.emergensee.vo.BoardVO;
import com.mulcam8.emergensee.vo.PagingVO;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> boardPageList(PagingVO vo);
	public List<BoardVO> boardTypeList(PagingVO pVO);
	
	public String write();
	public int boardInsert(BoardVO vo);
	public int totalRecord(PagingVO pVO);
	public BoardVO boardSelect(int post_no);
	public void hitCount(int no);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(int post_no);
	
}
