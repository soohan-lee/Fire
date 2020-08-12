package com.morackmorack.mvc.service.community;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Comments;
import com.morackmorack.mvc.service.domain.Community;

public interface CommunityService {

	public void addPost(Community community) throws Exception ;
	
	public Map<String,Object> getPostList(Search search, String meetId) throws Exception ;
	
	public Community getPost(int postNo) throws Exception ;
	
	public void updatePost(Community community) throws Exception ;
	
	public void deletePost (int postNo) throws Exception ;
	
	public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception;
//	////´ñ±Û
	public void addComments(Comments comments) throws Exception ;
	
	public Comments getComments(int commentNo) throws Exception ;
	
	public void updateComments(Comments comments) throws Exception ;
	
	public Map<String, Object> getCommentsList(int postNo) throws Exception ;
	
	public void deleteComments(Comments comments) throws Exception ;

}

