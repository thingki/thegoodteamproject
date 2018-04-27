package com.jeong.haejwo.vo;

public class BoardInfoVO {

	private int biNo;
	private String biName;
	private String biId;
	private String biPwd;
	private String biEmail;
	private String admin;
	
	public int getBiNo() {
		return biNo;
	}
	public void setBiNo(int biNo) {
		this.biNo = biNo;
	}
	public String getBiName() {
		return biName;
	}
	public void setBiName(String biName) {
		this.biName = biName;
	}
	public String getBiId() {
		return biId;
	}
	public void setBiId(String biId) {
		this.biId = biId;
	}
	public String getBiPwd() {
		return biPwd;
	}
	public void setBiPwd(String biPwd) {
		this.biPwd = biPwd;
	}
	public String getBiEmail() {
		return biEmail;
	}
	public void setBiEmail(String biEmail) {
		this.biEmail = biEmail;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	@Override
	public String toString() {
		return "BoardInfoVO [biNo=" + biNo + ", biName=" + biName + ", biId=" + biId + ", biPwd=" + biPwd + ", biEmail="
				+ biEmail + ", admin=" + admin + "]";
	}
}