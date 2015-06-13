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
    
    <title>进货</title>
    
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
	<form action="adminBuyGoods.action" name="updateGoods" method="post" id="goodspub" enctype="multipart/form-data">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="5" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">采&nbsp;购&nbsp;商&nbsp;品</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="13%" align="right">商品名称：</td>
		<td colspan="4">
			<input type="hidden" value="#request.admin_goodsInfo.gid">
			<s:property value='#request.admin_goodsInfo.gname'/>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">商品价格：</td>
		<td colspan="4">
			<s:property value='#request.admin_goodsInfo.sprice'/>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">库存数量：</td>
		<td colspan="4">
			<s:property value='#request.admin_goodsInfo.gnum'/>
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
				包邮
			</s:if>
			<s:else>
				不包邮
			</s:else>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">所在地区：</td>
		<td colspan="4">
			   <label><s:property value='#request.admin_goodsInfo.area'/></label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" align="center">
		<td align="right">商品图片：</td>
		<td width="20%" align="left">
			<s:generator separator="," val="#request.admin_goodsInfo.img" id="images"></s:generator>
 	 		<s:iterator value="#attr.images" var="mm" status="st" >
 	 				<a href="<s:property value="mm"/>"><img src="<s:property value="mm"/>" width="100" height="100"/></a>
 	 		</s:iterator>
		</td>
	</tr>
	
	<tr bgcolor="#FFFFFF" >
		<td align="right">采购数量：</td>
		<td colspan="4">
			   <input type="text" name="buyNum"/>
		</td>
	</tr>
	
	<tr bgcolor="#FAFAF1" align="center">
		<td height="28" colspan="13">
			&nbsp;
			<input type="submit" value="确认采购">&nbsp;&nbsp;
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
