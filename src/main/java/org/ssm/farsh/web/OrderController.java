package org.ssm.farsh.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.farsh.dao.RecordDao;
import org.ssm.farsh.model.Address;
import org.ssm.farsh.model.Order;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.Record;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.AddressService;
import org.ssm.farsh.service.OrderService;
import org.ssm.farsh.service.ProductService;
import org.ssm.farsh.service.ScartService;
import org.ssm.farsh.service.UserService;

import sun.print.resources.serviceui;

@Controller("OrderController")
@RequestMapping("/Order")//Url:/模块/资源/{id}/细分   /Order/list
public class OrderController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private RecordDao recordDao;
	@Autowired
	private UserService userService;
	@Autowired
	private ScartService scartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AddressService addressService;
	//生成订单
	@RequestMapping(value="/{account}/addOrder",method = RequestMethod.POST)
	public @ResponseBody String addOrder(@PathVariable("account") String account,HttpServletRequest request,Model model){
		Integer uid = userService.getUserIdByUserName(account);
		String chekString  = request.getParameter("checkval");
		Double sumprice = Double.parseDouble(request.getParameter("sumprice"));
		String[] item = chekString.split(",");
		String msg=null;
		List<Order> orders = orderService.findOrdersByUidAndOstate(uid, 0);
		System.out.println(!orders.isEmpty()+"是的不尊重a");
		if(!orders.isEmpty()){
			msg = "您有未支付的订单，无法生成新的订单，请到未完成订单里查询！";
			System.out.println(msg);
			return msg;
		}
		for(int i =0;i<item.length;i++){
			Integer sid =  Integer.parseInt(item[i]);
			Scart scart = scartService.findScartbySid(sid);
			Integer pid = scart.getPid();
			Product product =productService.findProductByID(pid);
			Integer pnum = scart.getAmount();
			Double pdiscountDouble=product.getPdiscount();
			String pictureString = product.getPicture();
			Double rpriceDouble = product.getPrice();
			Double psumpriceDouble= scart.getSumprice();
			Record record = new Record(pid, pnum,pictureString,rpriceDouble,pdiscountDouble, psumpriceDouble, uid,sid);
			recordDao.saveRecord(record);
			Record record2 = recordDao.searchByUidAndSid(uid, sid);
			Order order = new Order(record2.getReId(), record2.getUid(),0,sumprice);
			orderService.saveOrder(order);
		}
		    msg = "true";
		return msg;
	}
	//checkorder
	@RequestMapping(value="/checkorder",method = RequestMethod.GET)
	public String checkorder(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		HttpSession session = request.getSession();
		User user = userService.getUserByAccount(account);
		List<Order> orderlist = orderService.findOrdersByUidAndOstate(user.getUid(), 0);
		Address address = addressService.queryAddressByUidAndAdefult(user.getUid(), 1);
		List<Record> recordlist = new ArrayList<Record>();
		for (Order order : orderlist) {
			Record recordsection = recordDao.queryRecordByrid(order.getRid());
			recordlist.add(recordsection);
		}
		session.setAttribute("user", user);
		model.addAttribute("address", address);
		model.addAttribute("recordlist",recordlist);
		if(!orderlist.isEmpty()){
			model.addAttribute("Osumprice", orderlist.get(0).getoSumprice());
		}
		return "User/checkorder";
	}
	
	//OrderService pay
	@RequestMapping(value="/payOrder",method = RequestMethod.GET)
	public String payOrder(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		System.out.println(account+"     zhanghao");
		HttpSession session = request.getSession();
		User user = userService.getUserByAccount(account);
		Address address = addressService.queryAddressByUidAndAdefult(user.getUid(), 1);
		float umoney = user.getUmoney();
		List<Order> orderlist = orderService.findOrdersByUidAndOstate(user.getUid(), 0);
		String Onum = "frm"+orderlist.get(0).getoId().toString()+user.getUid().toString();
		for (Order order : orderlist) {
			order.setOstate(1);
			order.setAid(address.getaId());
			order.setOnum(Onum);
			//订单生成时间
			orderService.modifyOrder(order);
			Record records = recordDao.queryRecordByrid(order.getRid());
			Scart scarts =scartService.findScartbySid(records.getSid());
			scartService.delete(scarts);
		}
		float osumprice = orderlist.get(0).getoSumprice().floatValue();
		System.out.println(umoney-osumprice);
		user.setUmoney(umoney-osumprice);
		userService.modify(user);
		request.getSession().removeAttribute("samount");
		List<Scart> scartList = scartService.findScartbyuid(user.getUid());
		int samount =scartList.size();
		session.setAttribute("samount", samount);
		model.addAttribute("osumprice", osumprice);
		model.addAttribute("address", address);
		session.setAttribute("user", user);
		return "User/paySuccess";
	}
	
    //查看已支付订单详情
	@RequestMapping(value="/orderPay",method = RequestMethod.GET)
	public String orderPay(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		User user = userService.getUserByAccount(account);
		//已支付订单但没有发货
		List<Order> orders = orderService.findOrdersByUidAndOstate(user.getUid(), 1);
		List<Record> recordlist = new ArrayList<Record>();
		List<String> onumlist = new ArrayList<String>();
		if(!orders.isEmpty()){
			 onumlist = orderService.queryOnumByUidAndOstate(user.getUid(), 1);
			 Integer osize = onumlist.size();
			 if (osize > 1) {
				for (String onum : onumlist) {
					for (Order order : orders) {
						if (order.getOnum().equals(onum)) {
							Record record = recordDao.queryRecordByrid(order.getRid());
							recordlist.add(record);
						}
					}
				}
			}else{
				for (Order order : orders) {
					Record record = recordDao.queryRecordByrid(order.getRid());
					recordlist.add(record);
				}
				Address address = addressService.queryAddressByAid(orders.get(0).getAid());
				model.addAttribute("address", address);
				model.addAttribute("recordlist", recordlist);
			}
			
		}
		return "User/Orderlist";
	}
	
	
	//查看订单
	@RequestMapping(value = "/allordercheck", method = RequestMethod.GET)
	public String allordercheck(HttpServletRequest request,Model model){
			//获取列表页
			//List<Product> productlist = 
				//	productService.showProductByPage(request, model);
			//model.addAttribute("productlist",productlist);
			//list.jsp+model=ModelAndView
		return "User/allordercheck";
	}
	
	//取消未支付的订单
	@RequestMapping(value="/cancelOrderUnpay",method = RequestMethod.GET)
	public String cancelOrderUnpay(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		User user1 =userService.getUserByAccount(account);
		int uid = user1.getUid();
		List<Order> orders = orderService.findOrdersByUidAndOstate(uid, 0);
		for (Order order : orders) {
			recordDao.deletebyrid(order.getRid());
			orderService.deleteOrder(order);
		}
		return "redirect:/Scart/"+account+"/listscart";
	}
	//取消已支付的订单
		
	// 后台查看已支付订单
	@RequestMapping(value = "/orderPaylist", method = RequestMethod.GET)
	public String orderPaylist(HttpServletRequest request, Model model) {
		// 已支付订单但没有发货
		orderService.showOrderByPage(1, request, model);
		return "Admin/list_ordery";
	}

	// 后台查看已发货订单
	@RequestMapping(value = "/getOrderSendlist", method = RequestMethod.GET)
	public String getOrderSendlist(HttpServletRequest request, Model model) {
		// 已支付订单但没有发货
		orderService.showOrderByPage(10, request, model);
		return "Admin/list_ordery";
	}

	// 后台查看已确认收货订单
	@RequestMapping(value = "/doGetOrderSendlist", method = RequestMethod.GET)
	public String doGetOrderSendlist(HttpServletRequest request, Model model) {
		// 已支付订单但没有发货
		orderService.showOrderByPage(11, request, model);
		return "Admin/list_ordery";
	}

	// 后台查看已取消订单
	@RequestMapping(value = "/getOrderCancelist", method = RequestMethod.GET)
	public String getOrderCancelist(HttpServletRequest request, Model model) {
		// 已支付订单但没有发货
		orderService.showOrderByPage(100, request, model);
		return "Admin/list_ordery";
	}

	//orderpayCheck
		@RequestMapping(value="/orderpayCheck",method = RequestMethod.GET)
		public String orderpayCheck(HttpServletRequest request,Model model){
			String onum = request.getParameter("onum");
			List<Order> orderlist = orderService.queryAllOrderByonum(onum);
			Address address = addressService.queryAddressByAid(orderlist.get(0).getAid());
			List<Record> recordlist = new ArrayList<Record>();
			for (Order order : orderlist) {
				Record recordsection = recordDao.queryRecordByrid(order.getRid());
				recordlist.add(recordsection);
			}
			model.addAttribute("onum",onum);
			model.addAttribute("Osumprice",orderlist.get(0).getoSumprice());
			model.addAttribute("address",address);
			model.addAttribute("recordlist",recordlist);
			 
			return "Admin/orderpayCheck";
		}
		
		//OrderService pay
		@RequestMapping(value="/sendOrder",method = RequestMethod.GET)
		public String sendOrder(HttpServletRequest request,Model model){
			String onum = request.getParameter("onum");
			List<Order> orderlist = orderService.queryAllOrderByonum(onum);
			for (Order order : orderlist) {
				order.setOstate(10);
				//订单发货等待收货
				orderService.modifyOrder(order);
			}
			return "redirect:/Order/orderPaylist";
		}
	
}
