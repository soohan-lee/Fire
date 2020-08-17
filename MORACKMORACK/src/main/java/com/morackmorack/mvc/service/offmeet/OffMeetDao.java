package com.morackmorack.mvc.service.offmeet;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.MeetMemOffMeet;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//�������� ���� ����
	public void addOff(OffMeet offMeet) throws Exception;
	//�������� ���� �� ��ȸ
	public OffMeet getOff(int offNo) throws Exception;
    //�������� ���� ����
    public void addOffPay(Pay pay) throws Exception;
    //���� ��ü ����
    public void addBusinessPay(Pay pay) throws Exception;
    //�������� ���� ���� �� ��ȸ
    public Pay getOffPay(int payNo) throws Exception;
	//���� ��ü ���� �� ��ȸ
    public Pay getBusinessPay(int payNo) throws Exception;
     //�������� ���� ����Ʈ ��ȸ
    public List<OffMeet> getOffList(String meetId) throws Exception;

    //������ ��� ���� ī��Ʈ 
    public int getOffPayTotalCount(String userId) throws Exception;
    
	//������ ��� ���� ����Ʈ ��ȸ
	public List<OffMeet> listOffPay(Search search, String userId) throws Exception;
	
	//���� ��ü ���� ���� ����Ʈ ��ȸ
	public List<Pay> listBusinessPay(Search search, String userId) throws Exception;
	
	public int getBusinessPayTotalCount(String userId) throws Exception;
	
	public void addOff_MeetMem(int memNo, int offNo);
	
	public MeetMemOffMeet getOff_MeetMem(int memNo, int offNo) throws Exception;
	
}