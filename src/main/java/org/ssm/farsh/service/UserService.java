package org.ssm.farsh.service;

import java.util.List;  

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.ssm.farsh.model.User;


public interface UserService {
		//修改
		public void modify(User user);
		//删除
		public  void delete(User user);
		//保存
		public void saveUser(User user);
		//通过uid查找
		public User find(Integer uid);
		//查询所有
		public List<User> queryAlluser();
		//账号是否存在
	    public boolean checkAccount(HttpServletRequest request,Model model);
	  //通过账号和密码查询
	    public User getUserByaccountandpwd(@Param("account")String account,@Param("pwd")String pwd);
		//public boolean checkUser(@Param("account") String account,@Param("pwd") String pwd);
		//通过账号查询
	    public User getUserByAccount(String account);
	    //通过userName得到ID
	    public Integer getUserIdByUserName(String userName);
	    public void showUserByPage(HttpServletRequest request,Model model);
}
