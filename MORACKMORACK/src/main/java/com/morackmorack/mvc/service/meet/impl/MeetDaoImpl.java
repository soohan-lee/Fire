package com.morackmorack.mvc.service.meet.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Category;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Hashtag;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;
import com.morackmorack.mvc.service.meet.MeetDao;

@Repository("meetDaoImpl")
public class MeetDaoImpl implements MeetDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void addLimg(Files file) {
		sqlSession.insert("MeetMapper.addLimg", file);
	}
	
	public  List<Meet> getMeetMain(){
		return sqlSession.selectList("MeetMapper.getMeetMain");
	}
	
	public List<Category> listCategory() {
		return sqlSession.selectList("MeetMapper.listCategory");
	}
	
	public void addMeet(Meet meet) {
	sqlSession.insert("MeetMapper.addMeet", meet);
}
	
	public Meet getMeet(String meetId) {
		Meet meet = sqlSession.selectOne("MeetMapper.getMeet", meetId);	
		meet.setHashtag(sqlSession.selectList("MeetMapper.getMeetHashtag", meetId));
		meet.setlImg(sqlSession.selectList("MeetMapper.getLimg", meetId));
		
		return meet;
	}
	
	public void updateMeet(Meet meet) {
		sqlSession.update("MeetMapper.updateMeet", meet);
	}
	
	public List<Meet> listMeet(Search search){
		return sqlSession.selectList("MeetMapper.listMeet", search);
	}
	
	public List<Meet> listMeetFromMain(){
		List<Integer> categoryNo = null;
		return sqlSession.selectList("MeetMapper.listMeetMain", categoryNo);
	}
	
	public List<Meet> listMeetFromMain(List<String> categoryName){
		return sqlSession.selectList("MeetMapper.listMeetMain", categoryName);
	}
	
	public List<Meet> listMeetRank(){
		return sqlSession.selectList("MeetMapper.listMeetRank");
	}
	
	public void outMeet(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		
		sqlSession.delete("MeetMapper.outMeet", map);
	}
	
	public void delMeet(String meetId){	
		sqlSession.delete("MeetMapper.delHash", meetId);
		sqlSession.delete("MeetMapper.delMeetWithReqJoinUser", meetId);
		sqlSession.delete("MeetMapper.delMeet", meetId);
	}
	
	public void joinMeet(MeetMem meetMem){
		sqlSession.insert("MeetMapper.joinMeet", meetMem);
	}
	
	public void addMemNum(String meetId) {
		sqlSession.update("MeetMapper.addMemNum", meetId);
	}
	
	public MeetMem getMeetMem(String meetId, String userId){
		Map map = new HashMap();
		map.put("meetId", meetId);
		map.put("userId", userId);
		
		return sqlSession.selectOne("MeetMapper.getMeetMem", map);				
	}
	
	public List<MeetMem> listMeetMem(String meetId){
		List<MeetMem> listMeetMem = sqlSession.selectList("MeetMapper.listMeetMem", meetId);	
		for(int i=0; i<listMeetMem.size(); i++) {
			listMeetMem.get(i).setUser((User)sqlSession.selectOne("UserMapper.getUser", listMeetMem.get(i).getUser().getUserId()));
			listMeetMem.get(i).setMeet((Meet)sqlSession.selectOne("MeetMapper.getMeet", listMeetMem.get(i).getMeet().getMeetId()));
		}
		
		return listMeetMem;
	}
	
	public  List<MeetMem> listJoinMeetUser(String meetId){
		List<MeetMem> listJoinMeetUser = sqlSession.selectList("MeetMapper.listJoinMeetUser", meetId);	
		for(int i=0; i<listJoinMeetUser.size(); i++) {
			listJoinMeetUser.get(i).setUser((User)sqlSession.selectOne("UserMapper.getUser", listJoinMeetUser.get(i).getUser().getUserId()));
			listJoinMeetUser.get(i).setMeet((Meet)sqlSession.selectOne("MeetMapper.getMeet", listJoinMeetUser.get(i).getMeet().getMeetId()));
		}
		
		return listJoinMeetUser;
	}
	
	public void okJoinMeetUser(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		sqlSession.update("MeetMapper.okJoinMeetUser", map);
	}
	
	public void refuseJoinMeetUser(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		sqlSession.update("MeetMapper.refuseJoinMeetUser", map);
	}
	
	public void provideStaff(String userId, String meetId, String pstnNum){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		map.put("pstnNum", pstnNum);
		
		sqlSession.update("MeetMapper.provideStaff", map);
	}
	
	public void provideLeader(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		
		sqlSession.update("MeetMapper.provideLeader", map);
	}
	
	public List<MeetMem> listMyMeet(String userId){
		List<MeetMem> listMyMeet = sqlSession.selectList("MeetMapper.listMyMeet", userId);	
		for(int i=0; i<listMyMeet.size(); i++) {
			listMyMeet.get(i).setUser((User)sqlSession.selectOne("UserMapper.getUser", listMyMeet.get(i).getUser().getUserId()));
			listMyMeet.get(i).setMeet((Meet)sqlSession.selectOne("MeetMapper.getMeet", listMyMeet.get(i).getMeet().getMeetId()));
		}		
			return listMyMeet;
	}
	
	public void addWishMeet(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		
		sqlSession.insert("MeetMapper.addWishMeet", map);
	}
	
	public WishMeet getWishMeet(String meetId, String userId) {
		Map map = new HashMap();
		map.put("meetId", meetId);
		map.put("userId", userId);
		
		
		return sqlSession.selectOne("MeetMapper.getWishMeet", map);
	}
	
	public Map listWishMeet(String userId){
		List<WishMeet> listWishMeet = sqlSession.selectList("MeetMapper.listWishMeet", userId);
		
		for(int i=0; i<listWishMeet.size(); i++) {
			listWishMeet.get(i).setMeet(sqlSession.selectOne("MeetMapper.getMeet", listWishMeet.get(i).getMeet().getMeetId()));
		}
		
		int wishCount = sqlSession.selectOne("MeetMapper.getWishMeetCount", userId);
		
		Map map = new HashMap();
		map.put("listWishMeet", listWishMeet);
		map.put("wishCount", wishCount);
				
		return map;
	}
	
	public void delWishMeet(String userId, String meetId){
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("meetId", meetId);
		sqlSession.delete("MeetMapper.delWishMeet", map);
	}
	
	public String getHash(String hashtag) {
		return sqlSession.selectOne("MeetMapper.getHash", hashtag);
	}
	
	public List<String> getHashtagFromMain(String hashtag) {
		List<String> listHash = sqlSession.selectList("MeetMapper.getHashtagFromMain", hashtag);
		 
		/*
		 * for(int i=0; i<listHash.size(); i++) {
		 * System.out.println(">>>>>>>>>>>>>>>>>"+ listHash); String subHash =
		 * listHash.get(i).toString(); listHash.set(i, subHash.substring(11));
		 * System.out.println(">>>>>>>>>>>>>>>>>"+ listHash); }
		 */
	 
		 return listHash;
	}
	
	public void addHash(String hashtag) {
		sqlSession.insert("MeetMapper.addHash", hashtag);
	}
	
	public void addMeet_Hash(String meetId, String hashNo) {
		Map map = new HashMap();
		map.put("meetId", meetId);
		map.put("hashNo", hashNo);
		
		sqlSession.insert("MeetMapper.addMeet_Hash", map);
	}
}
