package org.ssm.test.farsh;

import static org.junit.Assert.*;   

import java.util.List;

import javax.annotation.Resource;
import javax.management.loading.PrivateClassLoader;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.dao.UserDao;
import org.ssm.farsh.model.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml"})
public class UserDaoTest {

	@Autowired
	private UserDao userDao;
	@Test
	public void testModify() throws Exception{
		Integer uid = 17;
		String account = "dfg";
		String pwd = "654";
		String username="签到";
		String sex	= "男";
		User user =new User(uid,account,pwd,username,sex);
		userDao.modify(user);
		
	}

	@Test
	public void testDelete() throws Exception{
		Integer uid = 16;
		String account = "dfg";
		String pwd = "654";
		String username="签到";
		String sex	= "男";
		User user =new User(uid,account,pwd,username,sex);
		userDao.delete(user);
	}

	@Test
	public void testSaveUser() throws Exception{
		String account = "jdk";
		String pwd = "水电费";
		User user = new User(account,pwd);
		userDao.saveUser(user);
	}

	@Test
	public void testFindByID() throws Exception{
		Integer id = 12;
		User user = userDao.findByID(id);
		System.out.println(user.getAccount());
	}

	@Test
	public void testQueryAlluser() throws Exception{
		List<User> userList = userDao.queryAlluser();
		for(User user:userList){
			System.out.println(user);
		}
	}

	@Test
	public void testGetUserIdByUserName() throws Exception{
		String account ="1";
		boolean isExit =true;
		User user =userDao.getUserByAccount(account);
		if(!"".equals(user)){
			isExit=true;
		}else {
			isExit=false;
		}
		System.out.println(isExit);
	}
	@Test
	public void testgetUserByaccountandpwd() throws Exception{
		String account ="1";
		String pwd = "di";
		boolean isExit =true;
		List<User> userlist =userDao.getUserByaccountandpwd(account,pwd);
		if(!userlist.isEmpty()){
			isExit=true;
		}else {
			isExit=false;
		}
		System.out.println(isExit);
	}

}
