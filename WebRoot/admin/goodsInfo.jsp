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
    
    <title>商品详情修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<link rel="stylesheet" type="text/css" href="./admin/files/css/goodspup.css">
	
	<script type='text/javascript' src='/jb_ssh/dwr/interface/categoryAction.js'></script>
    <script type='text/javascript' src='/jb_ssh/dwr/engine.js'></script>
    <script type='text/javascript' src='/jb_ssh/dwr/util.js'></script>
	
	<script type="text/javascript" src="./admin/files/js/userManager.js"></script>
	<script type="text/javascript" src="./admin/files/js/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="./admin/files/js/QuickUpload.js"></script>
	<script type="text/javascript" src="./admin/files/js/ImagePreview.js"></script>
	<script type="text/javascript" src="./admin/files/js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="./admin/files/js/goodspup.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#addMore").click(function(){
				var br = $( "<br>");
				var input = $("<input type='file' name='upload'/>");
				var btn = $("<input type='button' value='删除' class='buttons_'/>");
				
				$("#goodsImgs").append(input).append(btn).append(br);
				
				btn.click(function(){
					br.remove();
					input.remove();
					btn.remove();
				});
			});
		});
		
	</script>
  </head>
  
 <body leftmargin="8" topmargin="8">
	<!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
	<tr>
	 <td height="26">
	  <table width="98%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <td align="center">
	  		<a href="manageAllGoods!manageAllGoods.action?pageNow=1&condition=all" class="coolbg np" >在售商品</a>&nbsp;
		    <a href="./admin/searchUser.jsp" class="coolbg np" >查询商品</a>&nbsp;
		    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
	 </td>
	 </tr>
	</table>
	</td>
	</tr>
	</table>
	  
	<!--  内容列表   -->
	<form action="adminUpdateGoods.action" name="updateGoods" method="post" id="goodspub" enctype="multipart/form-data">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="5" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">修&nbsp;改&nbsp;商&nbsp;品</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="13%" align="right">商品名称：</td>
		<td colspan="4"><input type="text" name="gname" id="gname" value="<s:property value='#request.admin_goodsInfo.gname'/>" class="goodspup_" onclick="deleteTheMeg()"/>
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">商品价格：</td>
		<td colspan="4">
			<input type="text" name="sprice" id="sprice" value="<s:property value='#request.admin_goodsInfo.sprice'/>"  class="goodspup_"/>
			<label id="label2" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">库存数量：</td>
		<td colspan="4"><input type="text" name="gnum" id="gnum" value="<s:property value='#request.admin_goodsInfo.gnum'/>" class="goodspup_"/>
			<label id="label3" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">商品类别：</td>
		<td colspan="4">
		    <label><s:property value='#request.admin_goodsInfo.category.name'/></label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">是否包邮：</td>
		<td colspan="4">
			<s:if test='#request.admin_goodsInfo.noPostage=="是" '>
				<input type="radio" name="noPostage" value="是"  id="group3" checked="checked" /><label for="group3">是</label>&nbsp;&nbsp;
				<input type="radio" name="noPostage" value="否"  id="group4"/><label for="group4">否</label>
			</s:if>
			<s:else>
				<input type="radio" name="noPostage" value="是"  id="group3"/><label for="group3">是</label>&nbsp;&nbsp;
				<input type="radio" name="noPostage" value="否"  id="group4" checked="checked" /><label for="group4">否</label>
			</s:else>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">所在地区：</td>
		<td colspan="4">
			<select name="area">
				<option value="北京" <s:if test='#request.admin_goodsInfo.area=="北京"' >selected="selected"</s:if>>北京</option>
				<option value="天津" <s:if test='#request.admin_goodsInfo.area=="天津"' >selected="selected"</s:if>>天津</option>
				<option value="上海" <s:if test='#request.admin_goodsInfo.area=="上海"' >selected="selected"</s:if>>上海</option>
				<option value="广州" <s:if test='#request.admin_goodsInfo.area=="广州"' >selected="selected"</s:if>>广州</option>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" align="center">
		<td align="right">商品图片：</td>
		<td width="20%" align="left">
			<div id="goodsImgs">
				<input name="upload" type="file" /><br>
			</div>
			<input id="addMore" type="button" value="上传更多" class="buttons_">
		</td>
	</tr>
	
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" value="确认修改">&nbsp;&nbsp;
			<label style="color: red;"><s:property value="#request.meg"/></label>
		</td>
	</tr>
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red"><label id="meg">${result }</label></td>
	</tr>
	</table>
	
	</form>
	
</body>
</html>
