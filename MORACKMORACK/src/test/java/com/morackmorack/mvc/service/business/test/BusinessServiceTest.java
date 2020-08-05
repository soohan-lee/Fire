package com.morackmorack.mvc.service.business.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

import oracle.sql.DATE;

// JUnit���� BusinessLayer �����׽�Ʈ
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class BusinessServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;

	//@Test
	public void addBusiness() throws Exception {
		
		Business business = new Business();

		business.setBusinessId("bus03");
		business.setBusinessPass("3333");
		business.setBusinessName("����Ų���");
		business.setBusinessLoc("���ֵ� ��������");
		business.setCategoryNo(3);
		business.setBusinessPhone("010-3333-3333");
		business.setBusinessNum("34578");
		business.setBusinessOwner("����Ų");
		business.setBank("�ϳ�����");
		business.setDepositAccNum("345-98765-245678");
		business.setBusinessStartTime("09:00");
		business.setBusinessEndTime("20:30");
		
		System.out.println("������");
		System.out.println(business);
		
		businessService.addBusiness(business);

	}
	
	
	//@Test
	public void getBusiness() throws Exception{
		
		String businessId = "bus03";
		
		Business business = businessService.getBusiness(businessId);
		
		System.out.println("������");
		System.out.println(business);
		
	}
	
	
	//@Test
	public void updateBusiness() throws Exception{
		
		String businessId = "bus03";
		Business business = new Business();
		business.setBusinessId(businessId);
		business.setBusinessPass("4444");
		business.setBusinessName("����Ų���_����");
		business.setBusinessLoc("���ֵ� ��������_����");
		business.setCategoryNo(4);
		business.setBusinessPhone("010-4444-4444");
		business.setBusinessImg("����Ų���31_����.jsp");
		business.setBusinessNum("34578_����");
		business.setBusinessOwner("����Ų_����");
		business.setBank("�ϳ�����_����");
		business.setDepositAccNum("345-98765-245678_����");
		business.setBusinessStartTime("00:00");
		business.setBusinessEndTime("10:00");
		
		businessService.updateBusiness(business);
		
	}
	
	
	//@Test
	public void getBusinessList() throws Exception{
		
		Search search = new Search();
		
		List<Business> businessList = new ArrayList<>();
		
		businessList = businessService.getBusinessList(search);
		
		System.out.println("������");
		System.out.println(businessList);
		
	}
	
	
	//@Test
	public void delBusiness() throws Exception{
		
		String businessId = "bus03";
		
		businessService.delBusiness(businessId);
		
	}
	
	
	
	
	
	
	
	
	
	//@Test
	public void testAddBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
		menuList.add(new Menu("bus01", "���κ������Ʈ", 3000, "���κ������Ʈ.jsp"));
		menuList.add(new Menu("bus01", "����ġ������ũ", 10000, "����ġ������ũ.jsp"));
		menuList.add(new Menu("bus01", "����� ���� ����", 7000, "����� ���� ����.jsp"));
		
		business.setMenu(menuList);
		
		System.out.println(business);
		
		for(int i=0 ; i<menuList.size() ; i++) {
			System.out.println(i + "��° �޴� ������ => " + menuList.get(i));
			businessService.addBusinessMenu(menuList.get(i));
		}
	}
	
	
	//@Test
	public void testListBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
	
		String businessId = "bus01";
		
		menuList = businessService.listBusinessMenu(businessId);
		
		System.out.println("������");
		System.out.println(menuList);
		
	}
	
	
	//@Test
	public void testGetBusinessMenu() throws Exception {
		
		Menu menu = new Menu();
	
		int menuNo = 3;
		
		menu = businessService.getBusinessMenu(menuNo);
		
		System.out.println("������");
		System.out.println(menu);
		
	}
	
	
	//@Test
	public void testUpdateBusinessMenu() throws Exception {
		
		int menuNo = 3;
		
		businessService.delBusinessMenu(menuNo);
		
	}
	
}
