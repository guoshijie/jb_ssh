<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css" />
	<link rel="stylesheet" type="text/css" href="./admin/files/css/main.css" />

  </head>
  
  <body leftmargin="8" topmargin='8'>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div style='float:left;font-size: 16px;'> <img height="14" src="./admin/files/images/book1.gif" width="20" />&nbsp;欢迎使用聚宝商城后台管理系统！ </div>
      <div style='float:right;padding-right:8px;'>
        <!--  //保留接口  -->
      </div></td>
  </tr>
  <tr>
    <td height="1" background="./admin/files/images/sp_bg.gif" style='padding:0px'></td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="./admin/files/images/wbg.gif" bgcolor="#EEF4EA" class='title'><span>消息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>&nbsp;</td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;">
  <tr>
    <td colspan="2" background="./admin/files/images/wbg.gif" bgcolor="#EEF4EA" class='title'>
    	<div style='float:left'><span>快捷操作</span></div>
    	<div style='float:right;padding-right:10px;'></div>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" colspan="2" align="center" valign="bottom"><table width="100%" border="0" cellspacing="1" cellpadding="1">
        <tr>
          <td width="15%" height="31" align="center"><img src="./admin/files/images/qc.gif" width="90" height="30" /></td>
          <td width="85%" valign="bottom"><div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/addnews.gif' width='16' height='16' /></div>
              <div class='txt'><a href='getUserByPage!getUserByPage.action?condition=allUser'><u>用户列表</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/menuarrow.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath%>admin/addNews.jsp'><u>发布通告</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='newsManage!newsManage.action?pageNow=1'><u>通告管理</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/file_dir.gif' width='16' height='16' /></div>
              <div class='txt'><a href='./admin/goodspup.jsp'><u>商品发布</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/part-index.gif' width='16' height='16' /></div>
              <div class='txt'><a href='manageAllGoods!manageAllGoods.action?pageNow=1&&condition=all'><u>在售商品管理</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='./admin/files/images/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='getStorageGoodsByPage!getStorageGoodsByPage.action?pageNow=1'><u>商品仓库</u></a></div>
            </div></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
  <tr bgcolor="#EEF4EA">
    <td colspan="2" background="./admin/files/images/wbg.gif" class='title'><span>系统基本信息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" bgcolor="#FFFFFF">您的级别：</td>
    <td width="75%" bgcolor="#FFFFFF">管理员</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>软件版本信息：</td>
    <td>JB1.0_2014_UTF8</td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
  <tr bgcolor="#EEF4EA">
    <td colspan="2" background="./admin/files/images/wbg.gif" class='title'><span>使用帮助</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="32">官方网站：</td>
    <td><a href="http://127.0.0.1:8080/jb_ssh" target="_blank"><u>http://127.0.0.1:8080/jb_ssh</u></a></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" height="32">意见箱：</td>
    <td width="75%"><a href="mailto:steve_hi@163.com"><u>steve_hi@163.com</u></a></td>
  </tr>
</table>
</body>
</html>
