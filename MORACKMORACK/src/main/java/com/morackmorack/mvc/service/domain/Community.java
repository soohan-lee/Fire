package com.morackmorack.mvc.service.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Community {
	
	private String postNo;
	private char communityName;
	private User  user;
	private Meet meet; 
	private String title; 
	private String content;
	private Date regDate;
    private Date modDate;
    private int viewCount;
    private int likeCount;
    private int rvStar;
    
	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public char getCommunityName() {
		return communityName;
	}

	public void setCommunityName(char communityName) {
		this.communityName = communityName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Meet getMeet() {
		return meet;
	}

	public void setMeet(Meet meet) {
		this.meet = meet;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getRvStar() {
		return rvStar;
	}

	public void setRvStar(int rvStar) {
		this.rvStar = rvStar;
	}

	public Community() {
	
	}

	@Override
	public String toString() {
		return "Community [postNo=" + postNo + ", communityName=" + communityName + ", user=" + user + ", meet=" + meet
				 + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", viewCount=" + viewCount + ", likeCount=" + likeCount + ", rvStar="
				+ rvStar + "]";
	}

}
