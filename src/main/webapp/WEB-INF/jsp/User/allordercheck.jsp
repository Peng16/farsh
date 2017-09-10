<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'Dingdan.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="resources/css/address.css" type="text/css"></link>
<Style type="text/css">
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
</Style>
</head>
	<body>
		<div class="main">
			<div class="list">
			<div class="row" style="margin-top:110px;">
				<span class="title_a">所有订单</span>
			</div>
			<div class="list_head">
				<span class="w1" style="width:20%;"><b>订单号</b></span> 
				<span class="w1" style="width:25%;"><b>收货人名</b></span> 
				<span class="w1" style="width:25%;"><b>收货人手机号</b></span> 
				<span class="w1" style="width:20%;"><b>状态</b></span>
				<span style="visibility: hidden;" id="orderlistlength"></span>
				<c:forEach items="${orderlist}" var="order">
					<span class="w1" style="width: 25%;">${order.onum}</span>
					<span class="w1" style="width: 25%;"> </span>
					<span class="w1" style="width: 25%;"> </span>
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
			 <!-- 分页功能 start -->  
        <div align="center" >  
            <input type="hidden" id="pageNow" value="${page.pageNow}"/>
            <font size="2">共 ${page.totalPageCount} 页</font> <font size="2" >第  
                ${page.pageNow} 页</font> <a href="Product/list?pageNow=1">首页</a>  
            <c:choose>  
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="Product/list?pageNow=${page.pageNow - 1}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="Product/list?pageNow=1">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="Product/list?pageNow=${page.pageNow}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="Product/list?pageNow=${page.pageNow + 1}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="Product/list?pageNow=${page.totalPageCount}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="Product/list?pageNow=${page.pageNow}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="Product/list?pageNow=${page.totalPageCount}">尾页</a>  
                </c:otherwise>  
            </c:choose>  
        </div>  
        <!-- 分页功能 End -->  
		</div>
	</body>
</html>
