package org.ssm.farsh.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.model.Order;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml","classpath:mybatis-spring/spring-service.xml","classpath:mybatis-spring/spring-mvc.xml"})
public class OrderServiceTest {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private OrderService orderService;
	@Test
	public void testModifyOrder() {
		/*Integer oid =3;
		Integer pid=23;
		Integer pnum=545;
		Double pdiscount=0.23;
		Double psumprice=5600.00;
		Integer aid=5;
		Integer uid=3;
		Integer ostate=3;
		Order order = new Order(oid,pid, pnum, pdiscount, psumprice, aid, uid, ostate,new Date());
		orderService.modifyOrder(order);*/
	}

	@Test
	public void testDeleteOrder() {
		Integer oid =1;
		Order order = new Order(oid);
		orderService.deleteOrder(order);
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
		orderService.saveOrder(order);*/
	}

	@Test
	public void testFindOrderByID() {
		Integer oid =3;
		Order order = orderService.findOrderByID(oid);
		System.out.println(order.toString());
	}

	@Test
	public void testQueryAllOrder() {
		List<Order> orderlist = orderService.queryAllOrder();
		for(Order order:orderlist){
			System.out.println(order.toString());
		}
	}

}
