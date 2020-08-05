package com.morackmorack.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user); // 유저 정보 insert
	}

	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public User getNickName(String nickName) throws Exception {
		User user = sqlSession.selectOne("UserMapper.getNickName", nickName);
		
		return user;
	}

	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	public void delUser(User user) throws Exception {
		sqlSession.delete("UserMapper.delUser", user);
		
	}
	
}