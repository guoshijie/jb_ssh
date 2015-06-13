<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户管理</title>
    
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
	<form name="form2" action="adminDelUser.action" method="post" onsubmit="return isDel();">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg">
		<td height="24" colspan="14">&nbsp;用户列表&nbsp;</td>
	</tr>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<td width="2%">ID</td>
		<td width="3%">全选</td>
		<td width="4%">用户名</td>
		<td width="6%">密码</td>
		<td width="11%">电子邮箱</td>
		<td width="11%">注册时间</td>
		<td width="6%">注册IP</td>
		<td width="7%">手机号</td>
		<td width="5%">帐户余额</td>
		<td width="4%">等级</td>
		<td width="6%">是否管理员</td>
		<td width="5%">是否客服</td>
		<td width="8%">操作</td>
	</tr>
	
	<s:iterator var="user" value="#page.list" status="stat">
		<tr align='center' <s:if test="#stat.count%2 == 0">bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
		onMouseOut="javascript:this.bgColor='#FFFFFF';" </s:if> 
		<s:if test="#stat.count%2 != 0">bgcolor="#F7F1F0" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
		onMouseOut="javascript:this.bgColor='#F7F1F0';" </s:if> 
		height="22" >
			<td><s:property value="#stat.count"/></td>
			<td><input name="id" type="checkbox" value="<s:property value="#user.uid"/>" class="np" id="<s:property value="#user.uid"/>"></td>
			<td align="left"><label for="<s:property value="#user.uid"/>"><s:property value="#user.uname"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.pwd"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.email"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.regTime"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.regIp"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.phone"/></label></td>
			<td><label for="<s:property value="#user.uid"/>">￥<s:property value="#user.money"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.level.level"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.admin"/></label></td>
			<td><label for="<s:property value="#user.uid"/>"><s:property value="#user.service"/></label></td>
			<td style="text-decoration: underline"><a href="searchUserById!searchUserById.action?id=<s:property value='#user.uid'/>">修改</a></td>
		</tr>
	</s:iterator>
	
	<tr bgcolor="#FAFAF1">
	<td height="28" colspan="14">
		&nbsp;
		<a href="javascript:selAll()" class="coolbg">全选</a>
		<a href="javascript:noSelAll()" class="coolbg">取消</a>
		<input type="submit" value="删除" class="coolbg">
	</td>
	</tr>
	
	<!-- 翻页代码begin -->
	<tr bgcolor="#EEF4EA" class="pageInfo">
		<td height="36" colspan="14" align="center">
				<s:if test="#request.page.hasPre==true">
						<a href="getUserByPage!getUserByPage.action?pageNow=1&condition=<s:property value="#condition"/>">首页</a>
						<a href="getUserByPage!getUserByPage.action?pageNow=${page.pageNow-1 }&condition=<s:property value="#condition"/>">上一页</a>
				</s:if>
				<s:else>
						首页&nbsp;上一页
				</s:else>
				
				<s:iterator begin="1" end="#page.pageCount" var="num">
						<s:if test="#page.pageNow != #num">
		    					<span class="pageOther"><a href="
		    							<s:url action="getUserByPage" method="getUserByPage">
											<s:param name="pageNow" value="#num"></s:param>
											<s:param name="condition" value="#condition"></s:param>
										</s:url>
		    					"><s:property value="#num"/></a></span>
		    			</s:if>
		    			<s:else>
		    					<span class="pageNow"><s:property value="#num"/></span>
		    			</s:else>
				</s:iterator>
			
				<s:if test="#request.page.hasNext==true">
						<a href="getUserByPage!getUserByPage.action?pageNow=${page.pageNow+1 }&condition=<s:property value="#condition"/>">下一页</a>
						<a href="getUserByPage!getUserByPage.action?pageNow=${page.pageCount }&condition=<s:property value="#condition"/>">尾页</a>
				</s:if>
				<s:else>
					下一页&nbsp;尾页
				</s:else>
			  共${page.pageNow }/${page.pageCount }页(${page.pageAllSize }人)	
			  
			  &nbsp;&nbsp;
		    	跳转至
		    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1();">
		    			<s:iterator var = "number" begin="1" end="#page.pageCount">
				    			<s:if test="#page.pageNow != #number">
				    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
				    			</s:if>
				    			<s:else>
				    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
				    			</s:else>
				    	</s:iterator>
		    	</select>
		    	页
			<input type="hidden" id="condition" value="<s:property value="#condition"/>"/>
		</td>
	</tr>
	<!-- 翻页代码end -->
	
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
