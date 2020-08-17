package com.morackmorack.mvc.service.offmeet;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.MeetMemOffMeet;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;


public interface OffMeetService {
	
	public void addOff(OffMeet offMeet) throws Exception;

	public OffMeet getOff(int offNo) throws Exception;
    
    public void addOffPay(Pay pay) throws Exception;
    
    public void addBusinessPay(Pay pay) throws Exception;
    
    public Pay getOffPay(int payNo) throws Exception;
	
    public Pay getBusinessPay(int payNo) throws Exception;

    public List<OffMeet> getOffList(String meetId) throws Exception;
  
	public Map<String, Object> listOffPay(Search search, String userId) throws Exception;
	
	public Map<String,Object> listBusinessPay(Search search, String userId) throws Exception;
	
	public void addOff_MeetMem(int memNo, int offNo);
	
	public MeetMemOffMeet getOff_MeetMem(int memNo, int offNo) throws Exception;
	

	
}