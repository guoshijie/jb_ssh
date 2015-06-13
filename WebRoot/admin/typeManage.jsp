<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodstype.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<script type="text/javascript" src="<%=basePath%>js/jb_getType.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8">
  
    <!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td height="26" background="./admin/files/images/newlinebg3.gif">
		  <table width="98%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				  <td align="center">
				  	<a href="getTypeInfo.action" class="coolbg np" >所有类型</a>&nbsp;
				    <a href="getType.action" class="coolbg np" >添加类型</a>&nbsp;
				    <a href="./admin/searchType.jsp" class="coolbg np" >查询类型</a>&nbsp;
				    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
				  </td>
			 </tr>
		</table>
	</td>
	</tr>
	</table>
	
	
	<!--  内容列表   -->
	<form name="form2" action="adminDelUser.action" method="post" onsubmit="return isDel();">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg">
		<td height="24" colspan="14" background="./files/images/tbg.gif">&nbsp;类型树&nbsp;</td>
	</tr>
	
	<div>
		<ul>
			<s:iterator value="#type" var="c">
				<s:if test="%{#c.level==1}">
					<li onclick="findChild('<s:property value="#c.id"/>');"><s:property value="#c.name"/></li>
				</s:if>
				
			</s:iterator>
		</ul>
	</div>
	
	<tr bgcolor="#FAFAF1">
	<td height="28" colspan="14">
		&nbsp;
		<a href="javascript:selAll()" class="coolbg">全选</a>
		<a href="javascript:noSelAll()" class="coolbg">取消</a>
		<input type="submit" value="删除" class="coolbg">
	</td>
	</tr>
	
	
	</table>
	
	</form>
  </body>
</html>
