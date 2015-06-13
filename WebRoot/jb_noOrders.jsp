<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jb_noOrders.jsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
  </head>
  
  <body>
   		<div id="title">
	    	我的定单
	    	<label style="color: gray;font-size: 14px; margin-left: 40px; font-weight: normal;">未评价商品(0)</label>
	    </div>
	    <div id="content" style="width: 100%;height: 40px;text-align: center;line-height: 40px;">
	    	您还没有下过定单
	    </div>
  </body>
</html>
