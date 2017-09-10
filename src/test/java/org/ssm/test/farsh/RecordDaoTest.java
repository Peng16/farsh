package org.ssm.test.farsh;

import static org.junit.Assert.*; 

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.dao.RecordDao;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml"})
public class RecordDaoTest {
	@Autowired
	private RecordDao recordDao;
	@Test
	public void testSaveRecord() {
		 
	}

	@Test
	public void testSearchByUidAndSid() {
		 
	}

	@Test
	public void testQueryRecordByrid() {
		Integer rid =2;
		recordDao.queryRecordByrid(rid);
	}

	@Test
	public void testDeletebyrid() {
		Integer rid =2;
		recordDao.deletebyrid(rid);
	}

}
