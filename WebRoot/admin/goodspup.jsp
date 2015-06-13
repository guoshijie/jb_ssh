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
    
    <title>商品发布</title>
    
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
	  		<a href="manageAllGoods!manageAllGoods.action?pageNow=1&&condition=all" class="coolbg np" >在售商品</a>&nbsp;
		    <a href="./admin/searchUser.jsp" class="coolbg np" >查询商品</a>&nbsp;
		    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
	 </td>
	 </tr>
	</table>
	</td>
	</tr>
	</table>
	  
	<!--  内容列表   -->
	<form action="addGoods.action" name="goodspub" method="post" id="goodspub" enctype="multipart/form-data">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg" align="center">
		<td height="40" colspan="5" background="./admin/files/images/tbg.gif">&nbsp;<font style="font-size: 20px;font-family: 幼圆; font-weight: bold;">发&nbsp;布&nbsp;商&nbsp;品</font>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td width="13%" align="right">商品名称：</td>
		<td colspan="4"><input type="text" name="gname" id="gname" class="goodspup_" onclick="deleteTheMeg()"/>
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">商品价格：</td>
		<td colspan="4">
			<input type="text" name="sprice" id="sprice" class="goodspup_"/>
			<label id="label2" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">库存数量：</td>
		<td colspan="4"><input type="text" name="gnum" id="gnum" class="goodspup_"/>
			<label id="label3" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">商品类别：</td>
		<td colspan="4">
			<select id="info" name="info" onclick="showTwo()">
				<option value="">一级标题</option>
			</select>
			
			<select id="info2" name="info2" onchange="showThree()" style="width: 150px;">
				<option value="">二级标题</option>
			</select>
			
			<select id="info3" name="categoryId" style="width: 150px;">
				<option value="">三级标题</option>
			</select>
			
		    <label id="label1" class="labelys_">*</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">是否包邮：</td>
		<td colspan="4">
			<input type="radio" name="noPostage" value="是"  id="group3" checked="checked" /><label for="group3">是</label>&nbsp;&nbsp;
			<input type="radio" name="noPostage" value="否"  id="group4"/><label for="group4">否</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">是否团购：</td>
		<td colspan="4">
			<input type="radio" name="groupBuy" value="是"  id="group1"/><label for="group1">是</label>&nbsp;&nbsp;
			<input type="radio" name="groupBuy" value="否"  checked="checked" id="group2"/><label for="group2">否</label>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td align="right">所在地区：</td>
		<td colspan="4">
			<select name="area">
				<option value="北京" selected="selected">北京</option>
				<option value="天津">天津</option>
				<option value="上海">上海</option>
				<option value="广州">广州</option>
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
			<input type="submit" value="确认发布">&nbsp;&nbsp;
			<input type="reset" value="重置表单"/>
		</td>
	</tr>
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="13" align="center" style="color:red"><label id="meg">${result }</label></td>
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
