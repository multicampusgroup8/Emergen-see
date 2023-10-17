package com.mulcam8.emergensee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam8.emergensee.service.BoardServiceImpl;
import com.mulcam8.emergensee.vo.BoardVO;
import com.mulcam8.emergensee.vo.CommentVO;

@Controller
public class MyPageController {
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	
	@GetMapping("/mypage/change")
	public String mypageChangePage(HttpSession session) {
		
		return "mypage/myPageChange";
	}
	
	
	@GetMapping("/mypage/personal")
	public String mypagePersonalPage() {
		return "mypage/myPageMap_personal";
	}
	
	@GetMapping("/mypage/shelter")
	public String mypageShelterPage(HttpSession session) {
		String logStatus = (String)session.getAttribute("logStatus");
		String path = "";
		if(logStatus != null && logStatus.equals("Y")) {
			path = "mypage/myPageMap_shelter";
		}else{
			path = "users/login";
		}
		return path;
	}
	
	@GetMapping("/mypage/comment")
	public ModelAndView mypageCommentPage(HttpSession session) {
		String logId = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		List<CommentVO> list = boardServiceImpl.getCommentByUser(logId);
		mav.addObject("list",list);
		mav.setViewName("mypage/myPageComment");

		
		return mav;
	}
	
	@GetMapping("/mypage/post")
	public ModelAndView mypagePostPage(HttpSession session) {
		String logId = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = boardServiceImpl.getBoardByUser(logId);
		System.out.println(list);
		mav.addObject("list",list);
		mav.setViewName("mypage/myPagePost");
		
		return mav;
	}
	
	@GetMapping("/mypage/setting")
	public String mypageSettingPage() {
		return "mypage/myPageSetting";
	}
}