package com.morackmorack.mvc.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController(){
		System.out.println(this.getClass());
	}

	
	@RequestMapping( value="addUser", method=RequestMethod.GET)
	public String addUser() throws Exception{
		
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
		
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST)
	public String addUser( @ModelAttribute("user") User user, HttpServletRequest request) throws Exception {

		System.out.println("/user/adduser : POST");
		/* System.out.println("���� ��ü:"+ user); */
		
		@Component class StringToDateConverter
		  implements Converter<String, Date> {
		 
		    @Override
		    public Date convert(String source) {
		        SimpleDateFormat format = new SimpleDateFormat("yyyyy-MM-dd");
		        try {
					return format.parse(source);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null; 
		    }
		    
		}
		
		//Business Logic
		userService.addUser(user);
		
		return "redirect:/user/loginView.jsp";
	}
	
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}
	
	////////////////////////////////////////////////////////////////////////////////
	/*
	 * @RequestMapping(value="loginResult", method=RequestMethod.GET) public String
	 * loginResult(HttpSession session) {
	 * 
	 * return "redirect:/user/loginResult.jsp"; }
	 */
	////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/index.jsp";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model �� View ����
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}
	
	// ȸ�� Ż�� get
	@RequestMapping(value="delUser", method = RequestMethod.GET)
	public String delUserView() throws Exception{
		return "redirect:/user/delUserView.jsp";
	}
		
	// ȸ�� Ż�� post
	@RequestMapping(value="delUser", method = RequestMethod.POST)
	public String delUser(User user, HttpSession session, RedirectAttributes rttr) throws Exception{
			
		// ���ǿ� �ִ� user�� ������ user1������ �־��ݴϴ�.
		User user1 = (User) session.getAttribute("user");
		// ���ǿ��ִ� ��й�ȣ
		String sessionPassword = user1.getPassword();
		// ���������� ������ ��й�ȣ
		String userPassword = user.getPassword();
			
		if(!(sessionPassword.equals(userPassword))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/delUserView.jsp";
		}
		userService.delUser(user);
		session.invalidate();
		
		System.out.println(123);
		return "redirect:/index.jsp";
	}
	
	
	
}


