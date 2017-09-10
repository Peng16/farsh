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
    
    <title>My JSP 'shopCar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/css/shopCar.css" />
	<link rel="stylesheet" href="<%=basePath%>resources/css/style2.css" />
	<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/shopCar.js"></script>
	
	<style type="text/css">
	.sCar-center{
		margin: 60px auto;
        width: 992px;
        min-height: 360px;
		background: #FFF none repeat scroll 0% 0%;
		border: 1px solid #DDD;	
	}
	</style>
	<script type="text/javascript">
	$(function(){
		//全选
		var accut = $("#uAccount").text();
		 $("#all").click(function(){
			    var sum = 0.00;
				var amount = 0;
				var checkBox = $("input[name='check']");
				if (this.checked) {
					 for(var i=0;i<checkBox.length;i++){
						 checkBox[i].checked=true;
						 var sumPrice = $("#f5"+i+"");
						 var price = sumPrice.html();
						 sum += parseFloat(price);
						 amount++;
					 }
				} else {
					$("input[name='check']").each(function(){this.checked=false;}); 
				}
				$("#payMoney").html(sum);
				$("#choiceAmount").html("<span>"+amount+"</span>");
	       });
		 //选择任意的全选框
		$("input[name='check']").click(function(){
			var sum = 0.00;
			var amount = 0;
			var checkBox = $("input[name='check']");
			 for(var i=0;i<checkBox.length;i++){
				 var sumPrice = $("#f5"+i+"");
				 var price = sumPrice.html();
		    	 if(checkBox[i].checked){
		    		 checkBox[i].checked = true;
		    		 sum += parseFloat(price);
		    		 amount++;
		    	 }
		    	 
		    	 if (checkBox[i]==false) {
		    		 sum -= parseFloat(price);
				}
		     }
			 
		     $("#payMoney").html(sum);
			 $("#choiceAmount").html("<span>"+amount+"</span>");
		 });
		 
		var suball = $("input[name='check']");
		suball.click(function(){
			$("#all").prop("checked",suball.length == suball.filter(":checked").length?true:false);
		});
		
		//获取数量
		var d = parseInt($("#ind").val());
		for(var i=0;i<d;i++){
			var checkB ="check"+i;
			var checkBox = $("#"+checkB);
			var textBox = "textBox+" + parseInt(checkBox.val());
			var amut = $("input[name='"+textBox+"']");
			var minus = "minus+"+ parseInt(checkBox.val());
			var min = $("input[name='"+minus+"']");
			amut.val(parseInt(amut.val()));
			if(parseInt(amut.val()) == 1){
				min.attr('disabled',true);
			}
			var aname="addAmount+"+i; 
			var addAmount = $("input[name='"+aname+"']");
			addAmount.click(function(){
				var arr = $(this).attr("name").split("+");
				var textBox = "textBox+" + parseInt(arr[1]);
				var minus = "minus+"+ parseInt(arr[1]);
				var amut = $("input[name='"+textBox+"']");
				var min = $("input[name='"+minus+"']");
				amut.val(parseInt(amut.val()) + 1);
				if(parseInt(amut.val()) != 1){
					min.attr('disabled',false);
				}
				changeAmount(checkBox,amut.val(),arr[1]);
			});
			var minuss = "minus+"+ i;
			var minn = $("input[name='"+minuss+"']");
			minn.click(function(){
				var arr =$(this).attr("name").split("+");
				var textBox = "textBox+" + parseInt(arr[1]);
				var minus = "minus+"+ parseInt(arr[1]);
				var amut = $("input[name='"+textBox+"']");
				var min = $("input[name='"+minus+"']");
				if(parseInt(amut.val()) == 1){
					min.attr('disabled',true);
				}else{
					amut.val(parseInt(amut.val()) - 1);
					
					alert(amut.val()+"     ...");
					changeAmount(checkBox,amut.val(),arr[1]);
				}
			});
			
		}
		//checkAllBox
		 
		//改变数量
		function changeAmount(checkBox,amount,sid){
			var checkB ="check"+sid;
			var checkBox = $("#"+checkB);
			var id = checkBox.val();
			alert(sid+"  sid");
			alert(id+"  id");
			if(checkBox.checked=true){
				$.post("Scart/changeAmount",{"amount":amount,"sid":id},function(response){
					var sumPrice = $("#f5"+sid+"");
					 alert(response.sumprice);
				 	 sumPrice.html(response.sumprice);
				 	$("#payMoney").html(sum);
				    
				});
			}else{
				$.post("Scart/changeAmount",{"amount":amount,"sid":id},function(response){
					var sumPrice = $("#f5"+sid+"");
					 alert(response.sumprice);
				 	 sumPrice.html(response.sumprice);
				});
			}
		}	 

	});
			function fun(){
				 alert("请先登录！！");
				 window.location="User/login";
				}
			function makePay(){
				 
				var checkNum= $("input[name='check']:checked").length;
				if (checkNum == 0) {
					alert("至少选择一条数据");
					return false;
				}
				if (confirm('确定要购买吗?')) {
					var uAccount = $("#uAccount").html();
					var sumprice =$("#payMoney").html();
					//alert (uAccount);
					var farmProdu = new Array();
					$("input[name='check']:checked").each(function(){
						farmProdu.push($(this).val());
					});
					$.ajax({
						type:"Post",
						url:"Order/"+uAccount+"/addOrder",
						data:{'checkval':farmProdu.toString(),'sumprice':sumprice},
						success:function(result){
							if(result=="true"){
								alert(result);
								window.location.href = "Order/checkorder?account="+uAccount+"";
							}else{
								alert(result);
							}
						}
					});
					return true;
				}
				//alert("settlement");
			}
			
	</script>
  </head>
  <body style="width: 100%;min-height:500px">
  <div id="big_head">
 		<div id="head">
	 		<a href="#">myFarm农场官网</a> 
	   	 	<a href="#">myFarm商城</a> 
	   	 	<a href="#">服务</a> 
	   	 	<a href="#">社区</a> 
		</div>
		<div id="head_a">
			<c:choose>
				 <c:when test="${user.account == null}">
   	 			      			<ul>
								<li style="line-height: 40px;text-align:center; "><a onclick="fun();" >购物车（0）</a></li>
							</ul>
   	 			  </c:when>
				  <c:otherwise>
   	 			           	<ul>
								<li style="line-height: 40px;text-align:center; "><a href="Scart/${user.account}/listscart">购物车（${samount }）</a></li>
							</ul>
   	 			  </c:otherwise>
			</c:choose>
		
		<div id="small_head">
	   	 		<c:choose>
   	 			      <c:when test="${user.account == null}">
   	 			      		<a href="User/login" >登录</a>|<a href="User/userregister">注册</a>
   	 			      </c:when>
   	 			      <c:otherwise>
   	 			              <a href="User/${user.account}/usercenter"id="uAccount">${user.account }</a>|
   	 			              <a href="User/Exit">退出</a>
   	 			      </c:otherwise>
   	 			</c:choose>
	   	</div>   	 	
 	</div>
 	</div>
 	 	<div id="big_center">
 		<div id="small_center">
 			<a href="#"><img src="resources/images/backgr/logo-player.png" width="100px" height="100px" /></a>
 		</div>
 		<div id="menu">
   	 			<ul id="big_menu">
   	 				<li>
   	 					<a href="#">生鲜肉类</a>
   	 					<div id="big_menu_content"  style="z-index:900;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_c">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/meat.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">小鲜肉</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">17元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">新鲜水果</a>
   	 					<div id="big_menu_content" style="z-index:910;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/boluo.jpg"style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">新鲜水果</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">健康蔬菜</a>
   	 					<div id="big_menu_content" style="z-index:920;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px" /></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_a">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
	   	 					<div id="small_menu_content_b">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li>
   	 					<a href="#">农场环境</a>
   	 					<div id="big_menu_content" style="z-index:930;">
   	 					<hr/>
   	 						<div id="small_menu_content">
	   	 						<table width="200px;">
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="130px;">
	   	 									<a href="#"><img src="resources/images/uImages/juanxincai.jpg" style="width: 160px;height: 100px"/></a>
	   	 								</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;"><a  href="#">卷心菜</a></td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td align="center" height="30px;" style="color: #FF6709;">12元起</td>
	   	 							</tr>
	   	 							<tr>
	   	 								<td height="20px;"></td>
	   	 							</tr>
	   	 						</table>
	   	 					</div>
   	 					</div>
   	 				</li>
   	 				<li><a href="">服务</a></li>
   	 			</ul>
 		</div>
 		<div class="searchBar sc">
 			<form action="Product/searchPro" method="post" enctype="multipart/form-data">
				<input name="searchText" type="text" id="searchText" />
				<input type="submit" id="toSearch" class="submit ts-btn" value="搜索"/>
			</form>
 		</div>
 	</div>
 <div class="sCar-center">
  <!-- order_add-->
  <form action="Order/addOrder" method="post" enctype="multipart/form-data">
  	<div id="page" class="c1">
  		<div id="content">
  			<div id="content_content">
  				<div id="content_content_top">
  					<ul>
  						<li style="border-right: 1px solid #CCCCCC;"><a href="showproduct.action?userName=${sessionScope.account }">全部商品</a></li>
  					</ul>
  				</div>
  				<c:if test="${empty scartlist}">
					<a href="User/usermain">
						<img src="resources/images/recordnull.png" width="918px"/>
					</a>
					
				</c:if>
				
				<c:if test="${!empty scartlist}">
  				<div id="content_content_c">
  					<div id="c1"><input type="checkbox" name="all" id="all" autocomplete="off"/></div>
  					<div id="c2">全选</div>
  					<div id="c3">商品信息</div>
  					<div id="c4">单价（元）</div>
  					<div id="c5">数量</div>
  					<div id="c6">金额(元)</div>
  					<div id="c7">操作</div>
  				</div>
  				
  				<div id="content_content_footer">
	  				<ul>
	  				<c:forEach items="${scartlist}" var="scart" varStatus="status">
	  					<li>
							<div class="item-list">
								<div id="f1"><input type="checkbox" id="check${status.index}" name="check" value="${scart.sId}" autocomplete="off" /></div>
								<div id="img_dv">
									<div id="img_div"><a href="#"><img id="img" alt="图示" src="resources/images/uImages/xiangjiao.jpg" /></a></div> 
								</div>
								<div id="info_dv">
									<br />
									<div><a id="bookName" href="#">${scart.sname }</a></div> <br />
									<div id="discount"></div>折扣 <br />
									<div id=" "> </div>
								</div>
								<input type="hidden" id="ind" value="${status.count+1}">
								<div id="f3">${scart.sprice}</div>
							
								<div id="f4">
									<input id="minus" class="am-btn am-btn-default" name="minus+${status.index}" type="button" value="-" />
									<input id="text" type="text" size="1" value="${scart.amount }" name="textBox+${status.index}"/>
									<input id="add" class="am-btn am-btn-default" name="addAmount+${status.index}" type="button" value="+" />
								</div>
								
								<div id="f5${status.index}" class="f5">${scart.sprice * scart.amount}</div>
								<div id="f6"><a id="delete" onClick="return confirm('确定删除?');" href="Scart/${scart.sId}/${user.account}/deleteScart">删除</a></div>
							</div>
						</li>
	  				</c:forEach>
	  				</ul>
  				</div>
  				
  				<div id="content_c_footer">
	  				<div id="goShopping">
	  					<a href="User/usermain">继续购物</a>&nbsp;&nbsp;
	  				</div>  
	  				<div id="ensurePay">
	  					<ul>
	  						<li style="height: 50px;margin-top: -10px;"><input type="button" value="确认购买" onclick="makePay()" style="width:70px;height: 35px;border: none;background: #4C9ED9 none repeat scroll 0% 0%;"/></li>
	  						<li>合计（不含运费）&nbsp;:￥<span id="payMoney">0.00</span></li>
	  						<li>已选中商品&nbsp;<span id="choiceAmount">0</span>&nbsp;件&nbsp;</li>
	  					</ul>
	  				</div>
	  			</div>
	  			</c:if>
  			</div>
  		
  		</div>
  	</div>
  	</form>
  	
  	</div>
  	
  		<!-- 页面尾部 -->
		<script type="text/javascript" src="<%=basePath%>/resources/js/script.js"></script>
  		<div id="last" >
		<div id="head_last">
			<ul>
				<li><a href="#">1小时速达服务</a></li>
				<li><a href="#">即时无理由退货</a></li>
				<li><a href="#">满60元包邮</a></li>
				<li><a href="#">百余家售后网点</a></li>
			</ul>
		</div>
		<div id="center_last">
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<dl>
				<dt id="dt_a" style="font-size: 14px;">帮助中心</dt>
				<dt id="dt_b"><a href="#">购物指南</a></dt>
				<dt id="dt_b"><a href="#">支付方式</a></dt>
				<dt id="dt_b"><a href="#">配送方式</a></dt>
			</dl>
			<div id="dt_right">
				<ul>
					<li><p style="font-size: 20px;color: #FF6700" align="center">400-100-5678</p></li>
					<li><p style="color:#616161;font-size:12px;" align="center">周一至周日 8:00-18:00</p></li>
					<li><p style="color:#616161;font-size:12px;" align="center">（仅收市话费)</p></li>
				</ul>
				<div id="button" align="center"><a href="#">24小时在线客服</a></div>
			</div>
		</div>
		<div id="bottom_last">
			<div id="logo">
				<img src="resources/images/backgr/logo_myFarm02.JPG" />
			</div>
			<div id="foot_left">
				<a href="#">myFarm农场官网</a> 
	   	 		<a href="#">myFarm商城</a> 
	   	 		<a href="#">服务</a> 
	   	 		<a href="#">社区</a> 
		   	 	<a href="#">问题反馈</a> 
			</div>
			<div id="foot_left_a">
				<span style="font-size: 12px; color:#9B9B9B" >myFarm版权所有-京ICP备2013090111-京公网安备2017070111-京ICP证13170907</span>
			</div>
			<div id="foot_right">
				<a href="#"><img src="resources/images/user_image/v-logo-1.png" /></a>
				<a href="#"><img src="resources/images/user_image/v-logo-2.png" /></a>
				<a href="#"><img src="resources/images/user_image/v-logo-3.png" /></a>
			</div>
		</div>
	</div>
  	
  </body>
</html>
