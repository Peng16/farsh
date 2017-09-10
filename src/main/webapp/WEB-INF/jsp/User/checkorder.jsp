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
    
    <title>My JSP 'usercar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="resources/css/basic/js/quick_links.js"></script>
		<link rel="stylesheet" href="<%=basePath%>resources/css/style2.css" />
		<link rel="stylesheet" href="<%=basePath %>resources/css/orderstyle.css" />
		<link href="resources/css/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		
		</script>
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
   	 					<a href="showproduct.action?userName=${user.account }">生鲜肉类</a>
   	 				</li>
   	 				<li>
   	 					<a href="showproduct.action?userName=${sessionScope.account }">健康蔬菜</a>
   	 				</li>
   	 				<li>
   	 					<a href="showproduct.action?userName=${sessionScope.account }">农场环境</a>
   	 				</li>
   	 				<li><a href="">服务</a></li>
   	 				 
   	 			</ul>
 		</div>
 		<div class="searchBar sc">
 			<form action="" method="post"style="height: 40px">
				<input name="" type="text" id="searchText" />
				<input name="" type="submit" id="toSearch" class="submit ts-btn" value="搜索"/>
			</form>
 		</div>
 	</div>
 	
		<!--中间部分-->
		<div id="bd">
			<div class="pg-pay body">
				<h2 class="order_title">订单信息</h2>
				<c:if test="${empty recordlist}">
					<a href="Scart/${user.account}/listscart">
						<img src="resources/images/unpayrecordnull.png" width="918px"/>
					</a>
					
				</c:if>
				<c:if test="${!empty recordlist}">
				<p class="desc">-
					请认真核对订单信息，订单提交后
					<i>无法修改该订单信息</i>
				</p>
				<table class="details">
					<tbody>
						<tr>
							<th>
								商品
							</th>
							<th>
								单价
							</th>
							<th>
								数量
							</th>
							<th>
								小计
							</th>
						</tr>
						<c:forEach items="${recordlist}" var="record" varStatus="status">
						<tr>
							<td width="30%">
								<img src="resources/images/uImages/xiangjiao.jpg" width="50px" height="50px" style="float: left;"/>
								<strong>香蕉</strong>
							</td>
							<td width="25%">
								${record.rprice }
							</td>
							<td width="20%">
								${record.pNum }
							</td>
							<td width="25%">
								${record.pSumprice }
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${!empty Osumprice}">
				<p class="total">
					应付总额：
					<strong>¥ ${Osumprice}</strong>
				</p>
				</c:if>
				<div style="margin-bottom: 20px;">
					<h2 class="order_title">收货人信息</h2>
					<div class="consigneeinfo">
						<div class="user_msg">
						<c:if test="${!empty address}">
							<div class="address_list">
								<div class="address_box active">
									<div class="top">
										<span class="name">${address.aName}</span>
										<span class="phone">${address.aPhone}</span>
									</div>
									<div class="bottom">${address.aProvince}${address.aCity}${address.aDetailed}</div>
								</div>
							</div>
						</c:if>	
						<c:choose>
						<c:when test="${!empty address}">
						<div class="user_address">
								<div class="add_address">
									<div class="add_icon">+</div>
									<a href="User/${user.account}/usercenter">
										<span class="str">修改默认地址</span>
									</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						<div class="user_address">
								<div class="add_address">
									<div class="add_icon">+</div>
									<a href="User/${user.account}/usercenter">
										<span class="str">添加新地址</span>
									</a>
								</div>
							</div>
						</c:otherwise>
						</c:choose>
							
						</div>
					</div>
				</div>
				  	<div class="pay-list">
				  		<h1>网上银行支付</h1>
				  		<input name="payType" id="PayTypezhye" type="radio" value="1">
				  		 <label for="PayTypezhye" ><span>用账户余额支付</span></label>
				  	</div>
				  	
					<div class="pay-handle">
						<p class="pay-amount">
							支付：
							<em >¥${Osumprice}</em>
							<input type="hidden" name="allprice" value="${Osumprice}"/>
							
						</p>
						<p>
						    
						    <input name="submit" value="取消，返回购物车" class="btn btn-hot"
								gaevent="pay/submit" type="button" onclick="window.location.href='Order/cancelOrderUnpay?account=${user.account}'">
							<input name="submit" value="确认订单，付款" class="btn btn-hot"
								gaevent="pay/submit" type="button" onclick="window.location.href='Order/payOrder?account=${user.account}'">
							<a href="" target="_blank" id="J_submit"></a>
						</p>
						<p class="remind-pay">
							<i></i>订单提交成功后，无法修改
							<strong>请仔细核查</strong>
						</p>
					</div>
				</c:if>
			</div>
		</div>
	 
	 	<!--菜单 -->
				<c:choose>
					<c:when test="${user.account == null}">
						<div class=tip>
							<div id="sidebar">
								<div id="wrap">
									<div id="prof" class="item">
										<a href="#"> <span class="setting"></span>
										</a>
										<div class="ibar_login_box status_login">
											<div class="avatar_box">
												<p class="avatar_imgbox">
													<img src="resources/css/basic/images/no-img_mid_.jpg" />
												</p>
												<ul class="user_info">
													<li>用户未登录</li>
													<li>游客身份</li>
												</ul>
											</div>
											<div class="login_btnbox">
												<a href="#" class="login_order">我的订单</a> <a href="#"
													class="login_favorite">我的收藏</a>
											</div>
											<i class="icon_arrow_white"></i>
										</div>
									</div>
									<div id="shopCart" class="item">
										<a href="#"> <span class="message"></span>
										</a>
										<p>购物车</p>
										<p class="cart_num">0</p>
									</div>
									<div class="quick_toggle">
										<ul>
											<li class="qtitem"><a href="/#top" class="return_top"><span
													class="top"></span></a></li>
										</ul>
									</div>
									<!--回到顶部 -->
									<div id="quick_links_pop" class="quick_links_pop hide"></div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class=tip>
							<div id="sidebar">
								<div id="wrap">
									<div id="prof" class="item">
										<a href="#"> <span class="setting"></span>
										</a>
										<div class="ibar_login_box status_login">
											<div class="avatar_box">
												<p class="avatar_imgbox">
													<img src="resources/css/basic/images/no-img_mid_.jpg" />
												</p>
												<ul class="user_info">
													<li>用户名：${user.name }</li>
													<li>级&nbsp;别：${user.uauthority }${user.uType }</li>
												</ul>
											</div>
											<div class="login_btnbox">
												<a href="#" class="login_order">我的订单</a> <a href="#"
													class="login_favorite">我的收藏</a>
											</div>
											<i class="icon_arrow_white"></i>
										</div>
									</div>
									<div id="shopCart" class="item">
										<a href="#"> <span class="message"></span>
										</a>
										<p>购物车</p>
										<p class="cart_num">${samount }</p>
									</div>
									<!--回到顶部 -->
									<div id="quick_links_pop" class="quick_links_pop hide"></div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
	 
		<!-- 页面尾部 -->
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
