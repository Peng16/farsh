package org.ssm.farsh.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml","classpath:mybatis-spring/spring-service.xml","classpath:mybatis-spring/spring-mvc.xml"})
public class UserServiceTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;
	@Test
	public void testModify() {
		Integer uid = 15;
		String account = "dfg";
		String pwd = "654";
		String username="签到";
		String sex	= "男";
		User user =new User(uid,account,pwd,username,sex);
		userService.modify(user);
	}

	@Test
	public void testDelete() {
		Integer uid = 12;
		String account = "dfg";
		String pwd = "654";
		String username="签到";
		String sex	= "男";
		User user =new User(uid,account,pwd,username,sex);
		userService.delete(user);
	}

	@Test
	public void testSaveUser() {
		String account = "jdk";
		String pwd = "水电费";
		User user = new User(account,pwd);
		userService.saveUser(user);
	}

	@Test
	public void testFind() {
		Integer id = 12;
		User user = userService.find(id);
		System.out.println(user.getAccount());
		logger.info("user={}",user);
	}

	@Test
	public void testQueryAlluser() {
		List<User> userlist = userService.queryAlluser();
		logger.info("userlist={}",userlist);
	}

	@Test
	public void testCheckAccount() {
	//	String account ="1";
		//boolean isExist = userService.checkAccount(account);
	//	System.out.println(isExist);
	//	logger.info("isExist={}",isExist);
	}

	@Test
	public void testCheckUser() {
		String account ="1";
		String pwd = "di";
		User isExit = userService.checkUser(account, pwd);
		System.out.println(isExit);
		logger.info("isExit={}",isExit);
	}

	@Test
	public void testGetUserByAccount() {
		String acount="jdk";
		User user  = userService.getUserByAccount(acount);
		 
			System.out.println(user.getUid());
			logger.info("uid={}",user.getUid());
		 
	}

	@Test
	public void testGetUserIdByUserName() {
		String name="韦武";
		Integer uid = userService.getUserIdByUserName(name);
			System.out.println(uid);
			logger.info("uid={}",uid);
	}

}
