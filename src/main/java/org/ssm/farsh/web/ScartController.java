package org.ssm.farsh.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.ProductService;
import org.ssm.farsh.service.ScartService;
import org.ssm.farsh.service.UserService;

@Controller("ScartController")
@RequestMapping("/Scart")//Url:/模块/资源/{id}/细分   /User/list
public class ScartController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ScartService scartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	//查看购物车,获取用户购物车列表
	public void getscartlist(@PathVariable("account") String account,HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		User user = userService.getUserByAccount(account);
		session.setAttribute("user", user);
		Integer uid = userService.getUserIdByUserName(account);
		List<Scart> scartlist = scartService.findScartbyuid(uid);
		model.addAttribute("scartlist",scartlist);
	}
	
	@RequestMapping(value = "/{account}/listscart",method = RequestMethod.GET)
	public String listscart(@PathVariable("account") String account,HttpServletRequest request, Model model){
		//getscartlist(account,model);
		HttpSession session = request.getSession();
		Integer uid = userService.getUserIdByUserName(account);
		List<Scart> scartlist = scartService.findScartbyuid(uid);
		int samount = scartlist.size();
		session.setAttribute("samount", samount);
		model.addAttribute("scartlist",scartlist);
		return "User/shopCar";
	}
	
	//changeAmount
	@RequestMapping(value="/changeAmount",method = RequestMethod.POST)
	@ResponseBody
	public  Scart changeAmount(@RequestParam Map<String, Object> param,HttpServletRequest request,Model model){
		Integer sid = Integer.parseInt(request.getParameter("sid"));
		Integer amount = Integer.parseInt(request.getParameter("amount"));
		Double sumprice=null;
		Scart scart1 = scartService.findScartbySid(sid);
		System.out.println(scart1.toString()+"  /////");
		sumprice = scart1.getSprice()*amount;
		scart1.setSumprice(sumprice);
		scart1.setAmount(amount);
		scartService.modify(scart1);
		Scart scart2 = scartService.findScartbySid(sid);
		System.out.println(scart2.toString());
		return scart2;
	}
	
	@RequestMapping(value="/addScart",method = RequestMethod.GET)
	public String addScart(HttpServletRequest request,Model model){
		request.getSession().removeAttribute("samount");
		String account = request.getParameter("account");
		Integer pId = Integer.parseInt(request.getParameter("pId")); 
		//产品数量++
		Integer uid = userService.getUserIdByUserName(account);
		boolean isExist = false;
		List<Scart> scartList= scartService.findScartbyuid(uid);
		for (Scart scart : scartList) {
			if(pId==scart.getPid()){
				Scart scartl = scartService.findScartbyPid(pId);
				int amout = scartl.getAmount();
				scartl.setAmount(amout+1);
				scartService.modify(scartl);
				return "redirect:/Scart/"+account+"/listscart";
			} 
		}
			Product product = productService.findProductByID(pId);
			Date sdate = new Date();
			Double sumsprice = product.getPrice()*1;
			Scart scart =new Scart(1, uid, pId, product.getPrice(), product.getPicture(), product.getPname(), sdate, sumsprice);
			scartService.saveScart(scart);
			return "redirect:/Scart/"+account+"/listscart";
	}
	
	//刪除购物车
	@RequestMapping(value = "/{sid}/{account}/deleteScart",method=RequestMethod.GET)
	public String deleteScart(@PathVariable("sid")Integer sid,@PathVariable("account")String account,Model model){
		Scart scart = new Scart(sid);
		scartService.delete(scart);
		return "redirect:/Scart/"+account+"/listscart";
	}
}
