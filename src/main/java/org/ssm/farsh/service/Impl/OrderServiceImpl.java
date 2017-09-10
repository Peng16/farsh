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
import org.ssm.farsh.dao.OrderDao;
import org.ssm.farsh.model.Order;
import org.ssm.farsh.model.Page;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.service.OrderService;
@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private OrderDao orderDao;
	@Override
	public void modifyOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.modifyOrder(order);
	}

	@Override
	public void deleteOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.deleteOrder(order);
	}

	@Override
	public void saveOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.saveOrder(order);
	}

	@Override
	public Order findOrderByID(Integer oid) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByID(oid);
	}

	@Override
	public List<Order> queryAllOrder() {
		// TODO Auto-generated method stub
		return orderDao.queryAllOrder();
	}

	@Override
	public List<Order> findOrdersByUidAndOstate(Integer uid, Integer ostate) {
		// TODO Auto-generated method stub
		return orderDao.findOrdersByUidAndOstate(uid, ostate);
	}

	@Override
	public void showOrderByPage(Integer ostate,HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<Order> oderlist= new ArrayList<Order>();
		int totalCount = (int)orderDao.getOrderCount(ostate);
		if(pageNow!=null){
			page = new Page(totalCount, Integer.parseInt(pageNow));
			oderlist = orderDao.queryAllOrderByPage(ostate,page.getStartPos(), page.getPageSize());
		}else{
			page = new Page(totalCount, 1);
			oderlist = orderDao.queryAllOrderByPage(ostate,page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("oderlist", oderlist);
		System.out.println("分页信息"+page.toString());
		model.addAttribute("page",page);
	}

	@Override
	public List<String> queryOnumByUidAndOstate(Integer uid, Integer ostate) {
		// TODO Auto-generated method stub
		return orderDao.queryOnumByUidAndOstate(uid, ostate);
	}

	@Override
	public List<Order> queryOrderByUidAndOstate(Integer uid, Integer ostate) {
		// TODO Auto-generated method stub
		return orderDao.queryOrderByUidAndOstate(uid, ostate);
	}

	@Override
	public List<Order> queryAllOrderByonum(String onum) {
		// TODO Auto-generated method stub
		return orderDao.queryAllOrderByonum(onum);
	}

	 

}
