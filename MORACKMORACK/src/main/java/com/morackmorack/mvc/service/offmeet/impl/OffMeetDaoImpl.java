package com.morackmorack.mvc.service.offmeet.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.MeetMemOffMeet;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.WishMeet;
import com.morackmorack.mvc.service.offmeet.OffMeetDao;

@Repository("offMeetDaoImpl")
public class OffMeetDaoImpl implements OffMeetDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public OffMeetDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addOff(OffMeet offMeet) throws Exception {
		sqlSession.insert("OffMeetMapper.addOff", offMeet);	
	}
	
	public void updateOff(OffMeet offMeet) throws Exception {
		sqlSession.update("OffMeetMapper.updateOff", offMeet);
	}
	

	public void delOffMeet(int offNo) throws Exception {
		sqlSession.delete("OffMeetMapper.delOffMeet", offNo);
	}
	
	
	public OffMeet getOff(int offNo) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getOff", offNo);
	}

	public void addOffPay(Pay pay) throws Exception {
		sqlSession.insert("OffMeetMapper.addOffPay", pay);
		sqlSession.update("OffMeetMapper.updateOffMem", pay);
	}

	public void addBusinessPay(Pay pay) throws Exception {
		sqlSession.insert("OffMeetMapper.addBusinessPay", pay);
	}
	
	public Pay getOffPay(int payNo) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getOffPay", payNo);
	}

	public Pay getBusinessPay(int payNo) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getBusinessPay", payNo);
	}

	@Override
	public List<OffMeet> getOffList(String meetId) throws Exception {
		return sqlSession.selectList("OffMeetMapper.getOffList", meetId);
	}
	
	
	public int getOffTotalCount(String userId) throws Exception {
		
		return sqlSession.selectOne("OffMeetMapper.getOffTotalCount", userId);
	}
	
	@Override
	public int getOffPayTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getOffPayTotalCount", userId);
	}

	public List<OffMeet> listOffPay(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("search", search);

		map.put("userId", userId);
		
		System.out.println("map===="+ map);
		return sqlSession.selectList("OffMeetMapper.listOffPay", map);
	}
	
	public List<Pay> listOffMem(Search search) throws Exception {
		return sqlSession.selectList("OffMeetMapper.getOffMemList", search);
	}
	
	public int getTotalOffMemCount(Search search) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getTotalOffMemCount", search);
	}
	
	public List<Pay> listBusinessPay(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId",userId);
		return sqlSession.selectList("OffMeetMapper.listBusinessPay", map);
	}

	public int getBusinessPayTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getBusinessPayTotalCount", userId);
	}
	

	@Override
	public void addOff_MeetMem(int memNo, int offNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("offNo", offNo);
		
		sqlSession.insert("OffMeetMapper.addOff_MeetMem", map);
	}

	@Override
	public MeetMemOffMeet getOff_MeetMem(int memNo, int offNo) throws Exception {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("offNo", offNo);
	
		return	 sqlSession.selectOne("OffMeetMapper.getOff_MeetMem", map);
	}
	
	
}