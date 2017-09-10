package org.ssm.farsh.web;

import java.io.File;  
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List; 
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.ScartService;
import org.ssm.farsh.service.UserService;

@Controller("UserController")
@RequestMapping("/User") //Url:/模块/资源/{id}/细分   /User/list
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	@Autowired
	private ScartService scartService;
	//得到所有的用户信息
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,Model model){
		//获取列表页
		userService.showUserByPage(request, model);
		return "Admin/list_user";
	}
	
	//得到该用户的详细信息	
	@RequestMapping(value = "/{Uid}/detail",method = RequestMethod.GET)
	public String detail(@PathVariable("Uid") Integer Uid, Model model){
		if(Uid==null){
			return "redirect:/User/list";
		}
		User user = userService.find(Uid);
		if(user == null){
			return "forward:/User/list";
		}
		model.addAttribute("user",user);
		return "front/detail";
	}
	
	//登录验证
	// User/login.jsp
	@RequestMapping(value = "/dologin",method = RequestMethod.POST)
	public String dologin(@RequestParam(value="account")String account,
			@RequestParam(value="pwd")String pwd,
			@RequestParam(value="utype")String utype,
			Model model,HttpServletRequest request,HttpServletResponse response)throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String utypeStr = new String(utype.getBytes("iso-8859-1"),"utf-8");
		System.out.println(utypeStr +"    jsl"+utypeStr.equals("用户"));
			User user=userService.getUserByaccountandpwd(account, pwd);
			PrintWriter out = response.getWriter(); 
			if(user!=null){
				HttpSession session = request.getSession();
				if(utypeStr.equals("管理员")){
					User user1 = userService.find(user.getUid());
					session.setAttribute("admin", user1);
					return "redirect:/User/admain";
				}else if(utypeStr.equals("用户")){
					String rand = request.getParameter("rand").toLowerCase();
					String randimage = (String)session.getAttribute("rand");
					System.out.println(rand +"  "+ randimage.toLowerCase());
					if(randimage.toLowerCase().equals(rand)){
						List<Scart> scartList =scartService.findScartbyuid(user.getUid());
						User user2 = userService.find(user.getUid());
						int samount =scartList.size();
						session.setAttribute("samount", samount);
						session.setAttribute("user", user2);
						System.out.println(user2.getName()+user2.getuType());
						return "User/usermain";
					}else{
						out.println("<script type='text/javascript'>");
						out.println("alert('验证码输入错误！请重新登录');");
						out.println("window.location.href='login';");
						out.println("</script>");
						out.close();
						return "redirect:/User/login";
					}
				}
			}else{
				out.println("<script type='text/javascript'>");
				out.println("alert('该用户不存在，请确认后登录！');");
				out.println("window.location.href='login';");
				out.println("</script>");
				out.close();
			}
		return "User/login";
	}
	//验证账号是否存在
	@RequestMapping(value="/checkAccount",method=RequestMethod.POST)
	public @ResponseBody String checkAccount(@RequestParam Map<String, Object> param,HttpServletRequest request,Model model){
		boolean isExist;
		String msg;
		isExist = userService.checkAccount(request, model);
		System.out.println(isExist);
		if(isExist!=true){
			 msg = "该用户不存在!";
			 return  msg;
		}
		  msg="该用户已存在";
		  return  msg;
	}
	//注册regist
	@RequestMapping(value = "/doRegist",method = RequestMethod.POST)
	public String doregist(
			@RequestParam(value="account")String account,
			@RequestParam(value="pwd")String pwd, Model model)throws Exception{
		 User user = new User(account,pwd);
		 userService.saveUser(user);
		 
		return "User/login";
	}
	
	
	//用户中心usercenter.jsp
	@RequestMapping(value ="/{account}/usercenter",method = RequestMethod.GET)
	public String usercenter(@PathVariable("account") String account,HttpServletRequest request, Model model){
		User user = userService.getUserByAccount(account);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "User/usercenter";
	}
    //修改用户信息userhome.jsp
	@RequestMapping(value="/{account}/userhome",method = RequestMethod.GET)
	public String userhome(@PathVariable("account") String account,HttpServletRequest request){
		User user = userService.getUserByAccount(account);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "User/userhome";
	}
	//修改用户信息
	//修改商品
		@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
		public String modifyUser(
				@RequestParam(value="name")String name,
				@RequestParam(value="birthday")String birthday,
				@RequestParam(value="sex")String sex,
				@RequestParam(value="phone")String phone,
				@RequestParam(value="email")String email,
				HttpServletRequest request,
				Model model)throws Exception{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 String account = request.getParameter("account");
			 User user = userService.getUserByAccount(account);
			 user.setName(name);
			 user.setBirthday(sdf.parse(birthday));
			 user.setSex(sex);
			 user.setPhone(phone);
			 user.setEmail(email);
			 userService.modify(user);
			 model.addAttribute("user", user);
			return "User/userhome";
		}
		
	//修改图片uploadPic
		//保存图片实例
		@RequestMapping(value="/uploadPic",method=RequestMethod.POST)
		public String uploadPic(@RequestParam("pic")MultipartFile pic,HttpServletRequest request,Model model) throws IOException{
			 String account = request.getParameter("account");
			 User user = userService.getUserByAccount(account);
			if(!pic.isEmpty()){
				String picture = pic.getOriginalFilename();
				String extendsname=picture.substring(picture.lastIndexOf("."));
				String picturenewName=UUID.randomUUID().toString()+new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+extendsname;
				logger.debug("Process file:{}",picture);
				FileUtils.copyInputStreamToFile(pic.getInputStream(),new File("E:\\Workspaces\\farsh\\src\\main\\webapp\\resources\\images\\uImages",picturenewName));
				System.out.println("图片名:"+pic.getName()+"图片全名："+picture);
				user.setUpicFilename(picturenewName);
				userService.modify(user);
				model.addAttribute("user", user);
			}else{
				System.out.println("图片不能为空");
			}
			return "User/userhome";
		}	
	//ucenter.jsp
	@RequestMapping(value="/ucenter",method = RequestMethod.GET)
	public String ucenter(Model model){
		return "User/ucenter";
	}
	//退出
	@RequestMapping(value="/Exit",method=RequestMethod.GET)
	public String Exit(HttpServletRequest request,Model model){
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("samount");
		return "User/usermain";
	}
	
	//添加管理员
	@RequestMapping(value ="/addadmain",method = RequestMethod.POST)
	public String addadmin(
			@RequestParam(value="account")String account,
			@RequestParam(value="pwd")String pwd,
			@RequestParam(value="uauthority")String uauthority,Model model)throws Exception{
		String utype ="管理员"; 
		System.out.println("打印输出"+account+"....... "+pwd+"....... "+utype+"....... "+uauthority+".......jjk");
		 User user  = new User(account,pwd,utype,uauthority);
		 userService.saveUser(user);
		return "redirect:/User/list";
	}
	//删除用户
	@RequestMapping(value="/deleteUser",method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request,Model model){
		System.out.println("删除界面的 编号为"+request.getParameter("uid")+"的 需要删除");
		Integer uid = Integer.parseInt(request.getParameter("uid"));
		System.out.println("删除界面的 编号为"+uid+"的 需要删除");
		User user = new User(uid);
		userService.delete(user);
		return "redirect:/User/list";
	}
	// 管理员主界面User/admain.jsp
	@RequestMapping(value = "/admain", method = RequestMethod.GET)
	public String adminmain(Model model) {
		return "Admin/admain";
	}
	//管理员首页开始User/begin.jsp
	@RequestMapping(value="/begin",method = RequestMethod.GET)
	public String begin(Model model){
		return "Admin/begin";
	}
	// User/login.jsp
	@RequestMapping(value = "/login")
	public String login(Model model){
		return "User/login";
	}
	 
	//User/main.jsp
	@RequestMapping(value="/main")
	public String main(Model model){
		return "User/main";
	}
	//User/regist.jsp
	@RequestMapping(value="/regist")
	public String regist(Model model){
		return "User/register";
	}
	///User/validateimage.jsp
	@RequestMapping(value="/validateimage")
	public String validateimage(Model model){
		return "User/validateimage";
	}
	
	//User/usermain.jsp
	@RequestMapping(value="/usermain")
	public String usermain(Model model){
		return "User/usermain";
	}
	//保存图片实例
	@RequestMapping(value="/doUpload",method=RequestMethod.POST)
	public String doUploadFile(@RequestParam("file")MultipartFile file) throws IOException{
		if(!file.isEmpty()){
			logger.debug("Process file:{}",file.getOriginalFilename());
			FileUtils.copyInputStreamToFile(file.getInputStream(),new File("E:\\Workspaces\\farsh\\src\\main\\webapp\\resources\\images",file.getOriginalFilename()));
		}
		return "front/success";
	}
}
