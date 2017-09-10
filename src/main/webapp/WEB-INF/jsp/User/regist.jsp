<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html> 
<head>
  <title>regist</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keywords" content="HTML,CSS,XML,JavaScript">
  <meta charset="utf-8" />
  <script type="text/javascript" src="http://www.jqueryba.com/lib/1.4.4/jquery.js"></script>
  <script type="text/javascript" src="js/inputmail.js"></script>
  <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/My97DatePicker/WdatePicker.js"></script>
  <style type="text/css">
		body{
			font:14px/28px "微软雅黑";
		}
		.contact *:focus{outline :none;}
		.contact{
			width: 700px;
			height: auto;
			background: #f6f6f6;
			margin: 40px auto;
			padding: 10px;
		}
		.contact ul {
			width: 650px;
			margin: 0 auto;
		}
		.contact ul li{
			border-bottom: 1px solid #dfdfdf;
			list-style: none;
			padding: 12px;
		}
		.contact ul li label {
			width: 120px;
			display: inline-block;
			float: left;
		}
		.contact ul li input[type=text],.contact ul li input[type=password]{
			width: 220px;
			height: 25px;
			border :1px solid #aaa;
			padding: 3px 8px;
			border-radius: 5px;
		}
		.contact ul li input:focus{
			border-color: #c00;
			
		}
		.contact ul li input[type=text]{
			transition: padding .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input[type=password]{
			transition: padding  .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input:focus{
			padding-right: 70px;
		}
		.btn{
			position: relative;
			left: 300px;
		}
		.tips{
			color: rgba(0, 0, 0, 0.5);
			padding-left: 10px;
		}
		.tips_true,.tips_false{
			padding-left: 10px;
		}
		.tips_true{
			color: green;
		}
		.tips_false{
			color: red;
		}
  </style>
  <script type="text/javascript">
	    function checkna(){
			na=form1.account.value;
		  	if( na.length <1 || na.length >12)  
	  		{  	
	  			divname.innerHTML='<font class="tips_false">长度是1~12个字符</font>';
	  		     
	  		}else{  
	  		    divname.innerHTML='<font class="tips_true">输入正确</font>';
	  		}  
	  	
	  }

	  //验证密码 
		function checkpsd1(){    
			psd1=form1.pwd.value;  
			var flagZM=false ;
			var flagSZ=false ; 
			var flagQT=false ;
			if(psd1.length<6 || psd1.length>12){   
				divpassword1.innerHTML='<font class="tips_false">长度错误</font>';
			}else
				{   
				  for(i=0;i < psd1.length;i++)   
					{    
						if((psd1.charAt(i) >= 'A' && psd1.charAt(i)<='Z') || (psd1.charAt(i)>='a' && psd1.charAt(i)<='z')) 
						{   
							flagZM=true;
						}
						else if(psd1.charAt(i)>='0' && psd1.charAt(i)<='9')    
						{ 
							flagSZ=true;
						}else    
						{ 
							flagQT=true;
						}   
					}   
					if(!flagZM||!flagSZ||flagQT){
					divpassword1.innerHTML='<font class="tips_false">密码必须是字母数字的组合</font>'; 
					 
					}else{
						
					divpassword1.innerHTML='<font class="tips_true">输入正确</font>';
					 
					}  
				 
				}	
		}
		//验证确认密码 
		function checkpsd2(){ 
				if(form1.pwd.value!=form1.pwd2.value) { 
				     divpassword2.innerHTML='<font class="tips_false">您两次输入的密码不一样</font>';
				} else { 
				     divpassword2.innerHTML='<font class="tips_true">输入正确</font>';
				}
		}
		
		//验证电话号码
		function checkphone(){ 
				 phone=form1.phone.value;
				 var ab=/^[1][3578][0-9]{9}$/; 
				 if(ab.test(phone) == false || phone==0){ 
				 	divphone.innerHTML='<font class="tips_false">输入错误</font>' ;
				 }else{ 
				 	divphone.innerHTML='<font class="tips_true">输入正确</font>' ; 
				 } 
			 } 
  </script>
</head>
<body>
	<div class="contact" >
		<form action="user_add.action" name="form1" method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label>账号：</label>
					<input type="text" name="account" placeholder="请输入用户名"  onblur="checkna()" required/><span class="tips" id="divname">长度1~12个字符</span>
				</li>
				<li>
					<label>密码：</label>
					<input type="password" name="pwd" placeholder="请输入你的密码" onblur="checkpsd1()" required/><span class="tips" id="divpassword1">密码必须由字母和数字组成</span>
				</li>
				<li>
					<label>确认密码：</label>
					<input type="password" name="pwd2" placeholder="请再次输入你的密码" onblur="checkpsd2()" required/><span class="tips" id="divpassword2">两次密码需要相同</span>
				</li>
				<li>
					<label>用户名：</label>
					<input type="text" name="uname" placeholder="请输入用户名"  onblur="checkna()" required/><span class="tips" id="divname">长度1~12个字符</span>
				</li>
			</ul>
			<b class="btn"><input type="submit" value="提交"/>
			<input type="reset" value="取消"/></b>
		</form>
	</div>
</body>
</html>


