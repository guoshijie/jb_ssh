<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购买失败</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_cart_03.css">

  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
     <div id="main">
     	 <div id="title"> 	
		     	<div class="my_title" style="font-family: 幼圆;">我的购物车</div>
		     	<div class="my_title" style="font-family: 幼圆">填写定单核对信息</div>
		     	<div class="my_title" style="font-family: 幼圆;border-bottom: 2px solid #dd0000;">购买失败</div>
	     </div>
	     <div id="content">
		     Sorry, 余额不足，请充值<br><br>
	     	<a href="jb_index.jsp"><font size="5">返回首页</font></a>
	     </div>
     </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
