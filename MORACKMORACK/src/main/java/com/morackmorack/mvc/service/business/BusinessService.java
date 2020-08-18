package com.morackmorack.mvc.service.business;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;

public interface BusinessService {
	
	// ���� ��û(��ü ����)
	public void addBusiness(Business business) throws Exception;
	
	// ��ü ���� ����(��ü�� �ڱ� ���� �����ϰ��� �Ҷ� �������� ������)
	public Business getBusiness(String businessId) throws Exception;
	
	// ��ü ���� ����
	public void updateBusiness(Business business) throws Exception;
	
	// ��ü ���
	public List<Business> getBusinessList(Search search) throws Exception;
	
	
	public List<Business> listBusiness(Search search) throws Exception;
	
	
	// ���� ����(��ü Ż��)
	public void delBusiness(String businessId) throws Exception;
	
	
	

	// �޴� ���
	public void addBusinessMenu(Menu menu) throws Exception;
	
	// �޴�����Ʈ
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// �޴� ��
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// �޴� ����
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// �޴� ����
	public void delBusinessMenu(int menuNo) throws Exception;
	
	
	
	
	// ���� ���� �ð� ���
	public void addReserveAbleTime(ReserveAble reserveAble) throws Exception;
	
	// ���� ���� �ð� ��ü ����
	public void delReserveAbleTime(String businessId) throws Exception;
	
	// ���� ���� �ð� ���
	public List<ReserveAble> listReserveAbleTime(String businessId) throws Exception;
	
	
	
	
	// ���� ȭ���� ���� ���� ���� �ð� ���
	public List<ReserveAble> showReserveAbleTimeList(String businessId, String reserveDate) throws Exception;
	
	// ���డ�ɽð� ��ȣ�� ���� �ð� ��������
	public ReserveAble getReservAbleTime(int reserveAbleNo) throws Exception;
	
	// �̿��� ��ü ���
	public List<Pay> getUsedBusinessList(String userId) throws Exception;
	
}
