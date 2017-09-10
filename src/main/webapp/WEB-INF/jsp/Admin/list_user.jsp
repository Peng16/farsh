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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/tablestyle.css">
   <script type="text/javascript" src="<%=basePath%>/resources/js/jquery-1.9.1.js"></script>
<style type="text/css">
 .newAdmin{
	width:400px;
	height:300px;
	background:#FFF;
	position:absolute;
	top:-50%;
	left:50%;
	margin: -200px 0 0 -200px;
}
.newAdmin h1{
	height:50px;
	font-size:20px;
	background:#143;
	text-align:center;
	line-height:60px;
}
.newAdmin .alert_con{
	background:#fff;
	height:180px;
	align:center;
}
.newAdmin .alert_con div{
	color:#000;
	line-height:50px;
	width: 300px;
	margin-left: 100px;
}
.newAdmin .alert_con div input[type=text]{
	color:#000;
	line-height:50px;
	width: 150px;
	height:30px;
}
.newAdmin .alert_con .bot{
	 margin-left: 150px;
} 
 .changeAdmin{
	width:400px;
	height:200px;
	background:#FFF;
	position:absolute;
	top:-50%;
	left:50%;
	margin: -200px 0 0 -200px;
}
.changeAdmin h1{
	height:50px;
	font-size:20px;
	background:#143;
	text-align:center;
	line-height:60px;
}
.changeAdmin .alert_con{
	background:#fff;
	height:80px;
	align:center;
}
.changeAdmin .alert_con div{
	color:#000;
	line-height:50px;
	width: 300px;
	margin-left: 100px;
}
.changeAdmin .alert_con div input[type=text]{
	color:#000;
	line-height:50px;
	width: 150px;
	height:30px;
}
.changeAdmin .alert_con .bot{
	 margin-left: 150px;
} 
  </style>
   <script type="text/javascript">
	$(function() {
		
		$("#delete").click(
				function(){
					var uid = $("input[name='check']:checked").val();
					if (uid == null) {
						alert("至少选择一条数据");
						return false;
					}
					if (confirm('确定要删除吗?')) {
						window.location.href = "User/deleteUser?uid="+uid+"";
						return true;
					}
					return false;
				});

		$("#all").click(function() {
			if (this.checked) {
				$("input[name='check']").each(function(){this.checked=true;}); 
			} else {
				$("input[name='check']").each(function(){this.checked=false;}); 	
			}
		});
		
		$("#newAdmin").click(function(){
			is_show();
			$("#clickcancel").click(function(){
				is_hide();
				return false;
			});
		});
		
		$("#updatepower").click(function(){
			is_chshow();
			$("#clickcancel1").click(function(){
				is_chhide();
				return false;
			});
		});
	});
	
	function is_hide(){ $(".newAdmin").animate({"top":"-40%"}, 300); }
	function is_show(){ $(".newAdmin").show().animate({"top":"45%"}, 300); }

	function is_chhide(){ $(".changeAdmin").animate({"top":"-40%"}, 300); }
	function is_chshow(){ $(".changeAdmin").show().animate({"top":"45%"}, 300); }
</script>
 </head>
  
  
  <body bgcolor="#FFF">
        <!-- 悬浮层，添加管理员开始 -->
              <div class="newAdmin" style="display:none">
			          <h1>新建管理员</h1>
			      <div class="alert_con">
			      <form action="User/addadmain" method="post" enctype="multipart/form-data" >
			         <div>管理员账号:<input type="text" name="account"></div>
			         <div>管理员密码:<input type="text" name="pwd"></div> 
			         <div>管理员职称:
				         <select name="uauthority">
		    		        <option value="一级管理员">一级管理员</option>
		    		        <option value="二级管理员">二级管理员</option>
		    		        <option value="三级管理员">三级管理员</option>
		    			</select> 
	    			 </div>
	    			 <div class="bot">  
			                <input type="submit" value="提交">
			                <input type="button" id="clickcancel" value="取消"> 
			         </div>
			      </form>
			      </div>  
		      </div>
		      <!-- 悬浮层，添加管理员结束 -->
		      
		      <!-- 悬浮层，升级权限 -->
              <div class="changeAdmin" style="display:none">
			          <h1>升级权限</h1>
			      <div class="alert_con">
			      <form action="User/addadmain" method="post" enctype="multipart/form-data" >
			         <div>管理员职称:
				         <select name="uauthority">
		    		        <option value="一级管理员">一级管理员</option>
		    		        <option value="二级管理员">二级管理员</option>
		    		        <option value="三级管理员">三级管理员</option>
		    			</select> 
	    			 </div>
	    			 <div class="bot">  
			                <input type="submit" value="提交">
			                <input type="button" id="clickcancel1" value="取消"> 
			         </div>
			      </form>
			      </div>  
		      </div>
		      <!-- 悬浮层，添加管理员结束 -->
     	<center>
  	<h2 style="font-size: 25px; margin-top: 40px; color: #5C5956;">
				用户信息
			</h2>
			<hr color="#5C5956" width="80%" />
			
	 <form action="" method="post">
	 			<input type="button" value="添加管理员" id="newAdmin" style="align:left "/>
	 			<input type="button" value="升级权限" id="updatepower" style="align:left "/>
				<table width="500px" align="right">
					<tr>
						<td colspan="6" align="right">
						   	<input type="text" class="cx" name="keyword" placeholder="输入用户名称/账号/编号" />
							<input type="submit" value="查询" />
							<input type="button" value="删除" id="delete"/>
						</td>
					</tr>
				</table>
      <div style="min-height: 210px;">
     <table width="1000px;" align="center"cellspacing="0" cellpadding="0"   class="z" >
    	<tr class="ths">
    		<th width="60px">
				<input type="checkbox" name="all" id="all" />
			</th>
    	    <th>序号</th>
    	    <th>帐号</th>
    		<!-- <th>密码</th> -->
    		<th>类型</th>
    		<th>职称</th>
    		<th>姓名</th>
    		<th>性别</th>
    		<th>用户编号</th>
    		<th>生日</th>
    		<th>电话</th>
    		<th>邮箱</th>
    		<th>图片</th>
    		<th>钱包</th>
    	</tr>
    	
	    <c:forEach items="${userlist}" var="user" varStatus="statu">
	    	<tr class="ths_a">
	    		<td align="center">
					<div id="list">
						<input type="checkbox" name="check" value="${user.uid}" />
					</div>
				</td>
	    	    <td>&nbsp;&nbsp;${statu.count}</td>
	    		<td>${user.account}</td>
	    		<%-- <td>${user.pwd}</td> --%>
	    		<td>${user.uType}</td>
	    		<td>${user.uauthority}</td>
	    		<td>${user.name}</td>
	    		<td>${user.sex}</td>
	    		<td>${user.uid}</td>
	    		<td>${user.birthday}</td>
	    		<td>${user.phone}</td>
	    		<td>${user.email}</td>
	    		<td>${user.upicFilename }</td>
	    		<td>${user.umoney}</td>
	    	</tr>  
	    </c:forEach>
    </table>
    </div>
    </form>
     <!-- 分页功能 start -->  
        <div align="center" >  
            <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
                ${page.pageNow} 页</font> <a href="User/list?pageNow=1">首页</a>  
            <c:choose>  
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="User/list?pageNow=${page.pageNow - 1}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="User/list?pageNow=1">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="User/list?pageNow=${page.pageNow}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="User/list?pageNow=${page.pageNow + 1}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="User/list?pageNow=${page.totalPageCount}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="User/list?pageNow=${page.pageNow}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="User/list?pageNow=${page.totalPageCount}">尾页</a>  
                </c:otherwise>  
            </c:choose>  
        </div>  
        <!-- 分页功能 End -->  
    
    </center>
  </body>
</html>
