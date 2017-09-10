<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'begin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
p{
  font-size: 18px;
}
#d1{
  border: 1px;
}
</style>
  </head>
  
  <body>
     <p align="center">欢迎登录</p>
     <p></p>
     <div align="right" id="d1" >
         <p>后台管理主要对产品及用户进行基本操作，如增加产品，删除产品，修改产品，查看所有产品，对用户进行增删改查等操作，还有信箱管理等。。。</p>
     </div>
     
  </body>
</html>
