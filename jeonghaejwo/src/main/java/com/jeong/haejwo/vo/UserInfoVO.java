package com.jeong.haejwo.vo;

public class UserInfoVO {
	private String userId;
	private String userName;
	private String ImageURL;	
	private String Email;
	private String loginApi;
	

	@Override
	public String toString() {
		return "UserInfoVO [userId=" + userId + ", userName=" + userName + ", ImageURL=" + ImageURL + ", Email=" + Email
				+ ", loginApi=" + loginApi + "]";
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getImageURL() {
		return ImageURL;
	}


	public void setImageURL(String imageURL) {
		ImageURL = imageURL;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String getLoginApi() {
		return loginApi;
	}


	public void setLoginApi(String loginApi) {
		this.loginApi = loginApi;
	}
	
}
