<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查找用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<script type="text/javascript" src="./admin/files/js/userManager.js"></script>

  </head>
  
  <body leftmargin="8" topmargin="8">
	 <%
  	 	String meg = (String)request.getAttribute("result");
	 	if(null == meg){
	 		meg = "";
	 	}
  	 %>
	<!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
	<tr>
	 <td height="26">
	  <table width="98%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <td align="center">
	  	  	<a href="getUserByPage!getUserByPage.action?pageNow=1&condition=allUser" class="coolbg np" >所有用户</a>&nbsp;
		    <a href="./admin/addUser.jsp" class="coolbg np" >添加用户</a>&nbsp;
		    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
	 </td>
	 </tr>
	</table>
	</td>
	</tr>
	</table>
	  
	<!--  内容列表   -->
	<form action="getUserByPage.action" name="form2" method="get" id="form2" onsubmit="return regCheck()">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="2" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">查&nbsp;找&nbsp;用&nbsp;户</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="45%" align="right">用户名：</td>
		<td><input type="text" name="uname" id="uname" onchange="return isCheck()"/>
			<input type="hidden" name="condition" id="condition" value="searchUserByName"/>
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" class="coolbg" value="查找">
			<input type="reset" class="coolbg" value="重置"/>
		</td>
	</tr>
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red"><%=meg %></td>
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
