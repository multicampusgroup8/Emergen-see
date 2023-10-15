package com.mulcam8.emergensee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
	@GetMapping("/mypage/change")
	public String mypageChangePage() {
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
	public String mypageShelterPage() {
		return "mypage/myPageMap_shelter";
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
