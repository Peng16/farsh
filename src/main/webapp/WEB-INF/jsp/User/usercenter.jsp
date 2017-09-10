<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'usertest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="resources/css/style2.css" />
<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>

<script type="text/javascript">
function fun(){
	 alert("请先登录！！");
	 window.location="User/login";
	}
</script>

<style type="text/css">
	#center_1{
		width: 235px;
		height: 680px;
		background-color: #FFFFFF;
		position: absolute;
		top:50px;
		left:45px;
	}
#center_2{
		width: 1000px;
		height: 700px;
		background-color: #FFFFFF;
		position: absolute;
		top:50px;
		left:300px;
	}
	a:link{
		color:#000000;
		text-decoration:none;
		font-size:15px;
	}
	a:visited{
		color:#000000;
		text-decoration:none;
		font-size:15px;
	}
	a:hover{
		color:#FF0000;
	}
	a:active{
		color:#FF0000;
	}
</style>


  </head>
  
  <body>
     <div id="big_head">
 		<div id="head">
	 		<a href="#">myFarm农场官网</a> 
	   	 	<a href="#">myFarm商城</a> 
	   	 	<a href="#">服务</a> 
	   	 	<a href="#">社区</a> 
		</div>
		<div id="head_a">
			<c:choose>
				 <c:when test="${user.account == null}">
   	 			      			<ul>
								<li style="line-height: 40px;text-align:center; "><a onclick="fun();" >购物车（0）</a></li>
							</ul>
   	 			  </c:when>
				  <c:otherwise>
   	 			           	<ul>
								<li style="line-height: 40px;text-align:center; "><a href="Scart/${user.account}/listscart">购物车（${samount }）</a></li>
							</ul>
   	 			  </c:otherwise>
			</c:choose>
		
		<div id="small_head">
	   	 		<c:choose>
   	 			      <c:when test="${user.account == null}">
   	 			      		<a href="User/login" >登录</a>|<a href="User/userregister">注册</a>
   	 			      </c:when>
   	 			      <c:otherwise>
   	 			              <a href="User/${user.account}/usercenter">${user.account }</a>|
   	 			              <a href="User/${user.account}/Exit">退出</a>
   	 			      </c:otherwise>
   	 			</c:choose>
	   	</div>
	</div>   	 	
 	</div>
 	 	<div id="big_center">
 		<div id="small_center">
 			<a href="#"><img src="resources/images/backgr/logo-player.png" width="100px" height="100px" /></a>
 		</div>
 		<div id="menu">
   	 			<ul id="big_menu">
   	 				<li>
   	 					<a href="#">生鲜肉类</a>
   	 					<div id="big_menu_content"  style="z-index:900;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_c">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">新鲜水果</a>
   	 					<div id="big_menu_content" style="z-index:910;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">健康蔬菜</a>
   	 					<div id="big_menu_content" style="z-index:920;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">农场环境</a>
   	 					<div id="big_menu_content" style="z-index:930;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li><a href="">服务</a></li>
   	 			</ul>
 		</div>
 		<div class="searchBar sc">
 			<form action="Product/searchPro" method="post"enctype="multipart/form-data">
				<input name="searchText" type="text" id="searchText" />
				<input type="submit" id="toSearch" class="submit ts-btn" value="搜索"/>
			</form>
 		</div>
 	</div>
 <script type="text/javascript" src="<%=basePath%>/resources/js/script.js"></script>
 	<div id=bottom_center>
 	<div id="center_1">
    		<ul>
    			<li></li>
    			<li></li>
    			<li><span style="font-weight: 900;font-size: 15px;">订单中心</span></li>
    			<li><a href="#">待发货</a></li>
    			<li><a href="Order/checkorder?account=${user.account }">待支付</a></li>
    			<li><a href="#">待收货</a></li>
    			<li><a href="#">全部订单</a></li>
    			<li></li>
    			<li></li>
    			<li><span style="font-weight: 900;font-size: 15px;">个人中心</span></li>
    			<li><a href="User/${user.account}/usercenter">我的个人中心</a></li>
    			<li><a href="collectpro_list.action?userName=${user.account }">喜欢的商品</a></li>
    			<li><a href="Address/${user.account }/addresslist" target="manage">收货地址</a></li>
    			<li><a href="opinion_listadvice.action?userName=${sessionScope.account }">意见箱</a></li>
    			<li></li>
    			<li></li>
    			<li><span style="font-weight: 900;font-size: 15px;">售后服务</span></li>
    			<li><a href="#">换货单</a></li>
    			<li><a href="#">退款单</a></li>
    			<li><a href="#">维修单</a></li>
    			<li></li>
    			<li></li>
    			<li><span style="font-weight: 900;font-size: 15px;">账号管理</span></li>
    			<li><a href="#">个人信息</a></li>
    			<li><a href="#">修改密码</a></li>
    			<li><a href="#">社区VIP认证</a></li>
    		</ul>
    	</div>
    	<div id=center_2>
    		 <iframe class="J_iframe"  name="manage" width="100%" height="100%" src="User/ucenter" frameborder="0"></iframe>
    	</div>
    
 		 

   
  		</div>
  	<div id="last" style="margin-top: 800px">
		<div id="head_last">
			<ul>
				<li><a href="#">1小时速达服务</a></li>
				<li><a href="#">即时无理由退货</a></li>
				<li><a href="#">满60元包邮</a></li>
				<li><a href="#">百余家售后网点</a></li>
			</ul>
		</div>
		<div id="center_last">
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<div id="dt_right">
				<ul>
					<li><p style="font-size: 20px;color: #FF6700" align="center">400-100-5678</p></li>
					<li><p style="color:#616161;font-size:12px;" align="center">周一至周日 8:00-18:00</p></li>
					<li><p style="color:#616161;font-size:12px;" align="center">（仅收市话费)</p></li>
				</ul>
				<div id="button" align="center"><a href="#">24小时在线客服</a></div>
			</div>
		</div>
		<div id="bottom_last">
			<div id="logo">
				<img src="resources/images/backgr/logo_myFarm02.JPG" />
			</div>
			<div id="foot_left">
				<a href="#">myFarm农场官网</a> 
	   	 		<a href="#">myFarm商城</a> 
	   	 		<a href="#">服务</a> 
	   	 		<a href="#">社区</a> 
		   	 	<a href="#">问题反馈</a> 
			</div>
			<div id="foot_left_a">
				<span style="font-size: 12px; color:#9B9B9B" >myFarm版权所有-京ICP备2013090111-京公网安备2017070111-京ICP证13170907</span>
			</div>
			<div id="foot_right">
				<a href="#"><img src="resources/images/uImages/v-logo-1.png" /></a>
				<a href="#"><img src="resources/images/uImages/v-logo-2.png" /></a>
				<a href="#"><img src="resources/images/uImages/v-logo-3.png" /></a>
			</div>
		</div>
	</div>
  </body>
</html>
