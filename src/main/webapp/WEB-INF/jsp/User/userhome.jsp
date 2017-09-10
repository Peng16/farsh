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
	body {
		font-family:Arial, Helvetica, sans-serif;
		font-size:12px;
		margin:0;
		width:100%;
		height:100%;
	}
	#main {
		text-align:center;
		background-color: #F9F9F9;
	}
	#fullbg {
		background-color:gray;
		left:0;
		opacity:0.5;
		position:absolute;
		top:0;
		z-index:3;
		filter:alpha(opacity=50);
		-moz-opacity:0.5;
		-khtml-opacity:0.5;
	}
	#dialog {
		background-color:#fff;
		border:5px solid rgba(0,0,0, 0.4);
		height:400px;
		left:50%;
		margin:-200px 0 0 -200px;
		padding:1px;
		position:fixed !important; /* 浮动对话框 */
		position:absolute;
		top:50%;
		width:400px;
		z-index:5;
		border-radius:5px;
		display:none;
	}
	#dialog p {
		margin:0 0 12px;
		height:24px;
		line-height:24px;
		background:#CCCCCC;
	}
	#dialog p.close {
		text-align:right;
		padding-right:10px;
	}
	#dialog p.close a {
		color:#fff;
		text-decoration:none;
	} 
	
	
	#eialog {
		background-color:#fff;
		border:5px solid rgba(0,0,0, 0.4);
		height:400px;
		left:50%;
		margin:-200px 0 0 -200px;
		padding:1px;
		position:fixed !important; /* 浮动对话框 */
		position:absolute;
		top:50%;
		width:400px;
		z-index:5;
		border-radius:5px;
		display:none;
	}
	#eialog p {
		margin:0 0 12px;
		height:24px;
		line-height:24px;
		background:#CCCCCC;
	}
	#eialog p.close {
		text-align:right;
		padding-right:10px;
	}
	#eialog p.close a {
		color:#fff;
		text-decoration:none;
	} 
#us-a{
		width: 112px;
		height: 31px;
		position: absolute;
		float:left;
		left:130px;
		top:55px;
	}
#us-b{
		width: 31px;
		height: 31px;
		position: absolute;
		right:130px;
		top:55px;
	}
#us-c{
	width: 1000px;
	height: 531px;
	background-color: #FFFFFF;
	position: absolute;
}
#us-d{
	width: 100px;
	height: 100px;
	position: absolute;
	top: 250px;
	left: 200px;
}
div#us-d img{
	width: 100px;
	height: 100px;
}
#us-e{
	width: 100px;
	height: 50px;
	position: absolute;
	top:350px;
	left: 200px;
}
#us-f{
	width: 500px;
	height: 345px;
	position: absolute;
	left:350px;
	top:150px;
}
</style>
	<script type="text/javascript">
//显示灰色 jQuery 遮罩层
function showBg() {
var bh = $("body").height();
var bw = $("body").width();
$("#fullbg").css({
height:bh,
width:bw,
display:"block"
});
$("#dialog").show();
}
//关闭灰色 jQuery 遮罩
function closeBg() {
$("#fullbg,#dialog").hide();
}

function showEg() {
var bh = $("body").height();
var bw = $("body").width();
$("#fullbg").css({
height:bh,
width:bw,
display:"block"
});
$("#eialog").show();
}
//关闭灰色 jQuery 遮罩
function closeEg() {
$("#fullbg,#eialog").hide();
}


</script>

  </head>
  
  <body>
    <div id="main">
			<div id="us-c">
				<div id="us-a">
					<a href="User/main.jsp"> </a>
				</div>
				<div id="us-b">
					<a href="User/ucenter" style="text-decoration: none;">返回</a>
				</div>
				<div id="us-d" ><img src="resources/images/uImages/${user.upicFilename}" /></div>
				<div id="us-e"><a href="javascript:showEg();" style="text-decoration: none;">设置头像</a></div>
				<div id="us-f">
					<table>
	  					<tr>
	  						<td width="100px" height="40px" align="center"><h3>基础资料</h3></td>
	  						<td width="450px" height="40px"></td>
	  						<td width="65px" height="40px" align="left"><a href="javascript:showBg();" style="text-decoration: none;">编辑 </a></td>
	  					</tr>
	  					<tr>
	  						<td width="100px" height="40px" align="center">姓名：</td>
	  						<td width="450px" height="40px">${user.name }</td>
	  					</tr>
	  					<tr>
	  						<td width="100px" height="40px" align="center">生日：</td>
	  						<td width="450px" height="40px"><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" type="both" dateStyle="long" timeStyle="long"/></td>
	  					</tr>
	  					<tr>
	  						<td width="100px" height="40px" align="center">性别：</td>
	  						<td width="450px" height="40px">${user.sex }</td>
	  					</tr>
	  					<tr>
	  						<td width="100px" height="40px" align="center">手机：</td>
	  						<td width="450px" height="40px">${user.phone }</td>
	  					</tr>
	  					<tr>
	  						<td width="100px" height="40px" align="center">邮箱：</td>
	  						<td width="450px" height="40px">${user.email }</td>
	  					</tr>
	  				</table>
				
				</div>
			</div>
				<div id="eialog">
					<p class="close"><a href="javascript:closeEg();" >关闭</a></p>
					<div align="center">
						<form action="User/uploadPic?account=${user.account}" method="post" enctype="multipart/form-data">
						    文件：<input type="file" name="pic" /><br />
						      <input type="submit" value="提交" />
    					</form>
					</div>
				</div>
				<div id="dialog">
					<p class="close"><a href="javascript:closeBg();" >关闭</a></p>
				<div>
					<form action="User/modifyUser?account=${user.account }" method="post" enctype="multipart/form-data"> 
  			              <table>
  					<tr>
  						<td width="200px" height="40px" align="center"><h3>基础资料</h3></td>
  						<td width="450px" height="40px"></td>
  					</tr>
  					<tr>
  						<td width="100px" height="40px" align="center">姓名：</td>
  						<td width="450px" height="40px"><input type="text" name="name" value="${user.name }"/></td>
  					</tr>
  					<tr>
  						<td width="100px" height="40px" align="center">生日：</td>
  						<td width="450px" >
	  						<input type="text" id="select_date" class="select_date" name="birthday" value="<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" type="both" dateStyle="long" timeStyle="long"/>"/>
			                <div id="cc" style="width:180px;height:180px; display: none;"></div>
                          </td>
  					</tr>
  					<tr>
  						<td width="100px" height="40px" align="center">性别：</td>
  						<td width="450px" height="40px"><input type="text" name="sex" value="${user.sex }"/></td>
  					</tr>
  					<tr>
  						<td width="100px" height="40px" align="center">手机：</td>
  						<td width="450px" height="40px"><input type="text" name="phone" value="${user.phone }"/></td>
  					</tr>
  					<tr>
  						<td width="100px" height="40px" align="center">邮箱：</td>
  						<td width="450px" height="40px"><input type="text" name="email" value="${user.email }"/></td>
  					</tr>
  					<tr><td></td><td></td></tr>
  					<tr>
  						<td width="100px" height="40px"></td>
	  					<td  align="right">
	  					       <input type="submit" value="提交"/>
	  					</td>
  					</tr>
  				</table>
  				</form>
				</div>
		</div>
	</div> 
  </body>
</html>
