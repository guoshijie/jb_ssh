<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path1 = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jb_head</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="./css/jb_head.css">
	<script type="text/javascript" src="./admin/files/js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="./js/jb_head.js"></script>
	<script type="text/javascript" src="./js/search.js"></script>
  </head>
  
  <body onload="time()">
    <div id="top1">
    	<div id="top_details1">
    		<span><a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/my_project_jb/jb_index.html')">设为首页</a>&nbsp;
    			  <a href="javascript:window.external.addFavorite('http://localhost:8080/my_project_jb/jb_index.jsp','聚宝网')">收藏我们</a></span>&nbsp;&nbsp;
    	    <span>您好！欢迎来到聚宝!</span>&nbsp;&nbsp; 
    	    <span>
    	    	  <%
    	    	  		String name = (String)session.getAttribute("jbname");
    	    	  		if(null == name){
    	    	  			out.print("<a href='jb_login.jsp' target='_parent'>[登录]</a><a href='jb_register.jsp' target='_parent'>[注册]</a>");
    	    	  		}else{
    	    	  			out.print(name+"&nbsp;已登录&nbsp;<a href='quit.action' target='_parent'>退出</a>&nbsp;<a href='jb_register.jsp' target='_parent'>[注册]</a>");
    	    	  		}
    	    	  %>
    	   	</span>&nbsp;
    	    <span><a href="mailto:steve_hi@163.com">给我们发邮件</a></span>&nbsp;&nbsp;
    	    <span><a href="#">客服中心</a></span></div>
    </div>
    <div id="head1" style="text-align: center; width: 1200px;">
    	<div id="logo_"><img src="./images/logo.jpg" width="270" height="70"/></div>
    	<div id="my_info">
    		<div id="my_info_details"><a href="jb_myjb.jsp" target="_parent">我的聚宝</a></div>
    		<div id="cart"><a href="jb_cart.jsp" target="_parent">前往购物车</a></div>
    	</div>
    	<form action="multiCondition.action" method="post">
	    	<div id="search">
	    		<div id="search_text1">
	    			<input type="text" id="search_text" name="search_text" autocomplete="off" onkeydown="if(event.keyCode==13) return false;" >
	    			<input type="hidden" id="path" value="<%=basePath1%>"/>
	    			<div id="result"></div>
	    		</div>
	    		<div id=search_button1><input type="submit" id="search_button" value="搜&nbsp;索"></div>
	    		<div id="hot">热门搜索:&nbsp;&nbsp;平板电脑&nbsp;&nbsp;手机&nbsp;&nbsp;行车记录仪&nbsp;&nbsp;四件套</div>
	    	</div>
    	</form>
    </div>
    <div id="nav" style="font-family: 微软雅黑; font-size: 16px; font-weight: bold">
    	<div id="all_goods">全&nbsp;部&nbsp;商&nbsp;品&nbsp;分&nbsp;类</div>
    	<div class="nav_details" id="index1"><a href="index.action" target="_parent">首&nbsp;页</a></div>
    	<div class="nav_details" ><a href="searchGoods!searchGoods.action" target="_parent">所&nbsp;有&nbsp;商&nbsp;品</a></div>
    	<div class="nav_details" ><a href="jb_myjb.jsp" target="_parent">个&nbsp;人&nbsp;中&nbsp;心</a></div>
    	<div class="nav_details" ><a href="jb_aboutUs.jsp" target="_parent">关&nbsp;于&nbsp;我&nbsp;们</a></div>
    	<!-- <div class="nav_details"><a href="jb_digital.jsp" target="_parent">数&nbsp;码&nbsp;城</a></div>
    	<div class="nav_details"><a href="jb_groupbuy.jsp" target="_parent">团&nbsp;购</a></div>
    	<div class="nav_details"><a href="jb_auction.jsp" target="_parent">拍&nbsp;卖</a></div> -->
    	<div id="time"></div>
    </div>
  </body>
</html>
