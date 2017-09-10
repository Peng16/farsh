<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="Store/css/Login.css">
	<script type="text/javascript" src="Store/js/jquery-1.9.1.min.js"></script>
		
	<script type="text/javascript">

			
		$(function(){
			
			var a =null;
			var r=null;
			var mail = null;
			var phone =  null;
			$("#next").click(function(){
				
				a = $("#forgetap").val();
				$.post("User_ForgetCheck",{"forget":a},function(data){
					if(data == null || data == ""){
						alert("账号不存在!");
					}else{
						
						$("#forgte_bg").attr("src","Store/img/QQ20160328145849.png");
						$("#forget_check").hide();
						$("#forget_yanzhengfangshi").show();
						var arr=data.split(",");
						mail = arr[0];
						phone = arr[1];
					}
				});
			});

			$("#phone_back").click(function(){
				$("#forget_yanzhengfangshi").hide();
				$("#forget_phone").show();
				$("#fphone").val(phone);
				$(".kapkey").focus();
				r=Math.floor(Math.random()*899999+100000);
			});

			$("#mail_back").click(function(){
				$("#forget_yanzhengfangshi").hide();
				$("#forget_mail").show();
				$("#fmail").val(mail);
				$(".kapkey1").focus();
				r=Math.floor(Math.random()*899999+100000);
			});
			
			$("#getKey").click(function(){
				$.post("User_duanxin.action",{"udphone":a,"r":r},function(){
					
				});
				
			});

			$("#getKey1").click(function(){
				$.post("User_mail.action",{"udmail":mail},function(data){
					r = data;
				});
				
			});

			$("#next1").click(function(){
				var temp = $(".kapkey").val();
				//alert(r);
				if(temp == r){
					$("#forget_phone").hide();
					$("#forget_pwd").show();
					$("#fpphone").val(a);
					$("#forgte_bg").attr("src","Store/img/QQ20160328150054.png");		
				}else{
					alert("手机验证码有误!");
				}
			});

			$("#next2").click(function(){
				var temp = $(".kapkey1").val();
				//alert(r);
				if(temp == r){
					$("#forget_mail").hide();
					$("#forget_pwd").show();
					$("#fpphone").val(a);
					$("#forgte_bg").attr("src","Store/img/QQ20160328150054.png");				
				}else{
					alert("邮箱验证码有误!");
				}
			});
			
	});
	
	</script>	
		
	<style type="text/css">
	.formLine{color: #d9d9d9;height: 40px;display: inline-block;border-left: 1px solid #dadada;position: absolute;right: 100px;top: 5px;}
	#getKey{width: 80px;border: none;outline: none;height: 50px;line-height: 50px;font-size: 16px;position: absolute;right: 10px;top: 0px;}
	#getKey1{width: 80px;border: none;outline: none;height: 50px;line-height: 50px;font-size: 16px;position: absolute;right: 10px;top: 0px;}
	</style>
	
	<script type="text/javascript">
  window.onload=function(){
    var send=document.getElementById('getKey'),
      times=30,
      timer=null;
    send.onclick=function(){
     // 计时开始
     var that = this;
      this.disabled=true;
      timer = setInterval(function(){
        times --;
        that.value = times + "秒重试";
        if(times <= 0){
          that.disabled =false;
          that.value = "发送验证码";
          clearInterval(timer);
          times = 60;
        }
        //console.log(times);
      },1000);  
    }  
  } 
  </script>
	
	<script type="text/javascript">
  window.onload=function(){
    var send=document.getElementById('getKey1'),
      times=30,
      timer=null;
    send.onclick=function(){
     // 计时开始
     var that = this;
      this.disabled=true;
      timer = setInterval(function(){
        times --;
        that.value = times + "秒重试";
        if(times <= 0){
          that.disabled =false;
          that.value = "发送验证码";
          clearInterval(timer);
          times = 60;
        }
        //console.log(times);
      },1000);  
    }  
  } 
  </script>
	
  </head>
  
  <body >

		<div id='content' class="content">

			<div id="header">
				<a href="#" class='meizuLogo'><img src="Store/img/lo1.png"> </a>
				<div id="trigger">
					<a href="Store/Login.jsp" id="toLogin" class='linkAGray'>登录</a>
					<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
					<a href="Store/Register.jsp" id="toRegister" class='linkAGray'>注册</a>
				</div>
		</div>
		
		<div align="center" style="font-size: 35px; margin-top: 80px;">
			找回登陆密码
		</div>
		<div align="center" >
			<img id="forgte_bg" src="Store/img/QQ20160328145719.png">
		</div>
		<div id="forget_check">
			<div align="center">
				<div class="normalInput" >
					<input type="text" id="forgetap" class="phone"   placeholder="手机 / Flyme账号">	
				</div>
			</div>
			<div align="center">
					<a id="next" class="fullBtnBlue">下一步</a>
			</div>
		</div>
		
		<div id="forget_yanzhengfangshi" style="display: none;">
			<div   align="center">
					<a id="phone_back"   class="fullBtnBlue">手机找回</a>
			</div>
			<div   align="center">
					<a id="mail_back"  class="fullBtnBlue">安全邮箱找回</a>
			</div>
		
		</div>
		<div id="forget_phone" style="display: none;">
			<div align="center">
				<div class="normalInput">
					<input name="" type="text" id="fphone" class="phone" maxlength="11" readonly="true" placeholder="手机号码">	
				</div>
			</div>
			<div align="center">	
				<div class="normalInput">
					<input type="text" class="kapkey" maxlength="6" placeholder="验证码">
					<span class="formLine"></span>
					 <input style="cursor:pointer;" id="getKey" class="linkABlue" type="button"  value="发送验证码">
				</div>
			</div>
			<div align="center">
					<a id="next1" class="fullBtnBlue">下一步</a>
			</div>	
		</div>
		
		<div id="forget_mail"  style="display: none;">
			<div align="center">
				<div class="normalInput">
					<input name="" type="text" id="fmail" class="phone" maxlength="" readonly="true" placeholder="安全邮箱">	
				</div>
			</div>
			<div align="center">	
				<div class="normalInput">
					<input type="text" class="kapkey1" maxlength="6" placeholder="验证码">
					<span class="formLine"></span>
					 <input style="cursor:pointer;" id="getKey1" class="linkABlue" type="button"  value="发送验证码">
				</div>
			</div>
			<div align="center">
					<a id="next2" class="fullBtnBlue">下一步</a>
			</div>	
		</div>
		
		
		<div id="forget_pwd" style="display: none;">
			<form action="User_backPwd.action" method="post">
				<input type="hidden" id="fpphone" value="" name="udphone">
				<div align="center">
					<div class="normalInput">
						<input name="udpwd" type="text" id="fpwd"   placeholder="新的密码">	
					</div>
				</div>
				<div align="center">
					
					<input type="submit" id="next3" class="fullBtnBlue" value="修改">
				</div>	
			</form>
			
		</div>
		
		
		<!--尾部-->
		<div style="top: 669px;" id="flymeFooter" class="footerWrap">
				<div class="footerInner">
					<div class="footer-layer1">
						<div class="footer-innerLink">
							<a href="javascript:void(0)" target="_blank" title="关于魅族">关于魅族</a>
							<img class="foot-line" src="Store/img/space.gif">
							<a href="javascript:void(0)" target="_blank" title="工作机会">工作机会</a>
							<img class="foot-line" src="Store/img/space.gif">
							<a href="javascript:void(0)" target="_blank" title="联系我们">联系我们</a>
							<img class="foot-line" src="Store/img/space.gif">
							<a href="javascript:void(0)" target="_blank" title="法律声明">法律声明</a>
							<img class="foot-line" src="Store/img/pace.gif">
							<a href="javascript:void(0);" id="globalName" class="footer-language" title="简体中文">简体中文&nbsp;&nbsp;&nbsp;</a>
						</div>
						
						<div class="footer-service">
							<span class="service-label">客服热线</span>
							<span class="service-num">400-788-3333</span>
							<a id="service-online" class="service-online" href="javascript:void(0);" title="在线客服">在线客服</a>
						</div>
						
						<div class="footer-outerLink">
							<a class="footer-sinaMblog" href="javascript:void(0)" target="_blank"><i class="i_icon"></i></a>
							<a class="footer-tencentMblog" href="javascript:void(0)" target="_blank"><i class="i_icon"></i></a>
							<a id="footer-weChat" class="footer-weChat" href="javascript:void(0);" target="_blank"><i class="i_icon"></i></a>
							<a class="footer-qzone" href="javascript:void(0)" target="_blank"><i class="i_icon"></i></a>
						</div>
					</div>
					
					<div class="clear"></div>
					
					<div id="flymeCopyright" class="copyrightWrap">
						<div class="copyrightInner">
							<span>©2016 Meizu Telecom Equipment Co., Ltd. All rights reserved.</span>
							<a href="javascript:void(0)" class="linkAGray" target="_blank">备案号: 粤ICP备13003602号-4</a>
							<a href="javascript:void(0)" class="linkAGray" target="_blank">经营许可证编号: 粤B2-20130198</a>
							<a target="_blank" href="javascript:void(0)" hidefocus="true" class="linkAGray">营业执照</a>
						</div>
					</div>
					
				</div>
			</div>

		</div>
  </body>
</html>
