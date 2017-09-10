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
    
    <title>My JSP 'list_product.jsp' starting page</title>
    
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
/*  table{
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
  } */
  </style>
  <script type="text/javascript">
	$(function() {
		/*
		var pageNow = $("#pageNow").val();
		alert(pageNow-1);
		*/
		var pageNow = $("#pageNow").val();
		var proamount = $(".ths_a").length;
		//alert(proamount);
		if(pageNow!=1&&proamount == 0){
			//alert(proamount);
			pageNow = pageNow -1;
			window.location.href = "Product/list?pageNow="+pageNow+"";
		}else if(pageNow==1&&proamount==0){
			alert("对不起，没有你想查询的数据，请确认数据是否存在！！！");
		}
		
		 $("#all").click(function() {
			if (this.checked) {
				$("input[name='check']").each(function(){this.checked=true;}); 
			} else {
				$("input[name='check']").each(function(){this.checked=false;}); 	
			}
		});
		
		var suball = $("input[name='check']");
		suball.click(function(){
			$("#all").prop("checked",suball.length == suball.filter(":checked").length?true:false);
		});
		
		$("#delete").click(
				function(){
					var checkNum= $("input[name='check']:checked").length;
					if (checkNum == 0) {
						alert("至少选择一条数据");
						return false;
					}
					if (confirm('确定要删除吗?')) {
						var checklist = new Array();
						$("input[name='check']:checked").each(function(){
							checklist.push($(this).val());
						});
						$.ajax({
							type:"POST",
							url:"Product/deleteProduct",
							data:{'allcheck':checklist.toString()},
							success:function(result){
								$("input[name='check']:checkbox").attr("checked",false);
								window.location.reload();
							}
						});
						//window.location.href = "Product/deleteProduct?pid="+pid+"";
						return true;
					}
					return false;
				}); 
	});
</script>
 </head>
  <body bgcolor="#FFF">
  	<center>
  	<h2 style="font-size: 25px; margin-top: 40px; color: #5C5956;">
				商品信息
			</h2>
			<hr color="#5C5956" width="80%" />
     <form action="" method="post">
				<table width="500px" align="right">
					<tr>
						<td colspan="6" align="right">
						   	<input type="text" class="cx" name="keyword" placeholder="请输入商品名称或编号" />
							<input type="submit" value="查询" />
							<input type="button" value="删除" id="delete"/>
						</td>
					</tr>
				</table>
			
	<div style="min-height: 210px;">
     
     <table cellspacing="0" cellpadding="0"   class="z" width="1000px" align="center" height="100px">
    	<tr class="ths">
    		<th width="60px">
				<input type="checkbox" name="all" id="all" />
			</th>
    	    <th>产品序号</th>
    		<th>产品名称</th>
    		<th>产品单价</th>
    		<th>产品图片</th>
    		<th>销售记录</th>
    		<th>产品库存</th>
    		<th>产品折扣</th>
    		<th>产品描述</th>
    		<th>发布日期</th>
    		<th>产品分类</th>
    		<th>管理产品</th>
    		
    	</tr>
    	
	    <c:forEach items="${productlist}" var="pro" varStatus="statu">
	    	<tr class="ths_a">
				<td align="center">
					<div id="list">
						<input type="checkbox" name="check" value="${pro.pId}" />
					</div>
				</td>
				<td>&nbsp;&nbsp;${statu.count}</td>							
	    		<td>${pro.pname}</td>
	    		<td>${pro.price}</td>
	    		<td>${pro.picture}</td>
	    		<td>${pro.psalenum}</td>
	    		<td>${pro.pstock}</td>
	    		<td>${pro.pdiscount}</td>
	    		<td>${pro.pattern}</td>
	    		<td><fmt:formatDate value="${pro.pubdate}" type="both" dateStyle="long" timeStyle="long"/></td>
	    		<td>${pro.pcategory}</td>
	    		<td>
		    		<a href="Product/updatepage?pid=${pro.pId}"onclick="return confirm('确定要修改')">修改</a>
	    		</td>
	    	</tr>  
	    </c:forEach>
	   
    </table>
    </div>
    </form>	
  <!--  <div align="center"> <a href="Product/addpage">添加产品</a>
    
    
    </div>-->
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
