<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>聚宝用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jb_register.css">
	<script type="text/javascript" src="<%=basePath%>js/jb_register.js"></script>
  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
     <div id="main">
     	<div id="reg_">
	     	<form action="register.action" id="reg_" name="reg_" method="post" onsubmit="return regCheck()">
	     		<table border="0" width="100%" cellspacing="0">
	     			<tr valign="middle" height="75px" align="center" style="background-color: #E4393C; font-size: 35px; font-family: 幼圆;color: #fff;">
	     				<td colspan="4">聚宝用户注册</td>
	     			</tr>
	     			<tr height="15px">
	     				<td colspan="4"><input type="hidden" name="regIp" id="regIp" value="<%=request.getRemoteAddr() %>"/></td>
	     			</tr>
	     			<tr height="45">
	     				<td width="60">&nbsp;</td>
	     				<td width="80">用户名:</td>
	     				<td width="195"><input type="text" id="uname" name="uname" class="inputys_" onchange="return checkName()"/></td>
	     				<td><label id="label1" class="labelys_">*</label></td>
	     			</tr>
	     			<tr height="45">
	     				<td>&nbsp;</td>
	     				<td>密码:</td>
	     				<td><input type="password" id="pwd" name="pwd" class="inputys_" onchange="return isCheck()"/></td>
	     				<td><label id="label2" class="labelys_">*</label></td>
	     			</tr>
	     			<tr height="45">
	     				<td>&nbsp;</td>
	     				<td>确认密码:</td>
	     				<td><input type="password" id="confirm_pwd" name="confirm_pwd" class="inputys_" onchange="return isCheck()"/></td>
	     				<td><label id="label3" class="labelys_">*</label></td>
	     			</tr>
	     			<tr height="45">
	     				<td>&nbsp;</td>
	     				<td>邮箱:</td>
	     				<td>
	     					<input type="text" id="email" name="email" class="inputys_" onchange="return isCheck()"/>
	     					<input type="hidden" id="path" value="<%=basePath%>"/>
	     				</td>
	     				<td><label id="label4" class="labelys_">*</label></td>
	     			</tr>
	     			<tr height="45" align="center">
	     				<td>&nbsp;</td>
	     				<td>&nbsp;</td>
	     				<td>
	     					<input type="submit" value="提交"/>&nbsp;
	     					<input type="reset"/>
	     				</td>
	     				<td>&nbsp;<font color="red" id="meg"><s:property value="#result"/></font></td>
	     			</tr>
	     		</table>
	     	</form>
     	</div>
     </div>
 	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
