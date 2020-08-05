package com.morackmorack.mvc.friend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.friend.FriendService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public FriendController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="reqFriend" , method = RequestMethod.GET) //ģ�� ��û ���ڷ� ��� ���̵� ����
	public ModelAndView reqFriend(HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam("meetId") String meetId) throws Exception {
		System.out.println("/friend/reqFriend : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User reqFriend = (User) session.getAttribute("user"); //������ �� ���̵�
		
		Friend friend = new Friend();
		friend.setReqFriend(reqFriend); //�� ���̵�
		
		User recvFriend = userService.getUser(userId);	
		friend.setRecvFriend(recvFriend); //��� ���̵�
		
		friendService.reqFriend(friend);
		
		mav.setViewName("/meet/listMeetMem/"+meetId); 
	
		return mav;
	}
	
	@RequestMapping(value="listFriend/{listFlag}" , method = RequestMethod.GET) //ģ�� ����Ʈ
	public ModelAndView listFriend(HttpServletRequest request, @PathVariable("listFlag") String listFlag, @RequestParam(value = "isModal", required = false) String isModal, @RequestParam(value = "meetId", required = false) String meetId) throws Exception {	
		System.out.println("/friend/listFriend : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
		 	mav.setViewName("/user/loginView.jsp");
			return mav;
		 }
		
		String userId = user.getUserId();
		
		List<Friend> listFriend = new ArrayList<Friend>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(listFlag.equals("0")) {
			listFriend = friendService.listRecvFriend(userId);
			mav.addObject("listFriend", listFriend);
			mav.setViewName("/friend/listRecvFriend.jsp"); //������ ģ�� ��û�� ��� (listRecvFriend.jsp ���������� ����/����)			
		}else if(listFlag.equals("1")) {
			map = friendService.listFriend(userId);
			mav.addObject("listFriend", map.get("listFriend"));
			mav.addObject("friendCount",map.get("friendCount"));
			
			 if (isModal== null)  {
					mav.setViewName("/friend/listFriend.jsp"); // �� ģ�� ���
			 }else if (isModal.equals("1")) {
				mav.addObject("isModal", "1");
				mav.setViewName("/message/sendMessage.jsp");
			} else if(isModal.equals("2")) {
				mav.addObject("isModal", "2");
				mav.setViewName("/meet/getMeet/"+meetId);
			}
		}

		return mav;
	}
	
	@RequestMapping(value="getFriend/{friendNo}" , method = RequestMethod.GET) //ģ�� ����ȸ
	public ModelAndView getFriend(@PathVariable("friendNo") int friendNo) throws Exception {
		System.out.println("/friend/getFriend/ : GET");
		
		ModelAndView mav = new ModelAndView();
		
		Friend friend = new Friend();
		friend = friendService.getFriend(friendNo);
		
		mav.addObject("friend", friend);
		mav.setViewName("/friend/getFriend.jsp");
		
		return mav;		
	}

	@RequestMapping(value="mangFriend/{friendNo}/{friendFlag}") //0�̸� ģ�� ���� 1�̸� ģ�� ��û
	public ModelAndView mangFriend(@PathVariable("friendNo") int friendNo, @PathVariable("friendFlag") String friendFlag) throws Exception {	
		System.out.println("/friend/mangFriend/ : GET");
		
		ModelAndView mav = new ModelAndView();
		
		if(friendFlag.equals("0")) {
			friendService.delFriend(friendNo);
		}else if(friendFlag.equals("1")){
			friendService.okFriend(friendNo);
		}
		
		mav.setViewName("/friend/listFriend/1");
		
		return mav;
	}
}
