<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>聚宝用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_login.css">
	<script type="text/javascript" src="./js/jb_login.js"></script>
  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
     <div id="main" style="text-align: center;">
			<div id="loginDiv" >
			   <form id="form1" name="form1" action="login.action" method="post" onsubmit="return check();" >
					   <table width="439" height="250" border="0" cellspacing="0" cellpadding="0">
					      <tr>
					         <td height="30" colspan="3" align="right" valign="top" bgcolor="#E4393C" class="close"></td>
					      </tr>
					      <tr>
					         <td height="45" colspan="3" align="center" valign="middle" bgcolor="#E4393C" class="logn"><font face="幼圆" size="6" color="#ffffff">欢 迎 登 录</font></td>
					      </tr>
					      <tr>
					         <td height="20" colspan="3" align="right" valign="top" class="close"></td>
					      </tr>
					      <tr>
					         <td width="37%" height="55" align="right" valign="middle"> 用户名：</td>
					         <td width="37%" align="left" valign="middle"><input type="text" name="uname" id="uname" class="ys01" onchange="return isNull()" value=""/></td>
					     	 <td><label id="label_01">&nbsp;</label></td>
					     </tr>
					     <tr>
					         <td height="40" align="right">密码：&nbsp;&nbsp;</td>
					         <td height="50" align="left"><input type="password" name="pwd" id="pwd" class="ys01" onchange="return isNull()" value=""/></td>
					         <td><label id="label_02">&nbsp;</label></td>
					     </tr>
						     <tr>
						         <td height="40" colspan="3" align="center">
						             <table width="300" border="0" cellspacing="0" cellpadding="0">
						                <tr>
						                   <td width="155" align="right"><input type="submit" name="submit" id="submit" value="登录" /></td>
						                   <td width="32">&nbsp;</td>
						                  <td width="113" align="left"><input type="reset" name="reset" id="reset" value="重置" /></td>
						               </tr>
						             </table></td>
						      </tr>
					    <tr height="30">
					    <td align="center">&nbsp;<font color="red"><s:property value="#request.login"/></font></td>
					    <td colspan="2" align="right" class="zhuce" valign="bottom"><a href="jb_register.jsp">注册新帐号</a>|<a href="#">忘记密码</a>&nbsp;</td>
					  </tr>
					</table>
			</form>
			</div>
     </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
