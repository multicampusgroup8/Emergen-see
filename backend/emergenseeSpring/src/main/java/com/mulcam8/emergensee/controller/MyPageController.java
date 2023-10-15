package com.mulcam8.emergensee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mysql.cj.Session;

@Controller
public class MyPageController {
	@GetMapping("/mypage/change")
	public String mypageChangePage(HttpSession session) {
		
		return "mypage/myPageChange";
	}
	
	@GetMapping("/mypage/comment")
	public String mypageCommentPage() {
		return "mypage/myPageComment";
	}
	
	@GetMapping("/mypage/personal")
	public String mypagePersonalPage() {
		return "mypage/myPageMap_personal";
	}
	
	@GetMapping("/mypage/shelter")
	public String mypageShelterPage(HttpSession session) {
		String logStatus = (String)session.getAttribute("logStatus");
		System.out.println(logStatus);
		String path = "";
		if(logStatus != null && logStatus.equals("Y")) {
			path = "mypage/myPageMap_shelter";
		}else{
			path = "users/login";
		}
		return path;
	}
	
	@GetMapping("/mypage/post")
	public String mypagePostPage() {
		return "mypage/myPagePost";
	}
	
	@GetMapping("/mypage/setting")
	public String mypageSettingPage() {
		return "mypage/myPageSetting";
	}
}
