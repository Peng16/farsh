package org.ssm.farsh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.ssm.farsh.model.Scart;

public interface ScartService {
	    //增加
		public void saveScart(Scart scart);
		//删除
		public void delete(Scart scart);
		//修改
		public void modify(Scart scart);
		//查询by uid
		public List<Scart> findScartbyuid(Integer uid);
		//查询by sid
		public Scart findScartbySid(Integer sid);
		//查询by pid
		public Scart findScartbyPid(Integer pid);
		//查询所有
		public List<Scart> queryAllScarts();
}
