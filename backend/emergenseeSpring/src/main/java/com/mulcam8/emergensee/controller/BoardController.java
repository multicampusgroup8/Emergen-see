package com.emergen.see.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emergen.see.service.BoardService;
import com.emergen.see.vo.BoardVO;
import com.emergen.see.vo.PagingVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping("/board/list")
	public ModelAndView boardList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		// list 전체목록 DB조회 
		List<BoardVO> list = service.boardPageList(pVO);
		mav.addObject("list",list);
		mav.addObject("pVO",pVO);

		mav.setViewName("board/boardList");
		
		return mav;
	}
	
	
	
	@GetMapping("/board/write")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@PostMapping("/board/writeOk")
	public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
	
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		// vo.setLocation((String)request.getSession().getAttribute("interest"));		
		
		///// mapper
		int result = service.boardInsert(vo);
		if(result>0) {
			mav.setViewName("redirect:list");
		}else {
			mav.addObject("msg","등록");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	
	// 글내용 보기
	@GetMapping("/board/view")
	public ModelAndView boardView(int post_no, PagingVO pVO) {
		
		ModelAndView mav = new ModelAndView();
		
		service.hitCount(post_no); 					// 조회수 증가
		BoardVO bVO = service.boardSelect(post_no); // 레코드 선택
		System.out.println(bVO.toString());
		mav.addObject("bVO",bVO);
		mav.addObject("pVO",pVO);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	
	@GetMapping("/board/edit")
	public ModelAndView boardEdit(int post_no) {
		ModelAndView mav = new ModelAndView();
		
		service.boardSelect(post_no);
		mav.addObject("bVO", service.boardSelect(post_no));
		mav.setViewName("board/boardEdit");
		return mav;
	}
	
	@PostMapping("/board/EditOk")
	public ModelAndView boardEditOk(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.boardUpdate(vo);
		if(result>0) {
			mav.setViewName("redirect:view?no="+vo.getPost_no());
		}else {
			mav.addObject("msg","수정");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	
	@GetMapping("/board/delete")
	public ModelAndView boardDelete(int post_no) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.boardDelete(post_no);
		if(result>0) {
			mav.setViewName("redirect : list");
		}else {
			mav.setViewName("redirect : view?post_no=" + post_no);
		}
		
		return mav;
		
	}

}








