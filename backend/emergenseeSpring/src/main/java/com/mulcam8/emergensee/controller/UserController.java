package com.mulcam8.emergensee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mulcam8.emergensee.service.UserServiceImpl;
import com.mulcam8.emergensee.vo.UserVO;



@Controller
public class UserController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;

	@GetMapping("/register")
	public String registerPage() {
		
		return "users/register";
	}
	@RequestMapping(value="/registerOk", method=RequestMethod.POST)
	public String registerValid(UserVO vo) throws Exception{
		System.out.println(vo.toString());
		String path = "";
		int result = userServiceImpl.idDuplicateCheck(vo.getUserid());
		if(result == 1) {
			//아이디가 중복 된다.
			 return "users/idDuplicateCheck";
		}else if(result !=1 && vo.getConfirmpassword().equals(vo.getUserpwd())) {
			System.out.println("가입정보를 insert");
			userServiceImpl.registerSubmit(vo);
			System.out.println("가입완료되었습니다.");

			path = "users/register_ok";
		}else {
			System.out.println("비밀번호 확인 재입력");

			path = "redirect:/";
		}

		return path;
	}
	@GetMapping("/findID")
	public String findID() {
		
		return "users/findID";
	}
	@GetMapping("/findPassword")
	public String findPassword() {
		
		return "users/findPassword";
	}
	
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String login() {
		
		return "users/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginCheck(@RequestParam("userid") String userid, @RequestParam("password") String password
			, HttpServletResponse response
			, HttpServletRequest request ) throws Exception {
			
		String path = "";
		
		//로그인 정보 확인
		UserVO vo = new UserVO();
		
		vo.setUserid(userid);
		vo.setUserpwd(password);
		
		int result = userServiceImpl.loginCheck(vo);
		
		if(result == 1) {
//			if(keeplogin != null) {
//				//쿠키 등록
//				Cookie cookie = new Cookie("username",userid);
//				cookie.setMaxAge(60*60*24*7);
//				cookie.setPath("/");
//				
//				response.addCookie(cookie);
//			}
			
			HttpSession session = request.getSession();
			session.setAttribute("logId", userid);
			session.setAttribute("logStatus", "Y");
			session.setMaxInactiveInterval(1200);
			
			
			path = "redirect:/";
		}else {
			path = "users/login";
		}
		
		return path;	
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		return "users/logout";
	}
	
	@RequestMapping("/logout")
	public String logoutCheck(@RequestParam("yon") String yon, HttpSession session) {	
		System.out.println("yon의 값: "+yon);
		if(yon.equals("예(Yes)")) {
			System.out.println("세션 지우기");
			session.invalidate();
		}else if(yon.equals("아니요(No)")) {
			System.out.println("세션 안지우기");
		}
		return "redirect:/";
	}
}
