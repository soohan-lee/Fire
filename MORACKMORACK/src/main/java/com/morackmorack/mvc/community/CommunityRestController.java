package com.morackmorack.mvc.community;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
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
		
		System.out.println("여기는 Community Rest");
		
		String orgFileName = multipartFile.getOriginalFilename();//파일명
		String extension = orgFileName.substring(orgFileName.lastIndexOf(".")); //확장자
		
		String saveFile = UUID.randomUUID()+extension;// 저장될 파일명
		String fileRoot = path+"/community/"; //파일 경로
		
		File tarFile = new File(fileRoot+saveFile);
		
		Map map = new HashMap();
		
		try {
				multipartFile.transferTo(tarFile); //파일 저장
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
	
	@RequestMapping(value="/json/addComments", method=RequestMethod.POST)
	public int addComments(@RequestBody Map<String,Object> map, HttpSession session, Comments comments) throws Exception {
		
		User user = ((User)session.getAttribute("user"));
		
		comments.setPostNo((int)map.get("postNo"));
		comments.setCoContent((String)map.get("coContent"));
		comments.setUser(user);
		
		communityService.addComments(comments);
		
		return 2;
	}
	
	@RequestMapping(value="/json/getComments/{commentNo}", method=RequestMethod.GET)
	public Comments getComments(@PathVariable("commentNo") int commentNo) throws Exception {
		
		Comments comments = communityService.getComments(commentNo);;
		
		return comments;
	}
	
	@RequestMapping(value="/json/getCommentsList/{postNo}", method=RequestMethod.GET)
	public Map<String,Object> getCommentsList(@PathVariable("postNo") int postNo)throws Exception {
		
		Map<String,Object> map = communityService.getCommentsList(postNo);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonValue = objectMapper.writeValueAsString(map.get("list"));
		
		List<Comments> list = objectMapper.readValue(jsonValue, new TypeReference<List<Comments>>() {} );
		
		for (int i=0 ; i<list.size() ; i++) {
			Comments str = list.get(i);
			System.out.println("000"+str);
		}
		map.put("list", map.get("list"));
		map.put("totalCount", map.get("totalCount"));
		
		return map;
	}
	
	@RequestMapping(value="/json/updateComments/{commentNo}", method=RequestMethod.GET)
	public Comments updateComments(@PathVariable("commentNo") int commentNo) throws Exception{
	
		Comments comments = communityService.getComments(commentNo);
		
		return comments;
	}
	
	@RequestMapping(value="/json/updateComments", method=RequestMethod.POST)
	public Comments updateComments(@RequestBody Map<String, String> map2, HttpSession session, Comments comments) throws Exception{

		User user = ((User)session.getAttribute("user"));

		comments.setCommentNo(Integer.valueOf(map2.get("commentNo")));
		System.out.println(map2);
		System.out.println("넘겨");
		
		
		comments.setCoContent(map2.get("coContent"));
		comments.setUser(user);
		communityService.updateComments(comments);
		
		return comments;
	}
	
	
	@RequestMapping(value="/json/deleteComment/{commentNo}", method=RequestMethod.GET)
	public int deleteComments(@PathVariable("commentNo") int commentNo) throws Exception{

		Comments comments = communityService.getComments(commentNo);
		
		communityService.deleteComments(comments);
		return 2;
	}
}