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
    
    <title>用户详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_userJb.css">
	<script type="text/javascript" src="./admin/files/js/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="./admin/files/js/ImagePreview.js"></script>
	<script type="text/javascript" src="./js/QuickUpload.js"></script>
	<script type="text/javascript" src="./js/jb_userDetails.js"></script>
  </head>
  
  <body>
    <div id="main">
    	<div id="title">个人详情</div>
    	<div id="content" style="padding-top: 30px;height: 376px;">
    			<form action="updateUserInfo.action" enctype="multipart/form-data" method="post">
				<table width="100%" border="0" style="" cellpadding="5px;">
					<tr height="35">
						<td width="15%">&nbsp;</td>
						<td width="13%">用户名：</td>
						<td width="16%"><input id="uname" name="uname" readonly="readonly" value="<s:property value='#request.curUser.uname'/>" onchange="return checkName()"/></td>
						<td width="15%"><label id="label1">&nbsp;</label></td>
						<td rowspan="4" align="center" >
							<img id="idImg" border="1" width="180" height="180"/><br>
						</td>
						<td rowspan="6" width="30%">&nbsp;</td>
					</tr>
					<tr height="35">
						<td>&nbsp;</td>
						<td>密码：</td>
						<td><input type="password" id="pwd" name="pwd" value="<s:property value='#request.curUser.pwd'/>" onchange="return isCheck()"/></td>
						<td><label id="label2">&nbsp;</label></td>
					</tr>
					<tr height="35">
						<td>&nbsp;</td>
						<td>确认密码：</td>
						<td><input type="password" id="confirm_pwd" name="confirm_pwd" value="" onchange="return isCheck()"/></td>
						<td><label id="label3">&nbsp;</label></td>
					</tr>
					<tr height="35">
						<td>&nbsp;</td>
						<td>邮箱：</td>
						<td><input name="email" id="email" value="<s:property value='#request.curUser.email' />" onchange="return isCheck()"/></td>
						<td>
							<label id="label4">&nbsp;</label>
							<input type="hidden" id="path" value="<%=basePath%>"/>
						</td>
					</tr>
					<tr height="35">
						<td>&nbsp;</td>
						<td>手机号：</td>
						<td><input name="phone" value="<s:property value='#request.curUser.phone'/>" onchange="return isCheck()"/></td>
						<td><label id="label5">&nbsp;</label></td>
						<td align="center"><input id="idFile" name="upload" type="file" /></td>
					</tr>
					<tr height="35">
						<td>&nbsp;<input type="hidden" name="regIp" id="regIp" value="<%=request.getRemoteAddr() %>"/></td>
						<td colspan="3" align="center">
							<input type="submit" value="确认修改">&nbsp;&nbsp;
							<a href="<%=basePath%>jb_userJb.jsp">返回</a>
							<label style="color: red;font-size: 14px;"><s:property value="#request.meg"/></label>
						</td>
					</tr>
				</table>
				</form>
    	</div>
    </div>
    <script>
		var ip = new ImagePreview( $$("idFile"), $$("idImg"), {
			maxWidth: 180, maxHeight: 180, action: "ImagePreview.ashx"
		});
		ip.img.src = ImagePreview.TRANSPARENT;
		ip.file.onchange = function(){
		 ip.preview();
	   };
	</script>
  </body>
</html>
