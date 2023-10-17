package com.mulcam8.emergensee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam8.emergensee.service.BoardReplyService;
import com.mulcam8.emergensee.vo.BoardReplyVO;

@Controller
@RequestMapping("/boardReply")
public class BoardReplyController {
	@Autowired
	BoardReplyService service;
	
	// ´ñ±Û ¸ñ·Ï
	@GetMapping("/list")
	@ResponseBody
	public List<BoardReplyVO> replyList(int post_no) {
		List<BoardReplyVO> replyList = service.replySelect(post_no);
		return replyList;
	}
	
	// ´ñ±Û µî·Ï
	@PostMapping("/write")
	@ResponseBody
	public String replyWrite(BoardReplyVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		int result = service.replyInsert(vo);
		return result+"";
	}
	
	// ´ñ±Û ¼öÁ¤
	@PostMapping("/editOk")
	@ResponseBody
	public String replyEditOk(BoardReplyVO vo) {
		return service.replyUpdate(vo)+"";
	}
	
	// ´ñ±Û»èÁ¦
	@GetMapping("/delete")
	@ResponseBody
	public String replyDelete(int comment_no) {
		return service.replyDelete(comment_no)+"";
	}
}





