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
    
    <title>My JSP 'tan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
	<style type="text/css">
		body li, a{
		text-decoration: none;
		list-style-type: none;
		}
	.center_1{
		width: 120px;
		height: 120px;
		background-color: #FFFFFF;
		position: absolute;
		top:50px;
		left:80px;
	}
	div.center_1 img{
		width: 120px;
		height: 120px;
	}
	.center_2{
		width: 180px;
		height: 120px;
		background-color: #FFFFFF;
		position: absolute;
		top:80px;
		left:200px;
	}
	.center_3{
		width: 300px;
		height: 120px;
		background-color: #FFFFFF;
		position: absolute;
		top:80px;
		right:200px;
	}
	.center_4{
		width: 850px;
		height: 10px;
		background-color: #FFFFFF;
		position: absolute;
		top:220px;
		right:70px;
	}
	.center_5{
		width: 100px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:280px;
		left:70px;
	}
	.center_6{
		width: 150px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:280px;
		left:170px;
	}
	.center_7{
		width: 100px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:280px;
		right:300px;
	}
	.center_8{
		width: 150px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:280px;
		right:150px;
	}
	.center_9{
		width: 100px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:450px;
		left:70px;
	}
	.center_10{
		width: 150px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:450px;
		left:170px;
	}
	.center_11{
		width: 100px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:450px;
		right:300px;
	}
	.center_12{
		width: 150px;
		height: 100px;
		background-color: #FFFFFF;
		position: absolute;
		top:450px;
		right:150px;
	}
	</style>
	
	<script type="text/javascript">
	
	</script>
  </head>
  
  <body>
<div class="center_1">
    			<img src="resources/images/uImages/${user.upicFilename }"  />
    		</div>
    		<div class="center_2"> 
    			<h2 class="username">
    			     ${user.name }
    			</h2>
    			<p class="tip">早上好~</p>
    			<a href="User/${user.account }/userhome" target="manage"  style="font-size: small">修改个人信息 &gt;</a>
    		</div>
    		<div class="center_3">
    		           <ul class="u-list">
	    		           <li>账户安全：<span></span></li>
	    		            <li>账户资产：<span>${user.umoney }</span></li>
	    		            <li>绑定手机：<span>${user.phone }</span></li>
	                         <li>绑定邮箱：<span>${user.email }</span></li>
	                    </ul>
             </div>
    		<div class="center_4"><hr width="850px"/></div>
    		<div class="center_5">
    			<img src="resources/images/uImages//p1.png"  />
    		</div>
    		<div class="center_6">
    		           <h3>待支付订单：<span></span></h3> 
    		          <a href="Order/checkorder?account=${user.account }" style="font-size: small" >查看待支付订单&gt;</a>
    		 </div>
    		<div class="center_7">
    			<img src="resources/images/uImages//p2.png"  />
    		</div>
    		<div class="center_8">
    		              <h3>待收货订单：<span></span></h3>
    		              <a href="#" style="font-size: small">查看收货订单&gt;</a>
    		 </div>
    		<div class="center_9">
    			<img src="resources/images/uImages//p3.png"  />
    		</div>
    		<div class="center_10">
    		          <h3>待评价商品数：<span></span></h3>
    		              <a href="#" style="font-size:small">查看待评价商品&gt;</a>
    		</div>
    		<div class="center_11">
    			<img src="resources/images/uImages//p4.png"  />
    		</div>
    		<div class="center_12">
    		        <h3>喜欢的商品：<span></span></h3>
    		              <a href="?userName=${user.account }" style="font-size: small">查看喜欢的商品&gt;</a>
    		</div>
    		
   </body>