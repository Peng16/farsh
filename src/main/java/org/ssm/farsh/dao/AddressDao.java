package org.ssm.farsh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ssm.farsh.model.Address;

public interface AddressDao {
	
	//By uid
	public List<Address> queryAddressByUid(Integer uid);
	//By aid
	public Address queryAddressByAid(Integer aid);
	//By uid and adefult
	public Address queryAddressByUidAndAdefult(@Param(value="uid")Integer uid,@Param(value="aDefult")Integer aDefult);
	//添加
	public void addAddress(Address address);	
	//修改
	public void modifyAddress(Address address);
	//删除By aid
	public void deleteAddress(Integer aid);
}
