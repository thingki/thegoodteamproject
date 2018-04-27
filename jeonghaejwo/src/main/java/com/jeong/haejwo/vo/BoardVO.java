package com.jeong.haejwo.vo;

public class BoardVO {
	
	/*CREATE TABLE board(
			boardNo int unsigned NOT NULL AUTO_INCREMENT,
			-- 해당 API에서 제공하는 고유번호
			userNo varchar(100) NOT NULL COMMENT '해당 API에서 제공하는 고유번호',
			boardtitle varchar(100)  NOT NULL,
			boardContent text(500) NOT NULL,
			regist datetime,
			hit double default '0',
			PRIMARY KEY (boardNo),
			UNIQUE (userNo)
		);*/
	
	
	private int idx;
	private String userId;
	private String userName;
	private String title;
	private String content;
	private String regist;
	private int hit;
	private int point;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", userId=" + userId + ", userName=" + userName + ", title=" + title
				+ ", content=" + content + ", regist=" + regist + ", hit=" + hit + ", point=" + point + "]";
	}
	
	
	
}
