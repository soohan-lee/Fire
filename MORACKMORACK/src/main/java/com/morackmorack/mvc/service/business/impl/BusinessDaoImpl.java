package com.morackmorack.mvc.service.business.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessDao;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;

//==> ȸ������ DAO CRUD ����
@Repository("businessDaoImpl")
public class BusinessDaoImpl implements BusinessDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public BusinessDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addBusiness(Business business) throws Exception {
		sqlSession.insert("BusinessMapper.addBusiness", business);
	}
	
	public Business getBusiness(String businessId) throws Exception {
		return sqlSession.selectOne("BusinessMapper.getBusiness", businessId);
	}
	
	public void updateBusiness(Business business) throws Exception {
		sqlSession.update("BusinessMapper.updateBusiness", business);
	}
	
	public List<Business> getBusinessList(Search search) throws Exception {
		return sqlSession.selectList("BusinessMapper.getBusinessList", search);
	}
	
	
	public List<Business> listBusiness(Search search) throws Exception {
		return sqlSession.selectList("BusinessMapper.listBusiness", search);
	}
	
	
	public void delBusiness(String businessId) throws Exception {
		sqlSession.delete("BusinessMapper.delBusiness", businessId);
	}
	

	
	
	
	
	public void addBusinessMenu(Menu menu) throws Exception {
		sqlSession.insert("BusinessMapper.addBusinessMenu", menu);
	}
	
	public List<Menu> listBusinessMenu(String businessId) throws Exception {
		return sqlSession.selectList("BusinessMapper.getBusinessMenuList", businessId);
	}
	
	public Menu getBusinessMenu(int menuNo) throws Exception {
		return sqlSession.selectOne("BusinessMapper.getBusinessMenu", menuNo);
	}
	
	public void updateBusinessMenu(Menu menu) throws Exception {
		sqlSession.update("BusinessMapper.updateBusinessMenu", menu);
	}
	
	public void delBusinessMenu(int menuNo) throws Exception {
		sqlSession.delete("BusinessMapper.delBusinessMenu", menuNo);
	}
	
	
	
	
	public void addReserveAbleTime(ReserveAble reserveAble) throws Exception {
		sqlSession.insert("BusinessMapper.addReserveAbleTime", reserveAble);
	}
	
	public void delReserveAbleTime(String businessId) throws Exception {
		sqlSession.delete("BusinessMapper.delReserveAbleTime", businessId);
	}
	
	public List<ReserveAble> listReserveAbleTime(String businessId) throws Exception {
		return sqlSession.selectList("BusinessMapper.getReserveAbleTimeList", businessId);
	}
	
	
	
	
	public List<ReserveAble> showReserveAbleTimeList(String businessId, String reserveDate) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("businessId", businessId);
		map.put("reserveDate", reserveDate);
		return sqlSession.selectList("BusinessMapper.showReserveAbleTimeList", map);
	}
	
	public ReserveAble getReservAbleTime(int reserveAbleNo) throws Exception {
		return sqlSession.selectOne("BusinessMapper.getReservAbleTime", reserveAbleNo);
	}
	
	public List<Pay> getUsedBusinessList(String userId) throws Exception {
		return sqlSession.selectList("BusinessMapper.getUsedBusinessList", userId);
	}

}
