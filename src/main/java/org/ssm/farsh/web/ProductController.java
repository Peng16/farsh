package org.ssm.farsh.web;

import java.io.File;  
import java.util.UUID;
import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.ssm.farsh.model.Address;
import org.ssm.farsh.model.Order;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.Record;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.ProductService;
import org.ssm.farsh.service.ScartService;
import org.ssm.farsh.service.UserService;

@Controller("ProductController")
@RequestMapping("/Product")//Url:/模块/资源/{id}/细分   /Product/list
public class ProductController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ProductService productService;
	private Product product;
	private UserService userService;
	private ScartService scartService;
	
	//查看商品
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,Model model){
		//获取列表页
		//List<Product> productlist = 
		productService.showProductByPage(request, model);
		//model.addAttribute("productlist",productlist);
		//list.jsp+model=ModelAndView
		return "Admin/list_product";
	}
	
	//添加商品
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(
			@RequestParam(value="pname")String pname,
			@RequestParam(value="price")String price,
			@RequestParam(value ="file")MultipartFile file,
			@RequestParam(value="psalenum")String psalenum,
			@RequestParam(value="pstock")String pstock,
			@RequestParam(value="pdiscount")String pdiscount,
			@RequestParam(value="pattern")String pattern,
			@RequestParam(value="pcategory")String pcategory,Model model)throws Exception{
		product=new Product();
		if(!file.isEmpty()){
			String picture = file.getOriginalFilename();
			String extendsname=picture.substring(picture.lastIndexOf("."));
			String picturenewName=UUID.randomUUID().toString()+new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+extendsname;
			logger.debug("Process file:{}",picture);
			FileUtils.copyInputStreamToFile(file.getInputStream(),new File("E:\\Workspaces\\farsh\\src\\main\\webapp\\resources\\images",picturenewName));
			System.out.println("图片名:"+file.getName()+"图片全名："+picture);
			product.setPicture(picturenewName);
		}else{
			System.out.println("图片不能为空");
		}
		//Date dateNow = new Date();
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//Date date = dateFormat.parse(dateNow.toString());
		Date date = new Date();
		product.setPubdate(date);
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setPsalenum(Integer.parseInt(psalenum));
		product.setPstock(Integer.parseInt(pstock));
		product.setPdiscount(Double.parseDouble(pdiscount));
		product.setPattern(pattern);
		product.setPcategory(pcategory);
		productService.saveProduct(product);
		return "redirect:/Product/list";
	}
	//修改商品
	@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
	public String modifyProduct(
			@RequestParam(value="pid")String pid,
			@RequestParam(value="pname")String pname,
			@RequestParam(value="price")String price,
			@RequestParam(value ="file")MultipartFile file,
			@RequestParam(value="psalenum")String psalenum,
			@RequestParam(value="pstock")String pstock,
			@RequestParam(value="pdiscount")String pdiscount,
			@RequestParam(value="pattern")String pattern,
			@RequestParam(value="pcategory")String pcategory,Model model)throws Exception{
		product=new Product();
		if(!file.isEmpty()){
			String picture = file.getOriginalFilename();
			String extendsname=picture.substring(picture.lastIndexOf("."));
			String picturenewName=UUID.randomUUID().toString()+extendsname;
			logger.debug("Process file:{}",picture);
			FileUtils.copyInputStreamToFile(file.getInputStream(),new File("E:\\Workspaces\\farsh\\src\\main\\webapp\\resources\\images",picturenewName));
			System.out.println("图片名:"+file.getName()+"图片全名："+picture);
			product.setPicture(picturenewName);
		}else{
			System.out.println("图片不能为空");
		}
		//Date dateNow = new Date();
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//Date date = dateFormat.parse(dateNow.toString());
		Date date = new Date();
		product.setPubdate(date);
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setPsalenum(Integer.parseInt(psalenum));
		product.setPstock(Integer.parseInt(pstock));
		product.setPdiscount(Double.parseDouble(pdiscount));
		product.setPattern(pattern);
		product.setPcategory(pcategory);
		product.setpId(Integer.parseInt(pid));
		productService.modifyProduct(product);
		return "redirect:/Product/list";
	}
	//add_product.jsp页面跳转
	@RequestMapping(value="/addpage",method = RequestMethod.GET)
	public String addString(){
		return "Admin/add_product";
	}
	//update_product.jsp页面跳转
	@RequestMapping(value="/updatepage",method = RequestMethod.GET)
	public String updatePage(HttpServletRequest request,Model model){
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("修改界面的商品编号为"+pid+"的商品需要修改");
		Product product =productService.findProductByID(pid);
		model.addAttribute("product",product);
		return "Admin/update_product";
	}
	//删除商品批量删除
	@RequestMapping(value="/deleteProduct",method = RequestMethod.POST)
	public String deleteProduct(HttpServletRequest request,Model model){
		String proString  = request.getParameter("allcheck");
		String[] item = proString.split(",");
		for(int i =0;i<item.length;i++){
			Integer pid =  Integer.parseInt(item[i]);
			product = new Product(pid);
			productService.deleteProduct(product);
		}
	//  System.out.println("删除界面的商品编号为"+request.getParameter("pid")+"的商品需要删除");
	//	Integer pid = Integer.parseInt(request.getParameter("pid"));
	//	System.out.println("删除界面的商品编号为"+pid+"的商品需要删除");
		return "redirect:/Product/list";
	}
	
	//删除商品bypid
		@RequestMapping(value="/deleteProductBypid",method = RequestMethod.POST)
		public String deleteProductbypid(HttpServletRequest request,Model model){
			    Integer pid = Integer.parseInt(request.getParameter("pid"));
				product = new Product(pid);
				productService.deleteProduct(product);
		//  System.out.println("删除界面的商品编号为"+request.getParameter("pid")+"的商品需要删除");
		//	Integer pid = Integer.parseInt(request.getParameter("pid"));
		//	System.out.println("删除界面的商品编号为"+pid+"的商品需要删除");
			return "redirect:/Product/list";
		}
	//商品详情界面
	@RequestMapping(value="/productMain",method = RequestMethod.GET)
	public String productMain(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		System.out.println("查找界面的商品编号为"+request.getParameter("pid")+"的商品需要查找");
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("查找界面的商品编号为"+pid+"的商品需要查找");
		Product product =productService.findProductByID(pid);
		model.addAttribute(product);
		return "User/productMain";
	}
	//查找商品详细信息
	@RequestMapping(value="/productdetail",method = RequestMethod.GET)
	public String productdetail(HttpServletRequest request,Model model){
		System.out.println("查找界面的商品编号为"+request.getParameter("pid")+"的商品需要查找");
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("查找界面的商品编号为"+pid+"的商品需要查找");
		Product product = productService.findProductByID(pid);
		model.addAttribute(product);
		return "User/productdetails";
	}

	// search product by pname or pcategory
	// searchPro
	@RequestMapping(value = "/searchPro", method = RequestMethod.POST)
	public String searchPro(@RequestParam(value="searchText")String searchText,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String account = (String)session.getAttribute("account");
		String searchTextGet = searchText.replaceAll(" ", "");
		System.out.println(searchTextGet+"controller");
		if("".equals(searchTextGet)||searchTextGet==null){
			return "redirect:/User/usermain";
		}else{
			if("".equals(account)||account==null){
				productService.searchProductByPage(searchTextGet, request, model);
			} else {
				User user = userService.getUserByAccount(account);
				List<Scart> scartList = scartService.findScartbyuid(user.getUid());
				int samount = scartList.size();
				productService.searchProductByPage(searchTextGet, request, model);
				session.setAttribute("samount", samount);
				session.setAttribute("user", user);
			}
			model.addAttribute("searchText", searchTextGet);
		}
		return "User/searchPro";
	}
	@RequestMapping(value = "/searchProList", method = RequestMethod.GET)
	public String searchProList(
			HttpServletRequest request, Model model)throws Exception {
		HttpSession session = request.getSession();
		String account = (String)session.getAttribute("account");
		String searchText = new String(request.getParameter("searchText").getBytes("iso-8859-1"),"utf-8");
		String searchTextGet = searchText.replaceAll(" ", "");
		System.out.println(searchTextGet+"controller");
		if("".equals(searchTextGet)||searchTextGet==null){
			return "User/searchPro";
		}else{
			if("".equals(account)||account==null){
				productService.searchProductByPage(searchTextGet, request, model);
			} else {
				User user = userService.getUserByAccount(account);
				List<Scart> scartList = scartService.findScartbyuid(user.getUid());
				int samount = scartList.size();
				productService.searchProductByPage(searchTextGet, request, model);
				session.setAttribute("samount", samount);
				session.setAttribute("user", user);
			}
			model.addAttribute("searchText", searchTextGet);
		}
		
		return "User/searchPro";
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
