package org.ssm.farsh.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.farsh.dao.AddressDao;
import org.ssm.farsh.model.Address;
import org.ssm.farsh.service.AddressService;
@Service("AddressService")
public class AddressServiceImpl implements AddressService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AddressDao addressDao;

	@Override
	public List<Address> queryAddressByUid(Integer uid) {
		// TODO Auto-generated method stub
		return addressDao.queryAddressByUid(uid);
	}

	@Override
	public Address queryAddressByAid(Integer aid) {
		// TODO Auto-generated method stub
		return addressDao.queryAddressByAid(aid);
	}

	@Override
	public void addAddress(Address address) {
		// TODO Auto-generated method stub
		addressDao.addAddress(address);
	}

	@Override
	public void modifyAddress(Address address) {
		// TODO Auto-generated method stub
		addressDao.modifyAddress(address);
	}

	@Override
	public void deleteAddress(Integer aid) {
		// TODO Auto-generated method stub
		addressDao.deleteAddress(aid);
	}

	@Override
	public Address queryAddressByUidAndAdefult(Integer uid,Integer adefult) {
		// TODO Auto-generated method stub
		return addressDao.queryAddressByUidAndAdefult(uid, adefult);
	}
	
 

}
