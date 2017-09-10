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
	<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="resources/css/basic/js/quick_links.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/style2.css" />
	<link href="resources/css/basic/css/demo.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.searchResult {
	margin: 60px auto;
	width: 992px;
	min-height: 360px;
	background: #FFF none repeat scroll 0% 0%;
	border: 1px solid #DDD;
	-webkit-transform: translateX(0);
	-ms-transform: translateX(0);
	transform: translateX(0);
}

.resultLay {
	margin-top: 25px;
	border-radius: 4px;
	margin-left: 100px;
}

.resultLay li {
	text-align: center;
	float: left;
	padding: 8px 10px 0;
	width: 200px;
	font: 14px/1.5 tahoma, arial, "Hiragino Sans GB", 宋体, sans-serif;
	list-style: none;
}

.resultLay li img {
	width: 100%;
}
li{
margin: 0;
padding: 0;
border: 0;
font-size: 100%;
font: inherit;
vertical-align: baseline;
font-family: arial,"Lantinghei SC","Microsoft Yahei";
}
img {
	border: none;
}

a,img {
	border: 0;
}
.am-tabs-bd .am-tab-panel * {
    -webkit-user-drag: none;
}
.am-pagination {
    position: relative;
}
.am-pagination-right {
    text-align: right;
}
.am-pagination {
    padding-left: 0;
    margin: 1.5rem 0;
    list-style: none;
    color: #999999;
    text-align: left;
}

.am-pagination > .am-active > a, .am-pagination > .am-active > span, .am-pagination > .am-active > a:hover, .am-pagination > .am-active > span:hover, .am-pagination > .am-active > a:focus, .am-pagination > .am-active > span:focus {
    z-index: 2;
    color: #fff;
    background-color: #0e90d2;
    border-color: #0e90d2;
    cursor: default;
}
div.center a:hover {
    color: black;
}
div.center a:link {
    margin-left: 5px;
    margin-top: 10px;
    color: #000;
    text-decoration: none;
    font-size: 12px;
}
.am-pagination > li > a:hover, .am-pagination > li > span:hover, .am-pagination > li > a:focus, .am-pagination > li > span:focus {
    background-color: #eeeeee;
}
.am-tabs-bd .am-tab-panel * {
    -webkit-user-drag: none;
}
.am-pagination > li > a, .am-pagination > li > span {
    position: relative;
    display: block;
    padding: 0.5em 1em;
    text-decoration: none;
    line-height: 1.2;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 0;
    margin-bottom: 5px;
    margin-right: 5px;
}
a:link, a:visited, a:hover {
    text-decoration: none;
    outline: none;
}
a:hover, a:focus {
    color: #095f8a;
}
a:active, a:hover {
    outline: 0;
}
a, img {
    border: 0;
}
 
a {
    color: #000;
    text-decoration: none;
}

.am-pagination::before, .am-pagination::after {
    content: " ";
    display: table;
}
.am-tabs-bd .am-tab-panel * {
    -webkit-user-drag: none;
}
.am-pagination {
    position: relative;
}
.am-pagination-right {
    text-align: center;
}
}
.am-tabs-bd .am-tab-panel * {
    -webkit-user-drag: none;
}
.am-pagination li {
    float: none;
}
.am-pagination > li {
    display: inline-block;
}
</style>
  </head>
  
  <body>
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
   	 			              <a href="User/${user.account}/usercenter">${user.account }</a>|
   	 			              <a href="User/${user.account}/Exit">退出</a>
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
   	 					<a href="showproduct.action?userName=${user.account }">生鲜肉类</a>
   	 				</li>
   	 				<li>
   	 					<a href="showproduct.action?userName=${sessionScope.account }">健康蔬菜</a>
   	 				</li>
   	 				<li>
   	 					<a href="showproduct.action?userName=${sessionScope.account }">农场环境</a>
   	 				</li>
   	 				<li><a href="">服务</a></li>
   	 				 
   	 			</ul>
 		</div>
 		<div class="searchBar sc">
 			<form action="Product/searchPro" method="post" style="height: 40px" enctype="multipart/form-data">
				<input name="searchText" type="text" id="searchText" />
				<input type="submit" id="toSearch" class="submit ts-btn" value="搜索"/>
			</form>
 		</div>
 	</div>

	<div class="searchResult">
	<span style="font-size: 20px;">搜索 ”${ searchText}“ 的结果是：</span>
		<center>
				<c:if test="${empty productlist}">
				<div class="resultLay">
					<a href="User/usermain"> 
					<img src="resources/images/searchnull.png" width="918px" />
					</a>
					</div>
				</c:if>

				<c:if test="${!empty productlist}">
				<div class="resultLay">
					<div style="min-height: 210px;">
						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							<c:forEach items="${productlist}" var="pro" varStatus="statu">
								<li>
									<div class="i-pic limit">
										<img src="resources/images/imgsearch1.jpg" />
										<p>
											【${pro.pattern} <span>${pro.pcategory}</span>
										</p>
										<p class="price fl">
											<b>¥</b> <strong>${pro.price}</strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					</div>
					
						<div class="clear"></div>
		             <ul class="am-pagination am-pagination-right">
			<li><a>第${page.pageNow}页</a></li>
			<li><a>共${page.totalPageCount}页</a></li>
			<li><a
				href="Product/searchProList?pageNow=1&searchText=${ searchText}">首页</a></li>
			<c:if test="${page.pageNow > 1 }">
				<li><a
					href="Product/searchProList?pageNow=${page.pageNow - 1}&searchText=${ searchText}">上一页</a></li>
			</c:if>

			<%-- 计算begin、end --%>
			<c:choose>
				<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
				<c:when test="${page.totalPageCount <= 5 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="${page.totalPageCount}" />
				</c:when>
				<c:otherwise>
					<%-- 当总页数>10时，通过公式计算出begin和end --%>
					<c:set var="begin" value="${page.pageNow -4 }" />
					<c:set var="end" value="${page.pageNow }" />
					<%-- 头溢出 --%>
					<c:if test="${begin < 1 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="5" />
					</c:if>
					<%-- 尾溢出 --%>
					<c:if test="${end > page.totalPageCount}">
						<c:set var="begin" value="${page.totalPageCount - 4 }" />
						<c:set var="end" value="${page.totalPageCount}" />
					</c:if>
				</c:otherwise>
			</c:choose>

			<%-- 循环遍历页码列表 --%>
			<c:forEach var="i" begin="${begin }" end="${end }">
				<c:choose>
					<c:when test="${i eq page.pageNow }">
						<li class="am-active"><a>[${i }]</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="Product/searchProList?pageNow=${i}&searchText=${ searchText}">[${i }]</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.pageNow < page.totalPageCount }">
				<li><a
					href="Product/searchProList?pageNow=${page.pageNow + 1}&searchText=${ searchText}">下一页</a></li>
			</c:if>
			<li><a
				href="Product/searchProList?pageNow=${page.totalPageCount}&searchText=${ searchText}">尾页</a></li>

		</ul> 
					</c:if>
		</center>
		

	</div>
				
			

	<%-- <center>
  	<h2 style="font-size: 25px; margin-top: 40px; color: #5C5956;">
				商品信息
			</h2>
			<hr color="#5C5956" width="80%" />
     <form action="" method="post">
      <c:if test="${empty productlist}">
					<a href="User/usermain">
						<img src="resources/images/recordnull.png" width="918px"/>
					</a>
					
				</c:if>
				
				<c:if test="${!empty productlist}">
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
    </c:if>
    </form>	
  <!--  <div align="center"> <a href="Product/addpage">添加产品</a>
    
    
    </div>-->
        <!-- 分页功能 start -->  
        <div align="center" >  
            <input type="hidden" id="pageNow" value="${page.pageNow}"/>
            <font size="2">共 ${page.totalPageCount} 页</font> <font size="2" >第  
                ${page.pageNow} 页</font> <a href="Product/searchProList?pageNow=1&searchText=${ searchText}">首页</a>  
            <c:choose>  
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="Product/searchProList?pageNow=${page.pageNow - 1}&searchText=${ searchText}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="Product/searchProList?pageNow=1&searchText=${ searchText}">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="Product/searchProList?pageNow=${page.pageNow}&searchText=${ searchText}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="Product/searchProList?pageNow=${page.pageNow + 1}&searchText=${ searchText}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="Product/searchProList?pageNow=${page.totalPageCount}&searchText=${ searchText}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="Product/searchProList?pageNow=${page.pageNow}&searchText=${ searchText}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="Product/searchProList?pageNow=${page.totalPageCount}&searchText=${ searchText}">尾页</a>  
                </c:otherwise>  
            </c:choose>  
        </div>  
        <!-- 分页功能 End -->  
     </center>
     --%>
    	<!--菜单 -->
				<c:choose>
					<c:when test="${user.account == null}">
						<div class=tip>
							<div id="sidebar">
								<div id="wrap">
									<div id="prof" class="item">
										<a href="#"> <span class="setting"></span>
										</a>
										<div class="ibar_login_box status_login">
											<div class="avatar_box">
												<p class="avatar_imgbox">
													<img src="resources/css/basic/images/no-img_mid_.jpg" />
												</p>
												<ul class="user_info">
													<li>用户未登录</li>
													<li>游客身份</li>
												</ul>
											</div>
											<div class="login_btnbox">
												<a href="#" class="login_order">我的订单</a> <a href="#"
													class="login_favorite">我的收藏</a>
											</div>
											<i class="icon_arrow_white"></i>
										</div>
									</div>
									<div id="shopCart" class="item">
										<a href="#"> <span class="message"></span>
										</a>
										<p>购物车</p>
										<p class="cart_num">0</p>
									</div>
									<div class="quick_toggle">
										<ul>
											<li class="qtitem"><a href="/#top" class="return_top"><span
													class="top"></span></a></li>
										</ul>
									</div>
									<!--回到顶部 -->
									<div id="quick_links_pop" class="quick_links_pop hide"></div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class=tip>
							<div id="sidebar">
								<div id="wrap">
									<div id="prof" class="item">
										<a href="#"> <span class="setting"></span>
										</a>
										<div class="ibar_login_box status_login">
											<div class="avatar_box">
												<p class="avatar_imgbox">
													<img src="resources/css/basic/images/no-img_mid_.jpg" />
												</p>
												<ul class="user_info">
													<li>用户名：${user.name }</li>
													<li>级&nbsp;别：${user.uauthority }${user.uType }</li>
												</ul>
											</div>
											<div class="login_btnbox">
												<a href="#" class="login_order">我的订单</a> <a href="#"
													class="login_favorite">我的收藏</a>
											</div>
											<i class="icon_arrow_white"></i>
										</div>
									</div>
									<div id="shopCart" class="item">
										<a href="#"> <span class="message"></span>
										</a>
										<p>购物车</p>
										<p class="cart_num">${samount }</p>
									</div>
									<!--回到顶部 -->
									<div id="quick_links_pop" class="quick_links_pop hide"></div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
	 
		<!-- 页面尾部 -->
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
