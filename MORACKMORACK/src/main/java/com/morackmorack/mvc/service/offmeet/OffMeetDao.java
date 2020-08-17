package com.morackmorack.mvc.service.offmeet;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.MeetMemOffMeet;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//오프라인 모임 생성
	public void addOff(OffMeet offMeet) throws Exception;
	//오프라인 모임 상세 조회
	public OffMeet getOff(int offNo) throws Exception;
    //오프라인 모임 결제
    public void addOffPay(Pay pay) throws Exception;
    //제휴 업체 결제
    public void addBusinessPay(Pay pay) throws Exception;
    //오프라인 모임 결제 상세 조회
    public Pay getOffPay(int payNo) throws Exception;
	//제휴 업체 결제 상세 조회
    public Pay getBusinessPay(int payNo) throws Exception;
     //오프라인 모임 리스트 조회
    public List<OffMeet> getOffList(String meetId) throws Exception;

    //참여비 사용 내역 카운트 
    public int getOffPayTotalCount(String userId) throws Exception;
    
	//참여비 사용 내역 리스트 조회
	public List<OffMeet> listOffPay(Search search, String userId) throws Exception;
	
	//제휴 업체 결제 내역 리스트 조회
	public List<Pay> listBusinessPay(Search search, String userId) throws Exception;
	
	public int getBusinessPayTotalCount(String userId) throws Exception;
	
	public void addOff_MeetMem(int memNo, int offNo);
	
	public MeetMemOffMeet getOff_MeetMem(int memNo, int offNo) throws Exception;
	
}