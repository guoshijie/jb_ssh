<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>帐户充值</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/jb_recharge.css" type="text/css"></link>
	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
  </head>
  
  <body>
    <div id="title">帐户充值</div>
    <form action="recharge.action" method="post">
    <div id="recharge">
    	<font style="font-size: xx-large; font-weight: bold;">当前帐户余额：￥<s:property value="#session.money"/></font><br><br>
    	请输入充值金额：<input type="text" name="charge" id="charge" onkeyup="value=value.replace(/[^\d]/g,'') " 	/><br><br>
    	<input type="submit" value="确认充值">&nbsp;
    	<input type="reset" value="重置"><br><br>
    	<font style="color: red;"><s:property value="#request.rechargeMeg"/></font>
    </div>
    </form>
  </body>
</html>
