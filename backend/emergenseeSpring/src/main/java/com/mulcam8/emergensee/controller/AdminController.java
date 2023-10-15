package com.mulcam8.emergensee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@GetMapping("/user")
	public String userinfo() {
		return "admin/admin_infoUser";
	}
	@GetMapping("/board")
	public String board() {
		return "admin/admin_boardPage";
	}
	@GetMapping("/dormant")
	public String dormant() {
		return "admin/dormantUser";
	}
	@GetMapping("/leave")
	public String leave() {
		return "admin/admin_leaveUser";
	}

}
