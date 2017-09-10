package org.ssm.test.farsh;

import static org.junit.Assert.*; 

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.dao.ScartDao;
import org.ssm.farsh.model.Scart;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml"})
public class ScartDaoTest {

	@Autowired
	private ScartDao scartDao;
	
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
		  scartDao.saveScart(scart);
		  
	}

	@Test
	public void testDelete() {
		 Integer sId=12;
		 Scart scart = new Scart(sId);
		 scartDao.delete(scart);
	}

	@Test
	public void testModify() {
		  Integer sId=69;
		  Integer amount=23;
		  Integer uid=12;
		  Integer pid=66;
		  Double sprice=15.00;
		  String spicture="djd.jpeg";
		  String sname="简介";
		  Date sdate= new Date();
		  Double sumprice=amount*sprice;
		  Scart scart = new Scart(sId,amount,uid,pid,sprice,spicture,sname,sdate,sumprice);
		  scartDao.modify(scart);
	}

	@Test
	public void testFindScartbyid() {
		/*  Integer sId=69;
		  Integer uid=12;
		  boolean isExit=true;
		//  List<Scart> scartlist = scartDao.findScartbyid(uid);
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
		List<Scart> scartlist=scartDao.queryAllScarts();
		for(Scart scart:scartlist){
			System.out.println(scart.toString());
		}
	}

}
