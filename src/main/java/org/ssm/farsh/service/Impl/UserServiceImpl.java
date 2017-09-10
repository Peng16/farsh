package org.ssm.farsh.service.Impl;

import java.util.ArrayList;
import java.util.List;  

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.ssm.farsh.dao.UserDao;
import org.ssm.farsh.model.Page;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.UserService;


@Service("UserService")
public class UserServiceImpl implements UserService{
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public void modify(User user) {
		// TODO Auto-generated method stub
		userDao.modify(user);
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		userDao.delete(user);
	}

	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		userDao.saveUser(user);
	}

	@Override
	public User find(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.findByID(uid);
	}

	@Override
	public List<User> queryAlluser() {
		// TODO Auto-generated method stub
		return userDao.queryAlluser();
	}

	public boolean checkAccount(HttpServletRequest request,Model model) {
		// TODO Auto-generated method stub
		boolean isExist=true;
		String account =request.getParameter("account");
		System.out.println("验证账号为"+account+"  是否存在？");
		User user = userDao.getUserByAccount(account);
		if(user==null){
			System.out.println("asdfasdgsa"+user);
			isExist=false;
		}else{
			System.out.println("asdfasdgsa"+user);
			isExist = true;
		}
		return isExist;
	}

/*	@Override
	public boolean checkUser(String account, String pwd) {
		// TODO Auto-generated method stub
		boolean isExit =true;
		List<User> userlist =userDao.getUserByaccountandpwd(account,pwd);
		if(!userlist.isEmpty()){
			isExist=true;
		}else {
			isExist=false;
		}
		return isExist;
	}
*/
	@Override
	public Integer getUserIdByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.getUserIdByUserName(userName);
	}

	@Override
	public User getUserByAccount(String account) {
		// TODO Auto-generated method stub
		return userDao.getUserByAccount(account);
	}

	@Override
	public void showUserByPage(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<User> userlist= new ArrayList<User>();
		int totalCount = (int)userDao.getUsersCount();
		if(pageNow!=null){
			page = new Page(totalCount, Integer.parseInt(pageNow));
			userlist =  userDao.queryAllUsersByPage(page.getStartPos(), page.getPageSize());
		}else{
			page = new Page(totalCount, 1);
			userlist = userDao.queryAllUsersByPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("userlist", userlist);
		System.out.println("分页信息"+page.toString());
		model.addAttribute("page",page);
		
	}

	@Override
	public User getUserByaccountandpwd(String account, String pwd) {
		// TODO Auto-generated method stub
		User user = userDao.getUserByAccount(account);
		if (user != null && user.getPwd().equals(pwd)) {
			return user;
		}
		return null;
	}

}
