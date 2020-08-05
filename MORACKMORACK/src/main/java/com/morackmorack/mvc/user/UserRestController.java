package com.morackmorack.mvc.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			return dbUser;
		}else {
			User user2 = new User();
			return user2;
		}
		
		
	}
	
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.GET)
	public  Map checkDuplication( @PathVariable String userId) throws Exception{
		
		System.out.println("/user/checkDuplication : GET");
		System.out.println(userId);
		
		boolean result=userService.checkDuplication(userId);
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		
		sendMap.put("result", new Boolean(result));
		sendMap.put("userId", userId);
		
		return sendMap;
	}
	
	@RequestMapping( value="json/checkDuplication2/{nickName}", method=RequestMethod.GET)
	public  Map checkDuplication2( @PathVariable String nickName) throws Exception{
		
		System.out.println("/user/checkDuplication2 : GET");
		System.out.println(nickName);
		
		boolean result=userService.checkDuplication2(nickName);
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		
		sendMap.put("result", new Boolean(result));
		sendMap.put("nickName", nickName);
		
		return sendMap;
	}
	
}