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
    
    <title>添加通告</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
  </head>
  
  <body leftmargin="8" topmargin="8">
  		<!--  快速转换位置按钮  -->
		<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
		<tr>
		 <td height="26">
			  <table width="98%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					  <td align="center">
					  	<a href="newsManage!newsManage.action?pageNow=1" class="coolbg np" >所有通告</a>&nbsp;
					    <a href="./admin/addNews.jsp" class="coolbg np" >添加通告</a>&nbsp;
					    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
					  </td>
				 </tr>
			</table>
		</td>
		</tr>
		</table>
  
  
    <!--  内容列表   -->
	<form action="addNews.action" name="form2" method="post" id="form2" >
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="2" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">添&nbsp;加&nbsp;通&nbsp;告</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right" width="42%">内容：</td>
		<td>
			<textarea rows="2" cols="25" name="title" id="title"></textarea>
			<label id="label2" class="labelys_" style="color: red">*</label>
		</td>
	</tr>
	
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" class="coolbg" value="提交">
			<input type="reset" class="coolbg" value="重置"/>
			<span style="color: red;"><s:property value="#request.meg"/></span>
		</td>
	</tr>
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red"><s:property value="#meg"/></td>
	</tr>
	</table>
	
	</form>
  </body>
</html>
