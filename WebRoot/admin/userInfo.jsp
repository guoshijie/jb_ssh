<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<script type="text/javascript" src="./admin/files/js/userManager.js"></script>

  </head>
  
  <body leftmargin="8" topmargin="8">

	<!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
	<tr>
	 <td height="26">
	  <table width="98%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <td align="center">
	  		<a href="getUserByPage!getUserByPage.action?pageNow=1&condition=allUser" class="coolbg np" >所有用户</a>&nbsp;
		    <a href="./admin/addUser.jsp" class="coolbg np" >添加用户</a>&nbsp;
		    <a href="./admin/searchUser.jsp" class="coolbg np" >查询用户</a>&nbsp;
		    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
	 </td>
	 </tr>
	</table>
	</td>
	</tr>
	</table>
	  
	<!--  内容列表   -->
	<form action="modifyUser.action" name="userInfo" method="post" id="userInfo" onsubmit="return regCheck()">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="2" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">用&nbsp;户&nbsp;信&nbsp;息</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="45%" align="right">用户名：</td>
		<td><input type="text" name="uname" id="uname" value="<s:property value='#user.uname'/>" onchange="return isCheck()"/>
			<input type="hidden" name="uid" id="uid" value="<s:property value='#user.uid'/>" onchange="return isCheck()"/>
			<input type="hidden" name="regTime" id="regTime" value="<s:property value='#user.regTime'/>"/>
			<input type="hidden" name="level_id" id="level_id" value="<s:property value='#user.level.id'/>"/>
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">密　码：</td>
		<td>
			<input type="password" name="pwd" id="pwd" onchange="return isCheck()" value="<s:property value='#user.pwd'/>"/>
			<label id="label2" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">确认密码：</td>
		<td><input type="password" name="confirm_pwd" id="confirm_pwd" onchange="return isCheck()"/>
			<label id="label3" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">邮　箱：</td>
		<td><input type="text" name="email" id="email" onchange="return isCheck()" value="<s:property value='#user.email'/>"/>
			<label id="label4" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">手机号：</td>
		<td><input type="text" name="phone" id="phone" onchange="return isCheck()" value="<s:property value='#user.phone'/>"/>
			<label id="label4" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">是否管理员：</td>
		<td>
			<s:if test='#user.admin=="是" '>
				<input type="radio" name="admin" value="是"  checked="checked"/>是
				<input type="radio" name="admin" value="否" />否
			</s:if>
			<s:else>
				<input type="radio" name="admin" value="是"/>是
				<input type="radio" name="admin" value="否" checked="checked"/>否
			</s:else>
			
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">是否客服：</td>
		<td>
			<s:if test='#user.service=="是" '>
				<input type="radio" name="service" value="是"  checked="checked"/>是
				<input type="radio" name="service" value="否" />否
			</s:if>
			<s:else>
				<input type="radio" name="service" value="是"/>是
				<input type="radio" name="service" value="否" checked="checked"/>否
			</s:else>
			<input type="hidden" name="regIp" id="regIp" value="<%=request.getRemoteAddr() %>"/>
		</td>
	</tr>
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" class="coolbg" value="确认修改">
		</td>
	</tr>
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red">${result }</td>
	</tr>
	</table>
	
	</form>
	
	<!--  搜索表单  -->
	<!-- <form name='form3' action='' method='get'>
	<input type='hidden' name='dopost' value='' />
	<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
	  <tr bgcolor='#EEF4EA'>
	    <td background='./admin/files/images/wbg.gif' align='center'>
	      <table border='0' cellpadding='0' cellspacing='0'>
	        <tr>
	          <td width='90' align='center'>搜索条件：</td>
	          <td width='160'>
	          <select name='cid' style='width:150'>
	          <option value='0'>选择类型...</option>
	          	<option value='1'>名称</option>
	          </select>
	        </td>
	        <td width='70'>
	          关键字：
	        </td>
	        <td width='160'>
	          	<input type='text' name='keyword' value='' style='width:150px' />
	        </td>
	        <td width='110'>
	    		<select name='orderby' style='width:80px'>
	            <option value='id'>排序...</option>
	            <option value='pubdate'>发布时间</option>
	      	</select>
	        </td>
	        <td>
	          <input name="imageField" type="image" src="./admin/files/images/search.gif" width="45" height="20" border="0" class="np" />
	        </td>
	       </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	</form> -->
</body>
</html>
