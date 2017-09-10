<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
<h2>Hello list!</h2>
<form action="">
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
		    		<a href="User/${user.uid}/detail" onclick="return confirm('确定要删除')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    	
	    		</td>
	    	</tr>  
	    </c:forEach>
	   
    </table>
    </form>
    
    <form method="post" action="/doUpload" enctype="multipart/form-data">
    	<input type="file" name="file"/>
    	<input type="submit"/>
    </form>
</body>
</html>