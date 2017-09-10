package org.ssm.test.farsh;

import static org.junit.Assert.*; 

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.management.loading.PrivateClassLoader;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.dao.OrderDao;
import org.ssm.farsh.dao.RecordDao;
import org.ssm.farsh.model.Order;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml"})
public class OrderDaoTest {

	@Autowired
	private OrderDao orderDao;
	
	@Test
	public void testModifyOrder() {
	/*	Integer oid =2;
		Integer pid=23;
		Integer pnum=545;
		Double pdiscount=0.23;
		Double psumprice=5600.00;
		Integer aid=5;
		Integer uid=3;
		Integer ostate=3;
		Order order = new Order(oid,pid, pnum, pdiscount, psumprice, aid, uid, ostate,new Date());
		orderDao.modifyOrder(order);*/
	}

	@Test
	public void testDeleteOrder() {
		Integer oid =2;
		Order order = new Order(oid);
		orderDao.deleteOrder(order);
	}

	@Test
	public void testSaveOrder() {
		/*Integer pid=23;
		Integer pnum=56;
		Double pdiscount=0.23;
		Double psumprice=5600.00;
		Integer aid=5;
		Integer uid=3;
		Integer ostate=1;
		Order order = new Order(pid,pnum,pdiscount,psumprice,aid,uid,ostate,new Date());
		orderDao.saveOrder(order);*/
	}

	@Test
	public void testFindOrderByID() {
		Integer oid =1;
		Order order = orderDao.findOrderByID(oid);
		System.out.println(order.toString());
	}

	@Test
	public void testQueryAllOrder() {
		List<Order> orderlist = orderDao.queryAllOrder();
		for(Order order:orderlist){
			System.out.println(order.toString());
		}
	}

}
