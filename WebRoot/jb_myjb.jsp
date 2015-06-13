<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的聚宝</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_myjb.css">
    <script type="text/javascript" src="./js/jb_myjb.js"></script>

  </head>
  
  <body onload="down(m,n)">
	 <%@include file="./content/jb_head.jsp" %>
     <div id="main">
     	<div id="my_title" style="font-family: 幼圆"><a href="jb_myjb.jsp">我的聚宝</a></div>
     	<div id="content">
     		<div id="left">
     			<div id="left_title">我的聚宝</div>
     			<div id="small_title1" onclick ="down('order','small_title1')">订单中心</div>
     			<div id="order">
     				<a href="obtainAllOrdersByUser!obtainAllOrdersByUser.action?pageNow=1" target="right">我的定单</a><br>
     				<a href="getCollectListByPage.action?pageNow=1" target="right">我的收藏</a><br>
     				<a href="ordersRecycle!ordersRecycle.action?pageNow=1" target="right">订单回收站</a><br>
     				<a href="admin/nofinish.jsp" target="right">浏览历史</a><br>
     			</div>
     			<div id="small_title2" onclick ="down('user_info','small_title2')">帐户中心</div>
     			<div id="user_info">
     				<a href="jb_myjb.jsp">个人帐户信息</a><br>
     				<a href="jb_recharge.jsp" target="right">帐户余额/充值</a><br>
     				<a href="getAddress!getAllAddress.action" target="right">收货地址管理</a><br>
     			</div>
     			<div id="small_title3" onclick ="down('service','small_title3')">客服服务</div>
     			<div id="service">
     				<a href="admin/nofinish.jsp" target="right">返修/退换货</a><br>
     				<a href="admin/nofinish.jsp" target="right">取消定单</a><br>
     				<a href="admin/nofinish.jsp" target="right">我的投诉</a><br>
     			</div>
     		</div>
     		<div id="right">
     		     <!-- <iframe id="right_01" name="right" marginwidth=0 marginheight=0 width=100% height="100%" src="jb_userJb.jsp" frameborder=0 scrolling="no" onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe> --> 
     		     <iframe id="right_01" name="right" marginwidth=0 marginheight=0 width=100% height="100%" src="jb_userJb.jsp" frameborder=0 scrolling="no" onload="Javascript:SetWinHeight(this)"></iframe> 
     		</div>
     	</div>
     </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
