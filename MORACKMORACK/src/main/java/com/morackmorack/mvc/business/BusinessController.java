package com.morackmorack.mvc.business;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.offmeet.OffMeetService;

//==> ��ü���� Controller
@Controller
@RequestMapping("/business/*")
public class BusinessController {

	///Field
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;
	@Autowired
	@Qualifier("offMeetServiceImpl")
	private OffMeetService offMeetService;
		
	public BusinessController(){
		System.out.println(this.getClass());
	}
	
	

//	2020-07-24 ������
//	login
//	��ü �α��� ȭ������ �ܼ� �̵�
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/business/logon : GET");

		return "redirect:/business/loginBusiness.jsp";
	}
	
	
//	2020-07-24 ������
//	login
//	��ü �α���
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("business") Business business , HttpSession session ) throws Exception{
		
		System.out.println("/business/login : POST");
		
		ModelAndView mv = new ModelAndView();
		
		Business dbBusiness = businessService.getBusiness(business.getBusinessId());
		
		if(business.getBusinessPass().equals(dbBusiness.getBusinessPass())) {
			session.setAttribute("business", dbBusiness);
		}
		
		/*mv.addObject("userFlag", "business");*/
		mv.setViewName("redirect:/index.jsp");
		
		return mv;
	}
	
	
//	2020-07-24 ������
//	logout
//	��ü �α׾ƿ�
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/business/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}

	
//	2020-07-22 ������
//	listBusiness
//	��ü ���
	@RequestMapping( value="listBusiness", method=RequestMethod.GET )
	public ModelAndView listBusiness( ) throws Exception {

		System.out.println("/business/listBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		List<Business> businessList = new ArrayList<>();
		Search search = new Search();
		
		businessList = businessService.getBusinessList(search);

		System.out.println(businessList);
		
		mv.addObject("businessList", businessList);
		mv.setViewName("/business/listBusiness.jsp");
		
		return mv;
	}

	
//	2020-07-27 ������
//	getBusiness
//	��ü ��(������ ����)
	@RequestMapping( value="getBusiness", method=RequestMethod.GET )
	public ModelAndView getBusiness( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/getBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = businessService.getBusiness(businessId);
		business.setMenu(businessService.listBusinessMenu(businessId));
		
		System.out.println("������");
		System.out.println(business);

		mv.addObject("business", business);
		mv.addObject("menu", business.getMenu());
		mv.setViewName("/business/getBusiness.jsp");
		
		return mv;
	}

	
//	2020-08-01 ������
//	addBusinessMenu
//	��ü �޴� ���_���Ͼ��ε����
	@RequestMapping( value="addBusinessMenu", method=RequestMethod.POST )
	public ModelAndView addBusinessMenu( @RequestParam(value="businessMenuList", required=true) List<String> businessMenuList,
										@RequestParam(value="businessMenuFeeList", required=true) List<Integer> businessMenuFeeList,
										@RequestParam(value="businessMenuImgList" ) List<MultipartFile> businessMenuImgList,
										MultipartHttpServletRequest mtf,
										HttpServletRequest request,
										HttpSession session) throws Exception {

		System.out.println("/business/addBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();

		List<MultipartFile> fileList = mtf.getFiles("businessMenuImgList");
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources\\images\\uploadFiles\\business\\";
		
		Menu menu = new Menu();
		menu.setBusinessId(((Business)session.getAttribute("business")).getBusinessId());
		int index = 0;
		
		if(fileList != null) {
			for(MultipartFile mf : fileList) {
				
				String originFileName = mf.getOriginalFilename();
				long fileSize = mf.getSize();
				
				String safeFile = System.currentTimeMillis() + originFileName;
				
				try {
					mf.transferTo(new File(root_path + attach_path + safeFile));
					menu.setBusinessMenuImg(safeFile);
					menu.setBusinessMenu(businessMenuList.get(index));
					menu.setBusinessMenuFee(businessMenuFeeList.get(index));
					
					businessService.addBusinessMenu(menu);
					
					index++;
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			menu.setBusinessMenuImg("empty_Img.png");
		}
		
		mv.setViewName("redirect:/business/listBusinessMenu");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	listBusinessMenu
//	��ü �޴� ���
	@RequestMapping( value="listBusinessMenu", method=RequestMethod.GET )
	public ModelAndView listBusinessMenu(HttpSession session) throws Exception {

		System.out.println("/business/listBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		List<Menu> menuList = businessService.listBusinessMenu(business.getBusinessId());
		
		business.setMenu(businessService.listBusinessMenu(business.getBusinessId()));
		
		mv.addObject(business);
		mv.addObject("menuList", menuList);
		mv.setViewName("forward:/business/listBusinessMenu.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	getBusinessMenu
//	��ü �޴� ��
	@RequestMapping( value="getBusinessMenu", method=RequestMethod.GET )
	public ModelAndView getBusinessMenu( @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/getBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Menu menu = new Menu();
		
		menu = businessService.getBusinessMenu(menuNo);
		
		mv.addObject("menu", menu);
		mv.setViewName("forward:/business/getBusinessMenu.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	updateBusinessMenu
//	��ü �޴� ����
	@RequestMapping( value="updateBusinessMenu", method=RequestMethod.POST )
	public ModelAndView updateBusinessMenu( @ModelAttribute("menu") Menu menu ) throws Exception {

		System.out.println("/business/updateBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.updateBusinessMenu(menu);
		
		mv.setViewName("redirect:/business/listBusinessMenu");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	delBusinessMenu
//	��ü �޴� ����
	@RequestMapping( value="delBusinessMenu", method=RequestMethod.GET )
	public ModelAndView delBusinessMenu( @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/delBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.delBusinessMenu(menuNo);
		
		mv.setViewName("forward:/business/listBusinessMenu");
		
		return mv;
	}	
	
	
//	2020-07-23 ������
//	addReserveAbleTime
//	��ü ���� ���� �ð� ����
	@RequestMapping( value="addReserveAbleTime", method=RequestMethod.POST )
	public ModelAndView addReserveAbleTime( @RequestParam(value="reserveAbleStartTime", required=true) List<String> reserveAbleStartTime,
											@RequestParam(value="reserveAbleEndTime", required=true) List<String> reserveAbleEndTime,
											HttpSession session ) throws Exception {

		System.out.println("/business/addReserveAbleTime : POST");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		String businessId = business.getBusinessId();
		
		for(int i=0 ; i<reserveAbleStartTime.size() ; i++) {
			ReserveAble reserveAble = new ReserveAble();
			reserveAble.setBusinessId(businessId);
			reserveAble.setReserveAbleStartTime(reserveAbleStartTime.get(i));
			reserveAble.setReserveAbleEndTime(reserveAbleEndTime.get(i));
			
			businessService.addReserveAbleTime(reserveAble);
		}
		
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime");
		
		return mv;
	}
	
	
//	2020-07-23 ������
//	delReserveAbleTime
//	��ü ���� ���� ��� ȭ������ �̵��ϸ鼭 ���� ���� �ð� ��� ����
	@RequestMapping( value="delReserveAbleTime", method=RequestMethod.GET )
	public ModelAndView delReserveAbleTime( HttpSession session ) throws Exception {

		System.out.println("/business/delReserveAbleTime : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		businessService.delReserveAbleTime(business.getBusinessId());
		
		mv.setViewName("forward:/business/addReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 ������
//	listReserveAbleTime
//	��ü ���� ���� �ð� ���
	/*@RequestMapping( value="listReserveAbleTime", method=RequestMethod.GET )*/
	@RequestMapping( value="listReserveAbleTime" )
	public ModelAndView listReserveAbleTime( HttpSession session ) throws Exception {

		System.out.println("/business/listReserveAbleTime : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");

		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(business.getBusinessId());

		System.out.println(reserveAbleTimeList);
		
		mv.addObject("reserveAbleTimeList", reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-29 ������
//	listReserveBusiness
//	��ü ���� ��� ��ȸ
	@RequestMapping( value="listReserveBusiness" )
	public ModelAndView listReserveBusiness( HttpSession session, @ModelAttribute("search") Search search ) throws Exception {
		
		System.out.println("/business/listReserveBusiness : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		User user = (User)session.getAttribute("user");
		
		/*List<Pay> reserveList = offMeetService.getBusinessPayList(search, userId);*/
		
		return mv;
	}
	
	
//	2020-07-20 ������
//	listUsedBusiness
//	User�� �̿��� ��ü ���
	@RequestMapping( value="listUsedBusiness", method=RequestMethod.GET )
	public ModelAndView listUsedBusiness( HttpSession session ) throws Exception {
		
		System.out.println("/business/listUsedBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		User user = (User)session.getAttribute("user");
		
		List<Pay> usedBusinessList = businessService.getUsedBusinessList(user.getUserId());
		
		System.out.println("������");
		System.out.println(usedBusinessList);
		
		mv.addObject("usedBusinessList", usedBusinessList);
		mv.setViewName("forward:/business/listUsedBusiness.jsp");
		
		return mv;
	}
	
}
