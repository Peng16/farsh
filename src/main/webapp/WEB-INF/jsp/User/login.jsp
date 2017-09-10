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
        <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/reset.css">
	    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/supersized.css">
	    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/style.css">

    </head>

    <body oncontextmenu="return false">
    	<div class="page-Utype">
        	<select class="p-utype" id="utype" onchange="changeutype()">
        		<option selected="selected" value="用户">用户</option>
        		<option value="管理员">管理员</option>
        	</select>
        </div>
       
        <div class="page-container">
           <div class="div1">
            <h1>MyFarm农场门户网</h1>
             <form action="User/dologin" method="post">
             		<input type="hidden" name="utype" class="utype" value="用户"/>
				<div>
					<input type="text" name="account" class="account" placeholder="输入账号/邮箱/手机号" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="pwd" class="pwd" placeholder="输入密码" oncontextmenu="return false"  />
                </div>
                 <div class="cell vcode">
					<input type="text" name="rand" id="valcode" class="text" autocomplete="off" maxlength="6" style="height: 35px; width:130px; vertical-align: bottom;"placeholder="输入验证码" />
          			<img border=0 src="User/validateimage" id="js-valcode" class="button btn-disabled" style="width: 130px;height: 35px;  "/>	
                </div>
               <div id="saveState" class="saveState" style="margin-top: 15px;">
						<span class="StorePwd"> <input id="saveCheckbox"
								type="checkbox"  name="saveCheckbox"/> </span>
						<label style="color:black">
							记住登录状态
						</label>&nbsp;&nbsp;
						<a id="forgetPwd" href="#" class="linkABlue">忘记密码?</a>&nbsp;&nbsp;
						<a href="User/regist" id="toRegister" class='linkAGray'>注册</a>
					</div>
               <button id="submit" type="submit">登录</button> <br>
              </form>
           </div>
             	<!-- hide 层 -->
		 <div class="page-container div2"  style="overflow: hidden; display: none;">
            <h1>MyFarm农场后台管理系统</h1>
             <form action="User/dologin" method="post">
            	 <input type="hidden" name="utype" class="utype" value="管理员"/>
				<div>
					<input type="text" name="account" class="account2" id="admin" placeholder="输入账号" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="pwd" class="pwd2" id="adpwd" placeholder="输入密码" oncontextmenu="return false"  />
                </div>
               <div id="saveState" class="saveState" style="margin-top: 15px;">
						<span class="StorePwd"> <input id="saveCheckbox"
								type="checkbox"  name="saveCheckbox"/> </span>
						<label style="color:black">
							记住登录状态
						</label>&nbsp;&nbsp;
						<a id="forgetPwd" href="#" class="linkABlue">忘记密码?</a>&nbsp;&nbsp;
						<a href="User/regist" id="register" class='linkAGray'>注册</a>
					</div>
               <button id="submit2" type="submit">登录</button> <br>
              </form>
           
        </div> 
            
            <div class="connect">
                <p>If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
				<p style="margin-top:20px;">如果只是遇见，不能停留，不如不遇见。</p>
            </div>
        </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
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
		var u2 = $("#admin");
		var p2 = $("#adpwd");
		$(".p-utype").bind("change",function(){
			var utype = $(this).val();
			if($(".utype").val()!=utype){
				$(".div1").hide();
				$(".div2").show();
				alert($(".utype").val());
				alert(utype);
			}else{
				$(".div2").hide();
				$(".div1").show();
				alert($(".utype").val());
				alert(utype);
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
		
		$("#submit2").live('click',function(){
			 
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
		 
		</script>
    </body>

</html>

