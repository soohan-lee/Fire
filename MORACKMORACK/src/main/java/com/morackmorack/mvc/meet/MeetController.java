package com.morackmorack.mvc.meet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.community.CommunityService;
import com.morackmorack.mvc.service.domain.Category;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;
import com.morackmorack.mvc.service.friend.FriendService;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/meet/*")
public class MeetController {

	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['attachPath']}")
	String attach_path;
	
	@Value("#{commonProperties['meetFilePath']}")
	String uploadPath;

	public MeetController() {

	}

	@RequestMapping(value = "addMeet", method = RequestMethod.GET)
	public ModelAndView addMeet(HttpServletRequest request) throws Exception {
		System.out.println("/meet/addMeet : GET");

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		String message = "";

		if (user == null) {
			mav.setViewName("/user/loginView.jsp");
			return mav;
		}

		Boolean checkMeetCount = meetService.checkJoinMeetCount(user.getMeetCount());

		if (checkMeetCount == true) {
			List<Category> category = meetService.listCategory();
			mav.addObject("category", category);
			mav.setViewName("/meet/addMeet.jsp");
			return mav;
		} else {
			message = "2";
			mav.setViewName("/meet/listMyMeet?message=" + message);
			return mav;
		}
	}

	@RequestMapping(value = "addMeet/{maxNum}", method = RequestMethod.POST)
	public ModelAndView addMeet(HttpServletRequest request, @ModelAttribute("meet") Meet meet,
			@PathVariable("maxNum") int maxNum, MultipartHttpServletRequest mtf) throws Exception {
		System.out.println("/meet/addMeet : POST");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		user = userService.getUser(userId);

		String uuid = (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 14);
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyMMdd");
		String meetId = uuid + simpleDate.format(date);

		List<MultipartFile> fileList = mtf.getFiles("file");

		String root_path = request.getSession().getServletContext().getRealPath("/"); 

		if (fileList != null) {
			int imgIndex = -1;

			for (MultipartFile mf : fileList) {
				imgIndex++;
				
				try {
					String fileName = mf.getOriginalFilename();
					
					fileName = communityService.uploadFile(uploadPath, fileName, mf.getBytes());

					long fileSize = mf.getSize();
					
					if (imgIndex == 0) {
						meet.setMeetImg(fileName);
						mf.transferTo(new File(root_path+attach_path+fileName));
					} else {
						Files file = new Files();
						file.setFileName(fileName);
						file.setFileExtension(fileName.substring(fileName.lastIndexOf(".")));
						file.setFileSize(fileSize);
						file.setMeetId(meetId);
						meetService.addLimg(file);
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			meet.setMeetImg("empty_Img.png");
		}

		meet.setMeetId(meetId);
		meet.setLeaderId(userId);
		meet.setMaxNum(maxNum);

		String bank = meet.getBank();
		int len = 0;

		System.out.println(bank);

		if (bank.equals("���") || bank.equals("����")) {
			len = 14;
		} else if (bank.equals("����") || bank.equals("�츮")) {
			len = 13;
		} else if (bank.equals("�ѱ���Ƽ") || bank.equals("����")) {
			len = 12;
		} else if (bank.equals("SC����")) {
			len = 11;
		}

		Random rand = new Random();
		String accNum = "";

		for (int i = 0; i < len; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			accNum += ran;
		}
		meet.setAccNum(accNum);

		meetService.addMeet(meet);
		
		String hash = (String) request.getParameter("hash");
		
		if (hash != null) {

			String[] hashSplit = hash.split("#");

			for (int i = 1; i < hashSplit.length; i++) {
				String hashtag = hashSplit[i].trim();

				String hash_no = meetService.getHash(hashtag);
				if (hash_no == null) {
					meetService.addHash(hashtag);
					hash_no = meetService.getHash(hashtag);
					meetService.addMeet_Hash(meetId, hash_no);
				} else {
					meetService.addMeet_Hash(meetId, hash_no);
				}
			}
		}

		if (meet.getMeetType() == '1') {
			user.setMeetCount(user.getMeetCount() + 1);
			userService.updateUser(user);
			user = userService.getUser(userId);
		}

		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('1');
		meetMem.setMeetRole('0');

		meetService.joinMeet(meetMem);
		meetService.addMemNum(meetId);

		meet = meetService.getMeet(meetId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/meet/getMeet/" + meetId);
		return mav;
	}

	@RequestMapping(value = "listMeet", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMeet(@ModelAttribute("search") Search search, @RequestParam(value = "searchType2", required = false) String searchType2) {
		System.out.println("/meet/listMeet  : GET");

		if (searchType2 != null) {
			search.setSearchType(searchType2);
			search.setSearchCondition("0");
		}

		List<Meet> listMeet = meetService.listMeet(search);
		List<Category> listCategory = meetService.listCategory();

		ModelAndView mav = new ModelAndView();
		mav.addObject("listMeet", listMeet);
		mav.addObject("search", search);
		mav.addObject("listCategory", listCategory);
		mav.setViewName("/meet/listMeet.jsp");

		return mav;
	}

	@RequestMapping(value = "getMeet/{meetId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getMeet(HttpServletRequest request, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/getMeet : GET");
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		
		if(user != null) {
			String userId = user.getUserId();
			MeetMem meetMem = meetService.getMeetMem(meetId, userId);
		
			
			if(meetMem != null) {
				mav.addObject("meetMem", meetMem);
			}					
			
		}
			
		Meet meet = meetService.getMeet(meetId);
		
		mav.addObject("meet", meet);
		mav.setViewName("/meet/getMeet.jsp");

		return mav;
	}

	@RequestMapping(value = "joinMeet", method = RequestMethod.GET)
	public ModelAndView joinMeet(HttpServletRequest request, @RequestParam("meetId") String meetId) throws Exception {
		System.out.println("/meet/joinMeet : GET");

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		if (user == null) {
			mav.setViewName("/user/loginView.jsp");
			return mav;
		}

		String userId = user.getUserId();

		user = userService.getUser(userId);

		Meet meet = meetService.getMeet(meetId);

		String joinMessage = null;

		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('1');
		meetMem.setMeetRole('2');
		
		mav.setViewName("/meet/getMeet/"+meetId);
		mav.addObject("meet", meet);

		if (meet.getMaxNum() == meet.getMemNum()) {
			mav.addObject("joinMessage", "0"); // ���� �ο� �ʰ�
			return mav;
		}

		if (meet.getMeetType() == '0') { //2�� ����
			meetService.joinMeet(meetMem);
			meetService.addMemNum(meetId);
		} else{ //�ټ��� ����
			if (meetService.checkJoinMeetCount(user.getMeetCount())) {
						if (meet.isMeetAppr()) { // ���� ���� �ʿ�
							mav.addObject("joinMessage", "1"); 
							return mav;
						} else {
							meetService.joinMeet(meetMem);
							meetService.addMemNum(meetId);
							user.setMeetCount(user.getMeetCount() + 1);
							userService.updateUser(user);
							return mav;
						}
			} else {
				mav.addObject("joinMessage", "3"); // ������ ���� 5�� �ʰ�
			}
		}
		meet = meetService.getMeet(meetId);
		mav.addObject("meet", meet);
		return mav;
	}

	@RequestMapping(value = "joinMeet", method = RequestMethod.POST)
	public ModelAndView joinMeet(HttpServletRequest request) throws Exception {
		System.out.println("/meet/joinMeet : POST");

		String meetId = request.getParameter("meetId");
		String intro = request.getParameter("intro");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		Meet meet = new Meet();
		meet = meetService.getMeet(meetId);

		ModelAndView mav = new ModelAndView();

		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('0');
		meetMem.setMeetRole('2');
		meetMem.setIntro(intro);

		meetService.joinMeet(meetMem);

		user.setMeetCount(user.getMeetCount() + 1);
		userService.updateUser(user);

		mav.addObject("meet", meet);
		mav.setViewName("/meet/getMeet/"+meetId);

		return mav;
	}

	@RequestMapping(value = "listJoinMeetUser/{meetId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listJoinMeetUser(HttpServletRequest request, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/listJoinMeetUser : POST");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		
		if(user != null) {
			String userId = user.getUserId();
			MeetMem meetMem = meetService.getMeetMem(meetId, userId);
			
			if(meetMem != null) {
				mav.addObject("meetMem", meetMem);
			}				
		}

		List<MeetMem> listJoinMeetUser = new ArrayList<MeetMem>();
		listJoinMeetUser = meetService.listJoinMeetUser(meetId);

		for (int i = 0; i < listJoinMeetUser.size(); i++) {
			// ī�װ� get
		}

		mav.addObject("listJoinMeetUser", listJoinMeetUser);
		mav.setViewName("/meet/listJoinMeetUser.jsp");

		return mav;
	}

	@RequestMapping(value = "mangJoinMeetUser/{userId}/{joinFlag}", method = RequestMethod.POST)
	public String mangJoinMeetUser(@PathVariable("joinFlag") boolean joinFlag, @RequestParam("meetId") String meetId,
			@PathVariable("userId") String userId) {
		System.out.println("/meet/mangJoinMeetUser : POST");

		if (joinFlag == true) {
			meetService.okJoinMeetUser(userId, meetId);
		} else if (joinFlag == false) {
			meetService.refuseJoinMeetUser(userId, meetId);
		}

		return "/meet/listJoinMeetUser/" + meetId;
	}

	@RequestMapping(value = "listMeetMem/{meetId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMeetMem(HttpServletRequest request, @PathVariable("meetId") String meetId) throws Exception {
		System.out.println("/meet/listMeetMem : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		
		List<MeetMem> listMeetMem = new ArrayList<MeetMem>();
		listMeetMem = meetService.listMeetMem(meetId);
		
		if(user != null) {
			String userId = user.getUserId();
			MeetMem meetMem = meetService.getMeetMem(meetId, userId);
			
			if(meetMem != null) {
				mav.addObject("meetMem", meetMem);
			}	
		
		if(listMeetMem != null) {
			for(int i=0; i<listMeetMem.size(); i++) {
				if(!listMeetMem.get(i).getUser().getUserId().equals(userId)) {
//				if(friendService.isFriend(userId, listMeetMem.get(i).getUser().getUserId())){
//				listMeetMem.get(i).setFriendFlag(true);
//				}else {
//					listMeetMem.get(i).setFriendFlag(false);
//						}
					}
				}
			}
		}
		
		mav.addObject("listMeetMem", listMeetMem);
		mav.setViewName("/meet/listMeetMem.jsp");

		return mav;
	}

	@RequestMapping(value = "providePstn/{pstnNum}/{memId}/{meetId}", method = RequestMethod.GET)
	public ModelAndView providePstn(HttpServletRequest request, @PathVariable("pstnNum") String pstnNum, @PathVariable("memId") String memId, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/providePstn : POST");

		if (pstnNum.equals("0")) {
			meetService.provideLeader(memId, meetId);
		}
		meetService.provideStaff(memId, meetId, pstnNum);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/meet/listMeetMem/" + meetId);

		return mav;
	}

	@RequestMapping(value = "listMyMeet", method = RequestMethod.GET)
	public ModelAndView listMyMeet(HttpServletRequest request, @RequestParam(value = "message", required = false) String message) {
		System.out.println("/meet/listMyMeet : GET");

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		if (user == null) {
			mav.setViewName("/user/loginView.jsp");
			return mav;
		}

		String userId = user.getUserId();

		List<MeetMem> listMyMeet = meetService.listMyMeet(userId);

		if (message != null) {
			mav.addObject("message", message);
		}

		mav.addObject("listMyMeet", listMyMeet);
		mav.setViewName("/meet/listMyMeet.jsp");

		return mav;
	}

	@RequestMapping(value = "delMeet/{delFlag}", method = RequestMethod.GET)
	public String delMyMeet(HttpServletRequest request, @RequestParam("meetId") String meetId,
			@PathVariable("delFlag") String delFlag) throws Exception {
		System.out.println("/meet/delMyMeet : GET");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		String userId = user.getUserId();

		Meet meet = meetService.getMeet(meetId);
		String message = "";

		if (delFlag.equals("0")) { // Ż�� 0
			if (meet.getLeaderId().equals(userId)) {
				message = "0"; // �������� Ż�� �Ұ� ���� �� Ż�� ����
				return "/meet/listMyMeet?message=" + message;
			} else {
				meetService.outMeet(userId, meetId);
				meet.setMemNum(meet.getMemNum() - 1);
				meetService.updateMeet(meet);

				if (meet.getMeetType() == '1') {
					user.setMeetCount(user.getMeetCount() - 1);
					userService.updateUser(user);
				}
			}
		} else { // ���� 1
			if (meet.getLeaderId().equals(userId)) {
				if (meet.getMemNum() > 1) {
					message = "1"; // ���ӿ� �����ϹǷ� ���� �Ұ�
					return "/meet/listMyMeet?message=" + message;
				} else {
					meetService.outMeet(userId, meetId);
					meetService.delMeet(meetId);
				}
			}
		}

		return "/meet/listMyMeet?message=" + message;
	}

	@RequestMapping(value = "addWishMeet", method = RequestMethod.GET)
	public ModelAndView addWishMeet(HttpServletRequest request, @RequestParam("meetId") String meetId) {
		System.out.println("/meet/addWishMeet :GET");

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		if (user == null) {
			mav.setViewName("/user/loginView.jsp");
			return mav;
		}

		String userId = user.getUserId();

		meetService.addWishMeet(userId, meetId);

		Meet meet = meetService.getMeet(meetId);

		mav.addObject("meet", meet);
		mav.setViewName("/meet/getMeet/" + meetId);

		return mav;
	}

	@RequestMapping(value = "listWishMeet", method = RequestMethod.GET)
	public ModelAndView listWishMeet(HttpServletRequest request) {
		System.out.println("/meet/listWishMeet :GET");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		Map map = new HashMap();
		map = meetService.listWishMeet(userId);
		List<WishMeet> listWishMeet = (List<WishMeet>) map.get("listWishMeet");
		int wishCount = (int) map.get("wishCount");

		ModelAndView mav = new ModelAndView();
		mav.addObject("wishCount", wishCount);
		mav.addObject("listWishMeet", listWishMeet);
		mav.setViewName("/meet/listWishMeet.jsp");
		return mav;
	}

	@RequestMapping(value = "delWishMeet/{meetId}/{delLoc}", method = RequestMethod.GET)
	public ModelAndView delWishMeet(HttpServletRequest request, @PathVariable("meetId") String meetId, @PathVariable("delLoc") String delLoc) {
		System.out.println("/meet/delWishMeet :GET");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		meetService.delWishMeet(userId, meetId);

		ModelAndView mav = new ModelAndView();
		
		if(delLoc.equals("get")) {
			mav.setViewName("/meet/getMeet/"+meetId);
		}else {
			mav.setViewName("/meet/listWishMeet");
		}
		return mav;
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public void test() throws Exception {

		for (int i = 0; i < 1001; i++) {
			Random rand = new Random();

			User user = new User();
			String birthday = "";
			String phone = "010";

			user.setUserId("user" + i);
			user.setPassword(user.getUserId());
			user.setUserName(user.getUserId());
			user.setNickName(user.getUserId());
			user.setEmail(user.getUserId() + "@naver.com");

			for (int k = 0; k < 2; k++) {
				for (int j = 0; j < 4; j++) {
					String ran = Integer.toString(rand.nextInt(10));
					phone += ran;
				}
			}
			user.setPhoneNumber(phone);

			for (int j = 0; j < 6; j++) {
				String ran = Integer.toString(rand.nextInt(10));
				birthday += ran;
			}
			SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
			Date convBirthday = (Date) transFormat.parse(birthday);
			user.setBirthday(convBirthday);
			user.setAddress("�����");
			user.setGender("��");

			userService.addUser(user);
		}

	}
}
