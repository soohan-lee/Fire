package com.morackmorack.mvc.offmeet;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.offmeet.OffMeetService;


//import com.siot.IamportRestHttpClientJava.IamportClient;
//import com.siot.IamportRestHttpClientJava.response.IamportResponse;
//import com.siot.IamportRestHttpClientJava.response.Payment;


@RestController
@RequestMapping("/offmeet/*")
public class OffMeetRestController {
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Autowired
	@Qualifier("offMeetServiceImpl")
	private OffMeetService offMeetService;
	
	public OffMeetRestController() {
		System.out.println(this.getClass());
	}
	
	
	
//	 IamportClient client;
//		
//		public void setup() throws Exception {
//			String api_key = "8144146803643309";
//			String api_secret = "jDu4riOhpjKzKorOH3e5rh0SNELoPVi9zMe152jum347rwV9z9f1qfTdUFCJBUTaH7cMavhxylE0Rzar";
//			
//			client = new IamportClient(api_key, api_secret);
//		}
//		
//		public void testGetToken() throws Exception {
//			String token = client.getToken();
//			System.out.println("token : " + token);
//		}
//		
//
//	public void testGetPaymentByImpUid() throws Exception {		
//			IamportResponse<Payment> paymentByimpuid = client.paymentByImpUid("imp45686118");
//			System.out.println(paymentByimpuid.getResponse().getImpUid());
//		}		

 @RequestMapping(value = "json/addOffPay", method = RequestMethod.POST)
	public Pay addOffPay(@RequestBody Pay pay ) throws Exception {
		offMeetService.addOffPay(pay);
		return pay;
	}	
 	
// @RequestMapping(value="json/listOff/{page}")
//	public List<OffMeet> listOff(@PathVariable int page) throws Exception {
//	
//	 List<OffMeet> getOffList = new ArrayList<OffMeet>();
//
//		Search search = new Search(); 
//
//		search.setCurrentPage(page);		
//		search.setPageSize(pageSize);
//					 
//
//		return (List<OffMeet>) offMeetService.getOffList(meetId);
//	}
 
 @RequestMapping(value="json/listOffMem/{offNo}" , method=RequestMethod.GET)
	public Map listOffMem(@PathVariable int offNo) throws Exception {
		
		System.out.println("/join/json/listOffMem");
		
		Search search = new Search();
		search.setSearchKeyword(Integer.toString(offNo));
		
		return offMeetService.listOffMem(search);
	}
 
 
//	@RequestMapping(value="/json/delOffMeet/{offNo}", method=RequestMethod.GET )
//	public void delOffMeet(@PathVariable int offNo, HttpServletResponse response) throws Exception {
//		
//		System.out.println("/offmeet/json/delOffMeet : GET");
//		
//		PrintWriter out = response.getWriter();
//		
//		offMeetService.delOffMeet(offNo);
//		
//		JSONObject obj = new JSONObject();
//		obj.put("msg", "���� ����!");
//		out.println(obj);
//	}	
}
