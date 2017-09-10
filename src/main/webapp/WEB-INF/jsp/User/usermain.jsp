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
    
    <title>My JSP 'usermain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="resources/css/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>resources/css/style2.css" />

<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resources/css/basic/js/quick_links.js"></script>
<script type="text/javascript">
	function fun(){
	 alert("请先登录！！");
	 window.location="User/login";
	}

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
   	 				</li>
   	 				<li>
   	 					<a href="#">新鲜水果</a>
   	 				</li>
   	 				<li>
   	 					<a href="#">健康蔬菜</a>
   	 				</li>
   	 				<li>
   	 					<a href="#">农场环境</a>
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
    <div id="big_banner_wrap">
		 <ul id="banner_menu_wrap">
			 <li class="active">
				 <a href="#"><i ><img src="resources/images/uImages/bamboo.png"></i>时令水果</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 600px; top: -20px;">
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				</div>
			</li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/cookies.png"></i>健康蔬菜</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 600px; top: -62px;">
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="饼干">饼干</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
						</dl>
						<dl class="dl-sort">
							<dt>
								<span title="薯片">薯片</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">虾条</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
				</div>
			</li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/meat.png"></i>生鲜肉类</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 600px; top: -104px;">
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
					</div>
			 </li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/fish.png"></i>鱼虾水产</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 300px; top: -146px;">
					 <div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				 </div>
			 </li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/candy.png"></i>粮油副食</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 300px; top: -188px;">
					 <div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				 </div>
			 </li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/meat.png"></i>家禽蛋类</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 300px; top: -230px;">
					 <div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				 </div>
			 </li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/chocolate.png"></i>熟食素食</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 300px; top: -272px;">
					 <div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				 </div>
			 </li>
			 <li>
				 <a href="#"><i ><img src="resources/images/uImages/package.png"></i>年货专供区</a>
				 <a class="banner_menu_i">&gt;</a>
				 <div class="banner_menu_content" style="width: 600px; top: -314px;">
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span title="蛋糕">蛋糕</span>
							</dt>
							<dd>
								<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
							</dd>
							<dd>
								<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
							</dd>
							<dd>
								<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
							</dd>
							<dd>
								<a title="软面包" href="#"><span>软面包</span></a>
							</dd>
							<dd>
								<a title="马卡龙" href="#"><span>马卡龙</span></a>
							</dd>
							<dd>
								<a title="千层饼" href="#"><span>千层饼</span></a>
							</dd>
							<dd>
								<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
							</dd>
							<dd>
								<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
							</dd>
							<dd>
								<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
							</dd>
						</dl>
					</div>
					<div class="banner_menu_content_ul">
						<dl class="dl-sort">
							<dt>
								<span>实力商家</span>
							</dt>
							<dd>
								<a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">呵官方旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
									rel="nofollow"><span>格瑞旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
									rel="nofollow"><span class="red">飞彦大厂直供</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
									rel="nofollow"><span>红e·艾菲妮</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
									rel="nofollow"><span class="red">本真旗舰店</span></a>
							</dd>
							<dd>
								<a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
									rel="nofollow"><span class="red">杭派女装批发网</span></a>
							</dd>
						</dl>
					</div>
				 </div>
			 </li>
			  
		 </ul>
		 <!--<div id="big_banner_pic_wrap">
			 <ul id="big_banner_pic">
				  <li><img src="resources/images/img/T1hiDvBvVv1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1jrxjB_VT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1oTJjBKKT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1RICjB7DT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1vWdTBKDv1RXrhCrK.jpg"></li>
 		     <li><img src="resources/images/lunbo-1.jpg" ></li>
				 <li><img src="resources/images/lunbo2.jpg" ></li>
				 <li><img src="resources/images/lunbo3.jpg"  ></li>
 
 	       </ul>
		 </div>-->
		 <div id="big_banner_change_wrap">
		 	<ul id="big_banner_pic">
				 <!-- <li><img src="resources/images/img/T1hiDvBvVv1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1jrxjB_VT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1oTJjBKKT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1RICjB7DT1RXrhCrK.jpg"></li>
				 <li><img src="resources/images/img/T1vWdTBKDv1RXrhCrK.jpg"></li>
 -->		     <li><img src="resources/images/lunbo-1.jpg" ></li>
				 <li><img src="resources/images/lunbo2.jpg" ></li>
				 <li><img src="resources/images/lunbo3.jpg"  ></li>
 
 	       </ul>
		   <div id="big_banner_change_prev">&lt;</div>
		   <div id="big_banner_change_next">&gt;</div>
		 </div>
 	</div>
 	<script type="text/javascript" src="<%=basePath%>/resources/js/script.js"></script>
	<div id="big_bottom">
		<div id="bot_a">
			 <a href="#"><img src="<%=basePath%>resources/images/uImages/activity.jpg" /></a>
		</div>
		<div id="bot_b"><a href="#"><img src="<%=basePath%>resources/images/uImages/activity1.jpg" /></a></div>
		<div id="bot_c"><a href="#"><img src="resources/images/uImages/activity2.jpg" /></a></div>
		<div id="bot_d"><a href="#"><img src="resources/images/uImages/activity3.jpg" /></a></div>
	</div>
	<div id="big_bottom_center">
		<ul>
			<li><p style="font-size: 20px;font-weight:900;">热卖产品</p></li>
		</ul>
		<div id="bot_cen_a">
			<ul>
				<li id="bot_cen_li_a"><a href="Product/productMain?pid=27"><img src="resources/images/uImages/orange.jpg" /></a></li>
				<li id="bot_cen_li_b"><a href="Product/productMain?pid=27">橙子</a></li>
				<li id="bot_cen_li_c">新鲜绿色</li>
				<li id="bot_cen_li_d">12元</li>
			</ul>
		</div>
		<div id="bot_cen_b">
			<ul>
				<li id="bot_cen_li_a"><a href="Product/productMain?pid=28"><img src="resources/images/uImages/yintao.jpg" /></a></li>
				<li id="bot_cen_li_b"><a href="Product/productMain?pid=28">樱桃</a></li>
				<li id="bot_cen_li_c">新鲜绿色</li>
				<li id="bot_cen_li_d">17元</li>
			</ul>
		</div>
		<div id="bot_cen_c">
			<ul>
				<li id="bot_cen_li_a"><a href="Product/productMain?pid=29"><img src="resources/images/uImages/xiangjiao.jpg" /></a></li>
				<li id="bot_cen_li_b"><a href="Product/productMain?pid=29">香蕉</a></li>
				<li id="bot_cen_li_c">新鲜绿色</li>
				<li id="bot_cen_li_d">12元起</li>
			</ul>
		</div>
		<div id="bot_cen_d">
			<ul>
				<li id="bot_cen_li_a"><a href="Product/productMain?pid=30"><img src="resources/images/uImages/xigua.jpg" /></a></li>
				<li id="bot_cen_li_b"><a href="Product/productMain?pid=30">西瓜</a></li>
				<li id="bot_cen_li_c">新鲜绿色</li>
				<li id="bot_cen_li_d">12元起<br></li>
			</ul>
		</div>
		<div id="bot_cen_e"><ul>
				<li id="bot_cen_li_a"><a href="Product/productMain?pid=31"><img src="resources/images/uImages/2.jpg" /></a></li>
				<li id="bot_cen_li_b"><a href="Product/productMain?pid=31">芒果</a></li>
				<li id="bot_cen_li_c">新鲜绿色</li>
				<li id="bot_cen_li_d">12元起</li>
			</ul>
		</div>
	</div>
	<div id="bottom">
	  <div> 
		<div id="small_bottom">
			<div id="sm_bot">
				<ul>
					<li><p style="font-size: 20px;font-weight:900;">果蔬</p></li>
				</ul>
			</div>
			<div id="sm_bo">
				<div id="sm_bo_a">
					<a href="#"><img src="resources/images/uImages/act1.png" /></a>
				</div>
				<div id="sm_bo_b">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/qingcai.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">青菜</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">10元起</li>
					</ul>
				</div>
				<div id="sm_bo_c">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/apple.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">苹果</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">10元起</li>
					</ul>
				</div>
				<div id="sm_bo_d">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/qiezi.jpg" width="160px;" /></a></li>
						<li id="bo_li_b"><a href="#">茄子</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">10元起</li>
					</ul>
				</div>
				<div id="sm_bo_e">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/xigua.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">西瓜</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="sm_bo_f">
					<a href="#"><img src="resources/images/uImages/row3.jpg" /></a>
				</div>
				<div id="sm_bo_h">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/orange.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">西红柿</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="sm_bo_i">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/orange.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">西红柿</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="sm_bo_j">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/orange.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">西红柿</a></li>
						<li id="bo_li_c">新鲜绿色</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="sm_bo_k">
					<ul>
						<li id="sbo_li_a"><a href="#">西红柿</a></li>
						<li id="sbo_li_b">12.5</li>
					</ul>
					<div id="sm_bo_p">
						<a href="#"><img src="resources/images/uImages/xihongshi.jpg" /></a>
					</div>
				</div>
				<div id="sm_bo_l">
					<ul>
						<li><a href="#">浏览更多</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="na_bottom">
			<div id="na_bot">
				<p style="font-size: 20px;font-weight:900;">今日热卖</p>
			</div>
			<div id="na_bo">
				<div id="na_bo_a">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/juanxincai.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">卷心菜</a></li>
						<li id="bo_li_c">绿色新鲜</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="na_bo_b">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/hetao.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">核桃</a></li>
						<li id="bo_li_c">绿色新鲜</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="na_bo_c">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/mugua.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">木瓜</a></li>
						<li id="bo_li_c">绿色新鲜</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="na_bo_d">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/orange.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">水果</a></li>
						<li id="bo_li_c">绿色新鲜</li>
						<li id="bo_li_d">12元起</li>
					</ul>
				</div>
				<div id="na_bo_e">
					<ul>
						<li id="bo_li_a"><a href="#"><img src="resources/images/uImages/haidai.jpg" /></a></li>
						<li id="bo_li_b"><a href="#">海带</a></li>
						<li id="bo_li_c">绿色新鲜</li>
						<li id="bo_li_d">12元起</li>
					</ul>
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
	<div id="last" style="margin-top: 380px;left: -100px;">
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
		</div>
	</div>
	</div>
	
	
	
</body>
</html>