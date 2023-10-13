package com.mulcam8.emergensee.vo;

public class UserVO {
	private String userid;
	private String username;
	private String userpwd;
	
	public UserVO() {
		// TODO Auto-generated constructor stub
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + "]";
	}
	
	
}
