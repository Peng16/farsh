<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath%>/resources/css/backgr/public.css" type="text/css" rel="stylesheet">
        <link href="<%=basePath%>/resources/css/backgr/houtai.css" type="text/css" rel="stylesheet">
        <link href="<%=basePath%>/resources/css/backgr/smartMenu.css" type="text/css" rel="stylesheet">
        <title>myFarm后台管理系统</title>
    </head>
    
    <body>
    	<div id="admin">
    		<div class="ad-menu" id="ad-menu">
                <div class="ad-logo" style="height:70px; width:200px; background-color: #113965;"><span style="font-size: 40px; color: #4C9ED9;">MyFarm</span> </div>
                <div class="ad-list">
                    <ul>
                        <li>
                            <div class="div2 li-item" ><em class="scm li-ico ic1"></em>首页<span class="scm arrow"></span></div>
                            <dl class="div3">
                            	<dd>
                                    <a href="User/admain" class="dd-item">返回首页<span class="scm dd-ar"></span></a>
                               </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="div2 li-item"><em class="scm li-ico ic3"></em>商城产品信息管理<span class="scm arrow"></span></div>
                            <dl class="div3">
                                <dd>
                                    <a href="Product/addpage" target="manage" class="dd-item">添加农产品<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="Product/list" target="manage" class="dd-item">农产品查询<span class="scm dd-ar"></span></a>
                                </dd>
                                
                                <dd>
                                    <a href="Record_showAdUOrByPage.action" target="manage" class="dd-item">农产品管理<span class="scm dd-ar"></span></a>
                                </dd>
                                
                            </dl>
                        </li>
                        <c:if test="${admin.uauthority=='一级管理员' }">
                            <li>
                            <div class="div2 li-item"><em class="scm li-ico ic4"></em>用户管理<span class="scm arrow"></span></div>
                            <dl class="div3">
                                <dd>
                                    <a href="User/list" target="manage" class="dd-item">用户列表<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="Opinions_showOpinionsByPage.action" target="manage" class="dd-item">用户反馈信息<span class="scm dd-ar"></span></a>
                                </dd>
                                
                            </dl>
                        </li>
                        </c:if>
                        <li>
                            <div class="div2 li-item"><em class="scm li-ico ic2"></em>订单管理<span class="scm arrow"></span></div>
                            <dl class="div3">
                                <dd>
                                    <a href="Order/orderPaylist" target="manage" class="dd-item">已支付订单<span class="scm dd-ar"></span></a>
                                </dd>
                                 <dd>
                                    <a href="Order/getOrderSendlist" target="manage" class="dd-item">待确认收货订单<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="Order/doGetOrderSendlist" target="manage"class="dd-item">已确认收货订单<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="Order/getOrderCancelist" class="dd-item" target="manage">被取消订单 <span class="scm dd-ar"></span></a>
                                </dd>
                            </dl>
                        </li>
        
                    </ul>
                </div>
            </div>
    		<div class="ad-comment-box" id="ad-comment">
                <div class="ad-top-comment">
                    <div class="ad-message">
                        <div class="ad-top-right">
                            <div class="ad-welcom">
                                <div class="ad-wel-text">
                      <c:choose>
   	 			      <c:when test="${admin.account == null}">
   	 			      		 <div class="font-wel">欢迎您！<strong>ss</strong></div>
                                    <div class="font-wel"><a href=" "><strong>【退出】</strong></a></div>
   	 			      </c:when>
   	 			      <c:otherwise>
   	 			             <div class="font-wel">欢迎您！<a href="User/${admin.account}/usercenter"><strong>${admin.account }</strong></a>|</div>
                                    <div class="font-wel"><a href="User/Exit"><strong>【退出】</strong></a></div>
   	 			      </c:otherwise>
   	 			</c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="ad-sub-nav-box content-tabs">
                        <!-- <div class="ad-sub-record">历史记录</div> -->
                        <a href="javascript:;" class="scm jian-a sub-sel pre j_tabBg J_tabLeft"></a>
                        <div class="ad-sub-wraper page-tabs J_menuTabs">
                            <ul class="ad-sub-list page-tabs-content">
                                <li class="active J_menuTab" >首页</li>
                            </ul>
                        </div>
                        <a href="javascript:0;" class="scm jian-a next j_tabBg J_tabRight"></a>
                    </div>
                </div>
                <div class="ad-main-comment J_mainContent" id="ad-iframe" style="height: 660px;" >
                    <iframe class="J_iframe"  name="manage" width="100%" height="100%" src="User/begin" frameborder="0" data-id="index_v0.html" seamless></iframe>
                </div>
    		</div>
    	</div>
    	
    	
    	
        <script type="text/javascript" src="<%=basePath%>/resources/js/backgro/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>/resources/js/backgro/contabs.js"></script>
        <script type="text/javascript" src="<%=basePath%>/resources/js/backgro/maintabs.js"></script>
        <script type="text/javascript" src="<%=basePath%>/resources/js/backgro/jquery-smartMenu-min.js"></script>
        <script type="text/javascript" src="<%=basePath%>/resources/js/backgro/jquery.nicescroll.min.js"></script>
        <script type="text/javascript">
           
        </script>
        <script type="text/javascript">
			$(document).ready(function(){
				$(".div2").click(function(){ 
					$(this).next("div").slideToggle("slow")  
					.siblings(".div3:visible").slideUp("slow");
				});
			});
</script>
    </body>
</html>
