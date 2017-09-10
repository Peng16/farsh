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
    
    <title>修改产品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.js">
</script>
<script type="text/javascript">
function check(){
	   if(document.getElementById("pic").value.length==0){
	        alert("请选择产品图片");
	        return false;
	   }
	   return true;
	}
</script>
 <style type="text/css">
  .b1{
      width:50px;
      height:20px;
      background-color:#FF6700;
      font-size:14px;
      border-style:none;
  }
  body {
     background-image: url(image/background/background2.jpeg);
     top center no-repeat; 
     background-size:cover;
}
  </style>
  </head>
  
  <body onload="" bgcolor="#FFF">
    <center>
  	<h2 style="font-size: 25px; margin-top: 40px; color: #5C5956;">管理员添加产品</h2>
     <hr color="#5C5956" width="80%" />
    <form action="Product/modifyProduct" method="post" enctype="multipart/form-data" onsubmit="return check()" >
        <input type="hidden" name="pid" value="${product.pId}"/>
	    <table>
	    	<tr>
	    		<td>产品名称:</td>
	    		<td><input type="text" name="pname" value="${product.pname}"/></td>
	    	</tr>
	    	<tr>
	    		<td>产品单价：</td>
	    		<td><input type="text" name="price" value="${product.price}"/></td>
	    	</tr>
	    	<tr>
	    		<td>产品图片：</td>
	    		<td><input type="file" name="file" id="pic"/></td>
	    	</tr>
	    	<tr>
	    		<td>销售记录：</td>
	    		<td><input type="text" name="psalenum" value="${product.psalenum}"/></td>
	    	</tr>
	    	<tr>
	    		<td>产品库存：</td>
	    		<td><input type="text" name="pstock" value="${product.pstock}"/></td>
	    	</tr>
	    	<tr>
	    		<td>产品折扣：</td>
	    		<td>
	    		     <select name="pdiscount">
	    		        <option value="0.9">9折</option>
	    		        <option value="0.8">8折</option>
	    		        <option value="0.7">7折</option>
	    		        <option value="0.6">6折</option>
	    		        <option value="0.5">5折</option>
	    		        <option value="1">不打折</option>
	    		     </select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>产品规格：</td>
	    		<td><input type="text" name="pattern" value="${product.pattern}"/></td>
	    	</tr>
	    	<%-- <tr>
	    		<td>发布日期：</td>
	    		<td><input type="text" name="product.pubdate" value="${product.pubdate}"/></td>
	    	</tr> --%>
	    	<tr>
	    		<td>产品分类：</td>
	    		<td>
	    			<select name="pcategory">
	    		        <option value="水果">水果</option>
	    		        <option value="蔬菜">蔬菜</option>
	    		        <option value="花草">花草</option>
	    		        <option value="树木">树木</option>
	    			</select>
	    		</td>
	    	</tr>
	    	
	    	
	    </table>	
	             <p></p> 
	    		<input type="submit" value="确定" class="b1"/>
	    	    &nbsp;&nbsp;&nbsp;
	    		<input type="reset" value="取消" class="b1" />
      </form>
    </center>
  </body>
</html>
