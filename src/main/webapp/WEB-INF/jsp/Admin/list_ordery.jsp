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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/tablestyle.css">
 <script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript">
 
</script>
  </head>
  
  <body bgcolor="#FFF">
  	<center>
  	<h2 style="font-size: 25px; margin-top: 40px; color: #5C5956;">
				订单信息
			</h2>
			<hr color="#5C5956" width="80%" />
	<div style="min-height: 210px;">
                     <table cellspacing="0" cellpadding="0"   class="z" width="1000px" align="center" height="100px">
					<tbody>
						<tr class="ths">
							<th>
								商品订单号
							</th>
							<th>
								用户id 
							</th>
							<th>
								订单生成时间
							</th>
							<th>
							            状态
							</th>
						</tr>
					<c:forEach items="${oderlist}" var="order" varStatus="status">
						<tr class="ths_a">
							<td width="25%">
								<a href="Order/orderpayCheck/?onum=${order.onum }">${order.onum }</a>
							</td>
							<td width="25%">
								 ${order.uid }
							</td>
							<td width="25%">
								 ${order.oDate }
							</td>
							<c:choose>
							  <c:when test="${order.ostate==1 }">
							    <td width="20%">
								          已支付
							   </td>
							  </c:when>
							  <c:when test="${order.ostate==10 }">
							    <td width="20%">
								         已发货
							   </td>
							  </c:when>
							  <c:when test="${order.ostate==11 }">
							    <td width="20%">
								          已确认收货
							   </td>
							  </c:when>
							  <c:when test="${order.ostate==100 }">
							    <td width="20%">
								          已取消订单
							   </td>
							  </c:when>
							</c:choose>
						</tr>
						</c:forEach>
					</tbody>
				</table> 
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
     </center>
  </body>
</html>
