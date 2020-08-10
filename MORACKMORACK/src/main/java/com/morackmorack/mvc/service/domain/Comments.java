package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comments implements Serializable{
	
	private int commentNo;
	private int postNo;
	private User user;
	private String coContent;
	private Timestamp regDate;
	private Integer parentCommentNo;
	private int commentLevel;
	
	
	
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCoContent() {
		return coContent;
	}
	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Integer getParentCommentNo() {
		return parentCommentNo;
	}
	public void setParentCommentNo(Integer parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}
	
	@Override
	public String toString() {
		return "Comments [commentNo=" + commentNo + ", postNo=" + postNo + ", user=" + user + ", commentContent="
				+ coContent + ", regDate=" + regDate + ", parentCommentNo=" + parentCommentNo + ", commentLevel="
				+ commentLevel + "]";
	}

}
