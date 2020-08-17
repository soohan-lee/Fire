package com.morackmorack.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.friend.FriendDao;

@Repository("friendDaoImpl")
public class FriendDaoImpl implements FriendDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void reqFriend(Friend friend) throws Exception {
		sqlSession.insert("FriendMapper.reqFriend", friend);
	}

	public Map<String,Object> listRecvFriend(String receiverId) throws Exception{
		List<Friend> listRecvFriend = sqlSession.selectList("FriendMapper.listRecvFriend", receiverId);
		
		for(int i = 0 ; i<listRecvFriend.size(); i++) {
			listRecvFriend.get(i).setReqFriend(sqlSession.selectOne("UserMapper.getUser", listRecvFriend.get(i).getReqFriend().getUserId()));
		}
		int friendCount = sqlSession.selectOne("FriendMapper.getTotalCount", receiverId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listRecvFriend", listRecvFriend);
		map.put("friendCount", friendCount);
		
		return map;
	}

	public Map<String, Object> listFriend(String userId) throws Exception{
		List<Friend> listFriend = sqlSession.selectList("FriendMapper.listFriend", userId);
		
		for(int i=0; i<listFriend.size(); i++) {
			listFriend.get(i).setReqFriend(sqlSession.selectOne("UserMapper.getUser", listFriend.get(i).getReqFriend().getUserId()));
			listFriend.get(i).setRecvFriend(sqlSession.selectOne("UserMapper.getUser", listFriend.get(i).getRecvFriend().getUserId()));		
			
			if(! userId.equals(listFriend.get(i).getReqFriend().getUserId())) {
				listFriend.get(i).setMyFriend(listFriend.get(i).getReqFriend());
			}else {
				listFriend.get(i).setMyFriend(listFriend.get(i).getRecvFriend());
			}	
		}

		
		int friendCount = sqlSession.selectOne("FriendMapper.getTotalCount", userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listFriend", listFriend);
		map.put("friendCount", friendCount);
		
		return map;
	}

	public Friend getFriend(int friendNo) throws Exception{
		return sqlSession.selectOne("FriendMapper.getFriend", friendNo);
	}

	public void okFriend(int friendNo) throws Exception{
		sqlSession.selectOne("FriendMapper.okFriend", friendNo);
	}

	public void delFriend(int friendNo) throws Exception{
		sqlSession.selectOne("FriendMapper.delFriend", friendNo);
	}

	public boolean isFriend(String userId, String meetMemId) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("meetMemId", meetMemId);

		if( sqlSession.selectOne("FriendMapper.isFriend", map) != null) {
			return true;
		}else {
			return false;
		}
	}
}