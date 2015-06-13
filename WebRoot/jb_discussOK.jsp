<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评价成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
	<style type="text/css">
		#disRes{
			width:100%;
			height: 400px;
			text-align: center;
			font-size: x-large;
			font-weight:bold;
			margin-top: 150px;
			line-height: 40px;
		}
	</style>
  </head>
  
  <body>
    <div id="title">评价商品</div>
    <div id="disRes">
    	评价成功<br />
    	<a href="obtainAllOrdersByUser!obtainAllOrdersByUser.action?pageNow=1">返回</a>
    </div>
  </body>
</html>
