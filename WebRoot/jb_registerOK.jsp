<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>registerOK</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_registerOK.css">
	

  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
	 <div id="main">
	 	<h1>恭喜你！<s:property value="#result"/>,注册成功了！</h1><br>
	 	<a href="jb_login.jsp"><input type="button" value="立即登录"/></a>
	 </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
