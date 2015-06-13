<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/top.css">
	<script type="text/javascript" src="./admin/files/js/top.js"></script>

  </head>
  
  <body bgColor='#ffffff'>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" background="./admin/files/images/topbg.jpg">
	  <tr>
	    <td width='20%' height="60"><img src="./admin/files/images/logo.jpg"/></td>
	    <td width='80%' align="right" valign="bottom">
	    	<table width="750" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	      <td align="right" height="26" style="padding-right:10px;line-height:26px;font-size: 13px; color: #ffffff;">
	        	您好：<span class="username"><font style="font-size: 15px">${jbname }</font></span>，欢迎使用聚宝后台管理系统！
	        	[<label class="underline_"><a href="./jb_index.jsp" target="_blank">前台主页</a></label>]
	        	[<label class="underline_"><a href="searchUserById!searchUserById.action?id=${jbuser.uid}" target="right">修改密码</a></label>]
	        	[<label class="underline_"><a href="adminQuit.action" target="_top">注销退出</a></label>]&nbsp;
	      </td>
	      </tr>
	      <tr>
	        <td align="right" height="34" class="rmain">
			<dl id="tpa">
			<dd class='img'><a href="javascript:ChangeMenu(-1);"><img vspace="5" src="./admin/files/images/arrl.gif" border="0" width="5" height="8" alt="缩小左框架"  title="缩小左框架" /></a></dd>
			<dd class='img'><a href="javascript:ChangeMenu(0);"><img vspace="3" src="./admin/files/images/arrfc.gif" border="0" width="12" height="12" alt="显示/隐藏左框架" title="显示/隐藏左框架" /></a></dd>
			<dd class='img' style="margin-right:10px;"><a href="javascript:ChangeMenu(1);"><img vspace="5" src="./admin/files/images/arrr.gif" border="0" width="5" height="8" alt="增大左框架" title="增大左框架" /></a></dd>
			<dd><div class='itemsel' id='item1' onMouseMove="mv(this,'move',1);" onMouseOut="mv(this,'o',1);"><a href="./admin/main.jsp" onclick="changeSel(1)" target="right">主菜单</a></div></dd>
			<dd><div class='item' id='item8' onMouseMove="mv(this,'m',8);" onMouseOut="mv(this,'o',8);"><a href="./admin/addUser.jsp" onclick="changeSel(8)" target="right">添加用户</a></div></dd>
			<dd><div class='item' id='item2' onMouseMove="mv(this,'m',2);" onMouseOut="mv(this,'o',2);"><a href="./admin/goodspup.jsp" onclick="changeSel(2)" target="right">商品发布</a></div></dd>
			<dd><div class='item' id='item4' onMouseMove="mv(this,'m',4);" onMouseOut="mv(this,'o',4);"><a href="manageAllGoods!manageAllGoods.action?pageNow=1&&condition=all" onclick="changeSel(4)" target="right">在售商品</a></div></dd>
			<dd><div class='item' id='item5' onMouseMove="mv(this,'m',5);" onMouseOut="mv(this,'o',5);"><a href="getStorageGoodsByPage!getStorageGoodsByPage.action?pageNow=1" onclick="changeSel(5)" target="right">商品仓库</a></div></dd>
			<dd><div class='item' id='item9' onMouseMove="mv(this,'m',9);" onMouseOut="mv(this,'o',9);"><a href="./admin/main.jsp" onclick="changeSel(9)" target="right">后台主页</a></div></dd>
			</dl>
			</td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</body>
</html>
