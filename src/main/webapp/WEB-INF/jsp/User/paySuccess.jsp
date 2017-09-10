<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopCar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/css/shopCar.css" />
	<link rel="stylesheet" href="<%=basePath%>resources/css/style2.css" />
	<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/shopCar.js"></script>
	
	<style type="text/css">
	.pay-success{
	    background: url(resources/images/greenRight.png) no-repeat scroll 10px 30px transparent;
		margin: 60px auto;
        width: 992px;
        min-height: 360px;
		background: #FFF none repeat scroll 0% 0%;
		border: 1px solid #DDD;	
	}
	.successInfo {
    display: inline-block;
    margin-left: -46px;
    padding: 5px 0px;
    max-width: 547px;
}
@charset "utf-8";
/* CSS Document */
h2, #success-pay h2 {font-size: 14px;height: 40px;line-height: 40px;margin-top:0px;}
.successInfo {display: inline-block;margin-left: -46px;padding:5px 0px;max-width: 547px;}
.successInfo em{color:#f00; font-weight:700; margin-left:5px;}
.take-delivery li {line-height: 28px;height:28px;}

.status .option { margin: 13px 0 25px 0px;}
.status .option .info {margin-right: 10px;}

.successInfo a span{font-size: 13px; margin: 0 10px 0 10px;color: #f00;}
.take-delivery {background: url(../images/T13iv.XiFdXXa94Hfd-32-32.png) no-repeat scroll 10px 30px transparent;padding: 27px 0 27px 60px;color: #333;
width:100% ;max-width:1000px;margin:0px auto;margin-top: 50px;}

.successInfo li{font-size:18px;}
.footer{max-width:1000px; margin:0px auto; margin-top:10px;}
.user-info p{ font-size:14px; padding:3px 0px;margin:0px 0px ;}

 @media only screen and (min-width:640px) 
{
.take-delivery{background: url(../images/T13iv.XiFdXXa94Hfd-32-32.png) no-repeat scroll 30px 30px transparent;padding: 27px 0 27px 76px;border: 1px solid #e5e5e5;margin-top: 10px;border: none;}
.user-info{border:1px solid #F00}
.successInfo {padding: 0 65px 0 56px;}
.user-info p{ font-size:14px; padding:10px;}

}
	</style>
	<script type="text/javascript">
	 
	</script>
  </head>
  <body style="width: 100%;min-height:500px">
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
								<li style="line-height: 40px;text-align:center; "><a href="Scart/${user.account}/listscart">购物车（0）</a></li>
							</ul>
   	 			  </c:otherwise>
			</c:choose>
		
		<div id="small_head">
	   	 		<c:choose>
   	 			      <c:when test="${user.account == null}">
   	 			      		<a href="User/login" >登录</a>|<a href="User/userregister">注册</a>
   	 			      </c:when>
   	 			      <c:otherwise>
   	 			              <a href="User/${user.account}/usercenter"id="uAccount">${user.account }</a>|
   	 			              <a href="User/Exit">退出</a>
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
 			<form action="Product/searchPro" method="post" style="height: 40px" enctype="multipart/form-data">
				<input name="searchText" type="text" id="searchText" />
				<input type="submit" id="toSearch" class="submit ts-btn" value="搜索"/>
			</form>
 		</div>
 	</div>
	<div class="pay-success">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>¥ ${osumprice }</em></li>
					<div class="user-info">
						<p>收货人：${address.aName }</p>
						<p>联系电话：${address.aPhone}</p>
						<p>收货地址：${address.aProvince}${address.aCity}${address.aDetailed}</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
				<div class="option">
					<span class="info">您可以</span> <a href="../person/order.html"
						class="J_MakePoint">查看<span>已买到的宝贝</span></a> <a
						href="#" class="J_MakePoint">查看<span>交易详情</span></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面尾部 -->
		<script type="text/javascript" src="<%=basePath%>/resources/js/script.js"></script>
  		<div id="last" >
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
				<a href="#"><img src="resources/images/user_image/v-logo-1.png" /></a>
				<a href="#"><img src="resources/images/user_image/v-logo-2.png" /></a>
				<a href="#"><img src="resources/images/user_image/v-logo-3.png" /></a>
			</div>
		</div>
	</div>
  	
  </body>
</html>
