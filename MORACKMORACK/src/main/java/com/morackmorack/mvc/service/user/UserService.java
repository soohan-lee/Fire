package com.morackmorack.mvc.service.user;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception ;
	
	public User getNickName(String nickName) throws Exception ;
	
	public void updateUser(User user) throws Exception ;
	
	public boolean checkDuplication(String userId) throws Exception;
	
	public boolean checkDuplication2(String nickName) throws Exception;
	
	public void delUser(User user) throws Exception ;
	
}