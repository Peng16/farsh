package org.ssm.farsh.service;

import static org.junit.Assert.*; 

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.model.Scart;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml","classpath:mybatis-spring/spring-service.xml","classpath:mybatis-spring/spring-mvc.xml"})
public class ScartServiceTest {
	
	@Autowired
	private ScartService scartService;
	
	@Test
	public void testSaveScart() {
		  Integer amount=123;
		  Integer uid=12;
		  Integer pid=66;
		  Double sprice=12.00;
		  String spicture="djdl.jpg";
		  String sname="简介";
		  Date sdate= new Date();
		  Double sumprice=amount*sprice;
		  Scart scart = new Scart(amount,uid,pid,sprice,spicture,sname,sdate,sumprice);
		  scartService.saveScart(scart);
	}

	@Test
	public void testDelete() {
		 Integer sId=69;
		 Scart scart = new Scart(sId);
		 scartService.delete(scart);
	}

	@Test
	public void testModify() {
		  Integer sId=70;
		  Integer amount=23;
		  Integer uid=12;
		  Integer pid=66;
		  Double sprice=15.00;
		  String spicture="djd.jpeg";
		  String sname="简介";
		  Date sdate= new Date();
		  Double sumprice=amount*sprice;
		  Scart scart = new Scart(sId,amount,uid,pid,sprice,spicture,sname,sdate,sumprice);
		  scartService.modify(scart);
		  
	}

	@Test
	public void testFindScartbyid() {
		/*Integer sId=70;
		  Integer uid=12;
		  boolean isExit=true;
		  List<Scart> scartlist = scartService.findScartbyid(uid);
		  if(!scartlist.isEmpty()){
			  isExit=true;
			  for(Scart scart:scartlist){
					System.out.println(scart.toString());
				}
		  }else{
			  isExit=false;
		  }
		  System.out.println(isExit);*/
	}

	@Test
	public void testQueryAllScarts() {
		List<Scart> scartlist=scartService.queryAllScarts();
		for(Scart scart:scartlist){
			System.out.println(scart.toString());
		}
	}

}
