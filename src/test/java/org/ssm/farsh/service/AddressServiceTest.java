package org.ssm.farsh.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.model.Address;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml","classpath:mybatis-spring/spring-service.xml","classpath:mybatis-spring/spring-mvc.xml"})
public class AddressServiceTest {
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private AddressService addressService;
    @Test
	public void testQueryAddressByAccount() {
    	String account="18375348336";
		boolean isExit = true;
		List<Address> addresslist = addressService.queryAddressByAccount(account);
		if(!addresslist.isEmpty()){
			isExit=true;
		}else{
			isExit=false;
		}
		System.out.println(isExit);
	}
    @Test
	public void testQueryAddressByAid() {
		
		Integer aid =3;
		boolean isExit = true;
		List<Address> addresslist = addressService.queryAddressByAid(aid);
		if(!addresslist.isEmpty()){
			isExit=true;
		}else{
			isExit=false;
		}
		System.out.println(isExit);
	}
	@Test
	public void testAddAddress() {
		String aprovince="kahkldg";
		String aCity = "sdgss";
		String aDetailed="adga";
		String account="18375348";
		int adefult=1;
		Address address= new Address(aprovince,aCity,aDetailed,account,adefult);
		addressService.addAddress(address);
	}

	@Test
	public void testModifyAddress() {
		Integer aid =4;
		String arovince="kahkldg";
		String aCity = "sdgss";
		String aDetailed="adga";
		String account="1837";
		int adefult=0;
		Address address= new Address(aid,arovince,aCity,aDetailed,account,adefult);
		addressService.modifyAddress(address);
	}

	@Test
	public void testDeleteAddress() {
		 Integer aid =4;
			Address address= new Address(aid);
			addressService.deleteAddress(address);
	}

}
