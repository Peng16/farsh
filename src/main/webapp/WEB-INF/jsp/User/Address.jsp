<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>地址管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="resources/css/address.css" type="text/css"></link>
  <link rel="stylesheet" href="resources/css/hzw-city-picker.css" type="text/css"></link>
  <script type="text/javascript" src="resources/js/city-data.js"></script>
  <script type="text/javascript" src="resources/js/hzw-city-picker.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
  
  <style type="text/css">
  	.saveis{
		width: 70px;
		height: 26px;
		background: #00c3f5;
		color: #fff;
		text-align: center;
		line-height: 26px;
		border-radius: 4px;
		text-decoration: none;
		font-size: 14px;
		font-family: "微软雅黑", "Microsoft Yahei", Arial, Helvetica, sans-serif,
			"宋体";
		cursor: pointer;
		display: block;
		float: left;
		margin-top: 8px;
		margin-left:10px;
	}
  </style>
  <script type="text/javascript">
  	function checkAddress(){
  		var addresslength = document.getElementById("addresslength").innerHTML;
  		var name = document.getElementById("name").value;
  		var phone = document.getElementById("phone").value;
  		var province = document.getElementById("province").value;
  		var city = document.getElementById("city").value;
  		var detailed = document.getElementById("detailed").value;
  		var reg = /^1[3|5|7|8]\d{9}$/g;
  		if(addresslength == 3){
  			alert("對不起，您最多只能添加3個地址信息！");
  			return false;
  		}else if(name==""||phone==""||province==""||city==""||detailed==""){
  			alert("标星号的不能为空！");
  			return false;
  		}else if(7 <  Number(name.length)){
  			alert("姓名不能超过7个字！");
  			return false;
  		}else if(!reg.test(phone)){
  			alert("手机号不存在！");
  			return false;
  		}else{
  			return true;
  		}    
  	}
  
  </script>
  </head>
  
  
<body>
	<div class="main" >
		<div>
			<a class="text_head"><b>地址管理</b></a>
		</div>
		<div class="row">
			<span class="title_a">新增收货地址</span>
		</div>
		<div class="from">
			<form action="Address/${user.account}/saveAddress" method="post" onsubmit="return checkAddress();" enctype="multipart/form-data">
				<div style="float:left">
					<span class="text_head">收货人姓名<i class="mark">*</i></span><input name="aName" id="name" class="varify" type="text" placeholder="长度不超过7个字" />
				</div>
				<div >
					<span class="text_head">收货人手机号<i class="mark">*</i></span><input name="aPhone" id="phone" class="varify" type="text" placeholder="请输入11位手机号" />
				</div>
				<div style="float:left">
					<span class="text_head">收货人地址省份<i class="mark">*</i></span><input name="aProvince" id="province" class="varify" type="text" />
				</div>
				<div >
					<span class="text_head">市区<i class="mark">*</i></span><input name="aCity" id="city" class="varify" type="text" />
				</div>
				<div >
					<span class="text_head">详细地址<i class="mark">*</i></span><input name="aDetailed" id="detailed" class="varify_a" type="text" maxlength="50" placeholder="输入不超过50个字符的详细地址，例如：路名，门牌号" />
				</div>
				<div class="div_save">
					<input type="submit" value="保存" class="save" />
				</div>
			</form>
		</div>
		<div class="list">
			<div class="row" style="margin-top:110px;">
				<span class="title_a">已有地址</span>
			</div>
			<div class="list_head">
				<span class="w1" style="width:20%;"><b>收货人姓名</b></span> 
				<span class="w1" style="width:25%;"><b>收货人地址</b></span> 
				<span class="w1" style="width:25%;"><b>收货人手机号</b></span> 
				<span class="w1" style="width:20%;"><b>操作</b></span>
				<span style="visibility: hidden;" id="addresslength">${fn:length(addresslist) }</span>
				<c:forEach items="${addresslist}" var="address">
					<span class="w1" style="width: 25%;">${address.aName}</span>
					<span class="w1" style="width: 25%;">${address.aProvince}${address.aCity}${address.aDetailed}</span>
					<span class="w1" style="width: 25%;">${address.aPhone}</span>
					<c:choose>
						<c:when test="${address.aDefult == '1' }">
							<span class="w1" style="width: 20%;"> 
							<a class="saveis" onclick="return confirm('确认删除吗?')" href="Address/${user.account}/deleteAddress/${address.aId}/${address.aDefult}">删除</a> 
							<a href="javascript:return false;" class="saveis" >默认</a>
							</span>
						</c:when>
						<c:otherwise>
							<span class="w1" style="width: 20%;"> 
							<a class="saveis" onclick="return confirm('确认删除吗?')" href="Address/${user.account}/deleteAddress/${address.aId}/${address.aDefult}">删除</a> 
							<a href="Address/${user.account}/setDefult/${address.aId}" class="saveis" style="width:100px">设为默认</a>
							</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
    
    
 </script>
</body>
</html>
