<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
		<base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>Myfarm website Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
	    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/supersized.css">
	     
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
    </head>

    <body oncontextmenu="return false">
    	 <div class="contact" >
		<form action="User/doRegist" name="form1" method="post" enctype="multipart/form-data">
		     <h1 align="center">用户注册</h1>
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
			</ul>
			<b class="btn"><input type="submit" value="提交"/>
			<input type="reset" value="取消"/></b>
		</form>
	</div>
 
        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="<%=basePath %>resources/js/supersized.3.2.7.min.js"></script>
        <script src="<%=basePath %>resources/js/supersized-init.js"></script>
		<script type="text/javascript">
		$(".btn").click(function(){
			is_hide();
		});
		var u = $("input[name=account]");
		var p = $("input[name=pwd]");
		var u2 = $("input[name=admin]");
		var p2 = $("input[name=adpwd]");
		$(".p-utype").bind("change",function(){
			var utype = $(this).val();
			if($(".utype").val()!=utype){
				$(".div1").hide();
				$(".div2").show();
			}else{
				$(".div2").hide();
				$(".div1").show();
			}
		});
		$('.account').blur(function(){
					var account = u.val();
					if(account == '')
					{
						$("#ts").html("用户名不能为空~");
						is_show();
						return false;
					}
				 /*
					 //alert("正在验证。。。。。。。");
						$.post("User/checkAccount",{"account":account},function(data){
							alert("验证之中。。。。"+msg);
							if("该用户不存在!".equals(data)){
			   	   				$("#ts").html("该用户不存在!");
								is_show();
								return false;
			    		 	}else{
			    		 		/* $('.pwd').blur(function(){
			    					var pwd = p.val();
			    					if(pwd == '')
			    					{
			    						$('#ts').html("密码不能为空~");
			    						is_show();
			    						return false;
			    					}else{
			    						$.post("",{"account":account,"pwd":pwd},function(data){
			    							
			    						}); 
			    					} 
			    				});
				    		}
						}); **/
					
					$.ajax({
						type:"POST",
						url:"User/checkAccount",
						data:{"account":account},
						success:function(data){
							alert("验证之中。。。。   "+data);
							console.log(data);
							if("该用户不存在!".equals(data)){
			   	   				$("#ts").html("该用户不存在!");
								is_show();
							}
						},error:function(data){
							//alert("验证之中。。。。"+msg+ "   "+data);
							console.log(data);
							alert("验证之中。。。。   "+data);
						}
					});
				});
		$("#saveCheckbox").click(function(){
			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}else{
				
			}
		});
		
		$("#submit").live('click',function(){

			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}
			else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u.val()))
				{
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}
			}
		});
		/* 
		//div2
		$('.account2').blur(function(){
					var account = u2.val();
					if(account == '')
					{
						$("#ts2").html("管理员账号不能为空~");
						is_show();
						return false;
					}
					
					 //alert("正在验证。。。。。。。");
						$.post("User/checkAccount",{"account":account},function(data){
							alert("验证之中。。。。"+msg);
							if("该用户不存在!".equals(data)){
			   	   				$("#ts").html("该用户不存在!");
								is_show();
								return false;
			    		 	}else{
			    		 		/* $('.pwd').blur(function(){
			    					var pwd = p.val();
			    					if(pwd == '')
			    					{
			    						$('#ts').html("密码不能为空~");
			    						is_show();
			    						return false;
			    					}else{
			    						$.post("",{"account":account,"pwd":pwd},function(data){
			    							
			    						}); 
			    					}
			    				}); 
				    		}
						});
					
					$.ajax({
						type:"POST",
						url:"User/checkAccount",
						data:{"admin":admin},
						success:function(data){
							alert("验证之中。。。。   "+data);
							console.log(data);
							if("此管理员不存在!".equals(data)){
			   	   				$("#ts2").html("此管理员不存在!");
								is_show();
							}
						},error:function(data){
							//alert("验证之中。。。。"+msg+ "   "+data);
							console.log(data);
							alert("验证之中。。。。   "+data);
						}
					});
				});
					
		$("#saveCheckbox").click(function(){
			if(u2.val() == '' || p2.val() =='')
			{
				$("#ts2").html("管理员账号或密码不能为空~");
				is_show();
				return false;
			}else{
				
			}
		});
		
		$("#submit").live('click',function(){

			if(u2.val() == '' || p2.val() =='')
			{
				$("#ts2").html("管理员账号或密码不能为空~");
				is_show();
				return false;
			}
			else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u2.val()))
				{
					$("#ts2").html("管理员账号错误");
					is_show();
					return false;
				}
			}
		});
		 
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
			$(".p-utype").val("用户");
		};
		
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300); }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300); }
		
		**/
	</script>
    </body>

</html>

