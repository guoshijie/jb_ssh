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
    
    <title>添加商品类型</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	
	<script type='text/javascript' src='/jb_ssh/dwr/interface/categoryAction.js'></script>
    <script type='text/javascript' src='/jb_ssh/dwr/engine.js'></script>
    <script type='text/javascript' src='/jb_ssh/dwr/util.js'></script>
	
	<script type="text/javascript" src="files/js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="./admin/files/js/addType.js"></script>
  </head>
  
  <body>
    <!--  内容列表   -->
	<form action="addType.action" name="form2" method="post" id="form2" >
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#EEF4EA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="2" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">添&nbsp;加&nbsp;类&nbsp;型</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="25%" align="right">上一级类型：</td>
		<td>
			<select id="info" name="info">
				<option value="">一级标题</option>
				<s:iterator var="t" value="#type">
					<s:if test="%{#t.level==1}">
					<option value="<s:property value='#t.id'/>" onclick="showTwo(<s:property value='#t.id'/>)">
						<s:property value="#t.name"/>
						&nbsp;<s:property value="#t.level"/>
					</option>
					</s:if>
				</s:iterator>
			</select>
			
			<select id="info2" name="info2" onmouseup="showThree()" style="width: 150px;">
				<option value="">二级标题</option>
			</select>
			
			<select id="info3" name="info3" style="width: 150px;">
				<option value="">三级标题</option>
			</select>
			
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">添加的类型：</td>
		<td>
			<input type="text" name="name" id="name"/>
			<label id="label2" class="labelys_">*</label>
		</td>
	</tr>
	
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" class="coolbg" value="提交">
			<input type="reset" class="coolbg" value="重置"/>
		</td>
	</tr>
	
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red"><s:property value="#meg"/></td>
	</tr>
	
	<!-- <tr bgcolor="#EEF4EA" style="font-size: 16px;">
		<td colspan="2" >
			<a href="getType.action">更新上一级商品类型</a>&nbsp;&nbsp;
			<a href="getTypeInfo.action">查询商品树状结构</a>	
		</td>
	</tr> -->
	</table>
	
	</form>
  </body>
</html>
