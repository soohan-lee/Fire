package com.morackmorack.mvc.community;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.morackmorack.mvc.service.community.CommunityService;
import com.morackmorack.mvc.service.domain.Comments;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.user.UserService;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['path']}")
	String path;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="/json/addPost", method=RequestMethod.POST)
	public Map addPost(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		
		System.out.println("����� Community Rest");
		
		String orgFileName = multipartFile.getOriginalFilename();//���ϸ�
		String extension = orgFileName.substring(orgFileName.lastIndexOf(".")); //Ȯ����
		
		String saveFile = UUID.randomUUID()+extension;// ����� ���ϸ�
		String fileRoot = path+"/community/"; //���� ���
		
		File tarFile = new File(fileRoot+saveFile);
		
		Map map = new HashMap();
		
		try {
				multipartFile.transferTo(tarFile); //���� ����
				map.put("url", "../resources/images/uploadFiles/community/"+saveFile);
				map.put("responseCode", "success");
				System.out.println("map:"+map);
		} catch (IOException e) {
			FileUtils.deleteQuietly(tarFile);
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		Thread.sleep(5000);
		return map;
	}
	
	@RequestMapping(value="json/updatePost", method=RequestMethod.POST)
	public Map updatePost(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		
		String orgFileName = multipartFile.getOriginalFilename();
		String extension = orgFileName.substring(orgFileName.lastIndexOf("."));
		
		String saveFile = UUID.randomUUID() + extension;
		String fileRoot = path+"/community/";
		
		File tarFile = new File(fileRoot + saveFile);
		
		Map map = new HashMap();
		
		try {
			multipartFile.transferTo(tarFile);
			map.put("url", "../resources/images/uploadFiles/community/"+saveFile);
			map.put("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(tarFile);
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		Thread.sleep(5000);
		return map;
	}
	
	@RequestMapping(value="/json/addComment", method=RequestMethod.POST)
	public void addComment(@RequestBody Map<String,Object> map, HttpSession session, Comments comments) throws Exception {
		
		User user = ((User)session.getAttribute("user"));
		
		comments.setPostNo((int)map.get("postNo"));
		comments.setUser(user);
		comments.setCoContent((String)map.get("coContent"));
		communityService.addComments(comments);
	}
	
	
}
