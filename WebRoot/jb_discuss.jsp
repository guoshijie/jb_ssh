<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评价商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="css/jb_discuss.css" type="text/css"></link>
  </head>
  
  <body>
    	<div id="title">评价商品</div>
    	<div id="discussGoods">
    		<div id="itemInfo">
    			<table id="itemTbl" border="1px" frame="box" rules="all" width="100%">
    				<tr align="center">
    					<td>商&nbsp;品&nbsp;详&nbsp;情</td>
    					<td>单&nbsp;价</td>
    					<td>数&nbsp;量</td>
    					<td>合&nbsp;价</td>
    				</tr>
    				<tr align="center">
    					<td align="left">
    							<table style="border: none;">
				    					<tr align="center">
				    						<td>
				    							<%-- 商品图片begin--%>
							    				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#session.discussItem.goods.gid'/>" target="_blank">
						   	 						<s:generator separator="," val="#session.discussItem.goods.img" id="image"></s:generator>
										 	 		<s:iterator value="#attr.image" var="mm" status="st" >
										 	 			<s:if test="#st.isFirst()">
										 	 				<img src="<s:property value="mm"/>" width="70" height="65"/>
										 	 			</s:if>
										 	 		</s:iterator>
					   	 						</a>
					   	 						<%-- 商品图片end--%>
				    						</td>
				    						<td>
				    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#session.discussItem.goods.gid'/>" target="_blank">
				    								<label class="goodsName"><s:property value="#session.discussItem.goods.gname"/></label>
				    							</a>
				    						</td>
				    					</tr>
				    				</table>
    					</td>
    					<td>
    							￥<s:property value="#session.discussItem.goods.sprice"/>
    					</td>
    					<td>
    							<s:property value="#session.discussItem.num"/>
    					</td>
    					<td>
    							￥<s:property value="#session.discussItem.amount"/>
    					</td>
    				</tr>
    			</table>
    		</div>
    		<div id="discussContent">
    			<form action="discussGoods.action" method="post">
    			<table border="0" width="500px"  >
    				<tr height="30px">
    					<td width="20%">
    						<input type="radio" name="grade" id="dis1" value="好评" checked="checked"/><label for="dis1">好评</label>
    					</td>
    					<td width="20%">
    						<input type="radio" name="grade" id="dis2" value="中评"/><label for="dis2">中评</label>
    					</td>
    					<td width="20%">
    						<input type="radio" name="grade" id="dis3" value="差评"/><label for="dis3">差评</label>
    					</td>
    					<td>&nbsp;</td>
    				</tr>
    				<tr>
    					<td colspan="4">
    						<textarea rows="7" cols="60" name="details"></textarea>
    						<input type="hidden" value="<s:property value='#session.discussItem.id'/>" name="itemId"/>
    					</td>
    				</tr>
    				<tr height="40px">
    					<td align="right" colspan="4">
    						<input type="submit" value="立即评论"/>&nbsp;
    						<input type="reset" value="重置"/>
    					</td>
    				</tr>
    			</table>
    			</form>
    		</div>
    	</div>
  </body>
</html>
