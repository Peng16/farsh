package org.ssm.farsh.service.Impl;

import java.util.List; 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.farsh.dao.ScartDao;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.service.ScartService;
@Service("ScartService")
public class ScartServiceImpl implements ScartService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ScartDao scartDao;
	
	@Override
	public void saveScart(Scart scart) {
		// TODO Auto-generated method stub
		scartDao.saveScart(scart);

	}

	@Override
	public void delete(Scart scart) {
		// TODO Auto-generated method stub
		scartDao.delete(scart);
	}

	@Override
	public void modify(Scart scart) {
		// TODO Auto-generated method stub
		scartDao.modify(scart);
	}

	@Override
	public List<Scart> findScartbyuid(Integer uid) {
		// TODO Auto-generated method stub
		return scartDao.findScartbyuid(uid);
	}
	@Override
	public Scart findScartbySid(Integer sid) {
		// TODO Auto-generated method stub
		return scartDao.findScartbySid(sid);
	}
	@Override
	public List<Scart> queryAllScarts() {
		// TODO Auto-generated method stub
		return scartDao.queryAllScarts();
	}

	@Override
	public Scart findScartbyPid(Integer pid) {
		// TODO Auto-generated method stub
		return scartDao.findScartbyPid(pid);
	}

}
