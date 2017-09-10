package org.ssm.farsh.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.ssm.farsh.model.Order;

public interface OrderService {
	//修改
	public void modifyOrder(Order order);
	//删除
	public void deleteOrder(Order order);
	//保存
	public void saveOrder(Order order);
	//通过oid查找
	public Order findOrderByID(Integer oid);
	//通过uid and ostate查询
	public List<Order> findOrdersByUidAndOstate(@Param(value="uid")Integer uid,@Param(value="ostate")Integer ostate);
	//得到支付之后所有的订单号
	public List<String> queryOnumByUidAndOstate(@Param(value="uid")Integer uid,@Param(value="ostate")Integer ostate);
	//查询所有
	public List<Order> queryAllOrder();
	//通过订单号查 
	public List<Order> queryAllOrderByonum(String onum);
	//分页显示订单
	public void showOrderByPage(@Param(value="ostate")Integer ostate,HttpServletRequest request,Model model);
	//得到支付成功之后所有的订单
	public List<Order> queryOrderByUidAndOstate(@Param(value="uid")Integer uid,@Param(value="ostate")Integer ostate);
}
