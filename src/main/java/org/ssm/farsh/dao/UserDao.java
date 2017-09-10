package org.ssm.farsh.dao;

import java.util.List; 

import org.apache.ibatis.annotations.Param;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.User;


public interface UserDao {
	//修改
	public void modify(User user);
	//删除
	public  void delete(User user);
	//保存
	public void saveUser(User user);
	//通过Uid查找
	public User findByID(Integer uid);
	//查询所有
	public List<User> queryAlluser();
	//按照账号查询
    public User getUserByAccount(String account);
    //通过账号和密码查询
    public User getUserByaccountandpwd(@Param("account")String account,@Param("pwd")String pwd);
    //通过username 得到Uid
    public Integer getUserIdByUserName(String name);
    //分页查询所有
  	public List<User> queryAllUsersByPage(@Param(value="startPos")Integer startPos,@Param(value="pageSize")Integer pageSize);
  	//分页查询记录总数
  	public long getUsersCount();
}
