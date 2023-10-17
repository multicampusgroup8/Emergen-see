package com.mulcam8.emergensee.vo;

public class UserVO {
	private String userid;
	private String username;
	private String userpwd;
	private String confirmpassword;

	
	private String email;
	private String address;
	private String addressdetail;
	private String phone;
	
	private Boolean kakaonotification;
	private String interests;
	
	private String terms;
	private String userType;
	private int admin;
	
	
	
	public Boolean getKakaonotification() {
		return kakaonotification;
	}


	public void setKakaonotification(Boolean kakaonotification) {
		this.kakaonotification = kakaonotification;
	}


	public String getInterests() {
		return interests;
	}


	public void setInterests(String interests) {
		this.interests = interests;
	}


	public int getAdmin() {
		return admin;
	}


	public void setAdmin(int admin) {
		this.admin = admin;
	}


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


	public String getConfirmpassword() {
		return confirmpassword;
	}


	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressdetail() {
		return addressdetail;
	}


	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getTerms() {
		return terms;
	}


	public void setTerms(String terms) {
		this.terms = terms;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + ", confirmpassword="
				+ confirmpassword + ", email=" + email + ", address=" + address + ", addressdetail=" + addressdetail
				+ ", phone=" + phone + ", terms=" + terms + ", userType=" + userType + "]";
	}
	
	
}