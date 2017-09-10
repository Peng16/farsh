package org.ssm.farsh.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.farsh.model.Address;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.AddressService;
import org.ssm.farsh.service.ScartService;
import org.ssm.farsh.service.UserService;

@Controller("AddressController")
@RequestMapping("/Address")//Url:/模块/资源/{id}/细分   /Address/list
public class AddressController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AddressService addressService;
	@Autowired
	private UserService userService;
	@Autowired
	private ScartService scartService;
	//得到该用户的地址
	@RequestMapping(value = "/{account}/addresslist", method = RequestMethod.GET)
	public String addresslist(@PathVariable("account") String account,HttpServletRequest request,Model model){
		User user = userService.getUserByAccount(account);
		Integer uidInteger = user.getUid();
		List<Address> addresslist = addressService.queryAddressByUid(uidInteger);
		List<Scart> scarts = scartService.findScartbyuid(uidInteger);
		HttpSession session = request.getSession();
		int samount =scarts.size();
		session.setAttribute("samount", samount);
		session.setAttribute("user", user);
		model.addAttribute("addresslist",addresslist);
		return "User/Address";
	}
	//添加address
	@RequestMapping(value = "/{account}/saveAddress", method = RequestMethod.POST)
	public String saveAddress(@PathVariable("account") String account,
			@RequestParam(value="aName")String aName,
			@RequestParam(value="aPhone")String aPhone,
			@RequestParam(value="aProvince")String aProvince,
			@RequestParam(value="aCity")String aCity,
			@RequestParam(value="aDetailed")String aDetailed,
			Model model)throws Exception{
		User user = userService.getUserByAccount(account);
		Integer uidInteger = user.getUid();
		//判断是否是第一个
		List<Address> addresslist = addressService.queryAddressByUid(uidInteger);
		if(addresslist.isEmpty()){
			Address addr = new Address(aName,aPhone,aProvince,aCity,aDetailed,uidInteger,1);
			addressService.addAddress(addr);
			return "redirect:/Address/"+account+"/addresslist";
		}else if(addresslist.size()<3 &&addresslist.size() >= 1){
			for (Address address : addresslist) {
				if(address.getaDefult()==1){
					address.setaDefult(0);
					addressService.modifyAddress(address);
				}
			}
			Address addr = new Address(aName,aPhone,aProvince,aCity,aDetailed,uidInteger,1);
			addressService.addAddress(addr);
			return "redirect:/Address/"+account+"/addresslist";
		}else if(addresslist.size() >= 3){
			 
		}
		return "redirect:/Address/"+account+"/addresslist";
	}
	//设为默认地址
	@RequestMapping(value = "/{account}/setDefult/{aid}", method = RequestMethod.GET)
	public String setDefult(@PathVariable("account") String account,
			@PathVariable("aid") String aid,
			Model model){
		Integer aId = Integer.parseInt(aid);
		Integer uid = userService.getUserByAccount(account).getUid();
		List<Address> addresslist = addressService.queryAddressByUid(uid);
		for (Address address : addresslist) {
			if(address.getaDefult()==1){
				address.setaDefult(0);
				addressService.modifyAddress(address);
			}
		}
		Address address = addressService.queryAddressByAid(aId);
		address.setaDefult(1);
		addressService.modifyAddress(address);
		return "redirect:/Address/"+account+"/addresslist";
	}
	//删除Address
	@RequestMapping(value = "/{account}/deleteAddress/{aid}/{adefult}", method = RequestMethod.GET)
	public String deleteAddress(@PathVariable("account") String account,
			@PathVariable("adefult") String adefult,
			@PathVariable("aid") String aid,
			Model model){
		Integer aDefult = Integer.parseInt(adefult);
		Integer aId = Integer.parseInt(aid);
		Integer uid = userService.getUserByAccount(account).getUid();
		List<Address> addresslist = addressService.queryAddressByUid(uid);
		if(aDefult==1 && addresslist.size()>1){
			addresslist.get(0).setaDefult(1);
			addressService.modifyAddress(addresslist.get(0));
			addressService.deleteAddress(aId);
		}else{
			addressService.deleteAddress(aId);
		}
		return "redirect:/Address/"+account+"/addresslist";
	}
}
