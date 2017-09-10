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
    
    <title>My JSP 'lsit_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
 table{
    border-collapse:collapse;
  }
 td{
    text-align:center
  }
 a{ 
 text-decoration:none;
 }
 a:hover{ 
    text-decoration:underline;
  }
  </style>
 </head>
  
  
  <body bgcolor="#FFFFCC">
     
   
      <table border="1" width="1000" align="center">
    	<tr>
    	    <th>序号</th>
    	    <th>帐号</th>
    		<th>密码</th>
    		<th>姓名</th>
    		<th>性别</th>
    		<th>用户编号</th>
    		<th>生日</th>
    		<th>电话</th>
    		<th>邮箱</th>
    		<th>图片</th>
    		<th>钱包</th>
    		<th>操作</th>
    		
    	</tr>
    	
	    <c:forEach items="${userlist}" var="user" varStatus="statu">
	    	<tr>
	    	    <td>&nbsp;&nbsp;${statu.count}</td>
	    		<td>${user.account}</td>
	    		<td>${user.pwd}</td>
	    		<td>${user.name}</td>
	    		<td>${user.sex}</td>
	    		<td>${user.uid}</td>
	    		<td>${user.birthday}</td>
	    		<td>${user.phone}</td>
	    		<td>${user.email}</td>
	    		<td>${user.upicFilename }</td>
	    		<td>${user.umoney}</td>
	    	    
	    		<td>
		    		<a href="User/${user.uid}/detail">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    	
	    		</td>
	    	</tr>  
	    </c:forEach>
	   
    </table>
    
    <form method="post" action="User/doUpload" enctype="multipart/form-data">
    	<input type="file" name="file"/>
    	<input type="submit"/>
    </form>
  </body>
</html>
