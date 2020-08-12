package com.morackmorack.mvc.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.Hashtag;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;
import com.morackmorack.mvc.service.meet.MeetService;

@RestController
@RequestMapping("/meet/*")
public class MeetRestController {
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	@ResponseBody
	@RequestMapping(value  = "/json/getHashtag")
	public List<String>getHashtag(@RequestBody Map<String, Object>params ) {
		System.out.println("meet/json/getHashtag");
		
		List<String> listHash = meetService.getHashtagFromMain((String) params.get("hash"));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+listHash);
		
		return listHash;
	
	}

	
	@RequestMapping(value = "json/addWishMeet/{meetId}", method = RequestMethod.GET)
	public Map addWishMeet(HttpServletRequest request,  @PathVariable("meetId") String meetId) {
		System.out.println("dddd");
		Map map = new HashMap();
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		Meet meet = meetService.getMeet(meetId);
		String userId = user.getUserId();
		
		WishMeet wishMeet = meetService.getWishMeet(meetId, user.getUserId());
		
		if(wishMeet==null) {
			wishMeet = new WishMeet();
			wishMeet.setMeet(meet);
			wishMeet.setUserId(userId);
			
		meetService.addWishMeet(userId, meetId);
		
		map.put("message", "ok");
		}
		else {
			map.put("message", "fail");
		}
		return map;
	}
	

	@RequestMapping(value = "json/delWishMeet/{meetId}", method = RequestMethod.GET)
	public Map delWishMeet(HttpServletRequest request, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/delWishMeet :GET");
		System.out.println("¿©±â");
		Map map = new HashMap();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		meetService.delWishMeet(userId, meetId);
	    
		String	 message = "1";

		map.put("result", message);
    	System.out.println("map=========="+map);
		return map;
	}
	

	
}
