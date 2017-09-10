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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="<%=basePath %>resources/css/orderstyle.css" />
  </head>
  
  <body>
    <div id="bd">
			<div class="pg-pay body">
				<h2 class="order_title">订单   ${onum} 详情</h2>
				<c:if test="${empty recordlist}">
					<a href="Scart/${user.account}/listscart">
						<img src="resources/images/unpayrecordnull.png" width="918px"/>
					</a>
				</c:if>
				<c:if test="${!empty recordlist}">
				<table class="details">
					<tbody>
						<tr>
							<th>
								商品
							</th>
							<th>
								单价
							</th>
							<th>
								数量
							</th>
							<th>
								小计
							</th>
						</tr>
						<c:forEach items="${recordlist}" var="record" varStatus="status">
						<tr>
							<td width="30%">
								<img src="resources/images/img/exa.jpg" width="50px" height="50px" style="float: left;"/>
								<strong>香蕉</strong>
							</td>
							<td width="25%">
								${record.rprice }
							</td>
							<td width="20%">
								${record.pNum }
							</td>
							<td width="25%">
								${record.pSumprice }
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="margin-bottom: 20px;">
					<h2 class="order_title">收货人信息</h2>
					<div class="consigneeinfo">
						<div class="user_msg">
						<c:if test="${!empty address}">
							<div class="address_list">
								<div class="address_box active">
									<div class="top">
										<span class="name">${address.aName}</span>
										<span class="phone">${address.aPhone}</span>
									</div>
									<div class="bottom">${address.aProvince}${address.aCity}${address.aDetailed}</div>
								</div>
							</div>
						</c:if>	
						</div>
					</div>
				</div>
					<div class="pay-handle">
						<p class="pay-amount">
							支付总额：
							<em >¥${Osumprice}</em>
							<input type="hidden" name="allprice" value="${Osumprice}"/>
							
						</p>
						<p>
							<input name="submit" value="确认订单 发货" class="btn btn-hot"
								gaevent="pay/submit" type="button" onclick="window.location.href='Order/sendOrder?onum=${onum}'">
							<a href="" target="_blank" id="J_submit"></a>
						</p>
					</div>
				</c:if>
			</div>
		</div>
  </body>
</html>
