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
    <title>收货地址管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_myorders.css">
	<link rel="stylesheet" type="text/css" href="./css/jb_myAddress.css">
	<script type="text/javascript" src="./js/area.js"></script>
	<script type="text/javascript" src="./js/jb_myAddress.js"></script>
	<style type="">
		.ys01{
			border: 1px solid #aaaaaa;
			height: 22px;
			width:180px;
		}
	</style>

  </head>
  
  <body>
    <div id="bd">
	    <div id="title">收货地址管理</div>
	    <div id="table_orders">
	    	<table border="1" frame="box" rules="all" width="987" cellspacing="0" cellpadding="5">
	    		<tr>
	    			<td colspan="4"><font size="4" face="微软雅黑">我的地址</font></td>
	    		</tr>
	    		<s:iterator value="#list_address" var="ads" status="st">
	    			<tr align="center">
		    			<td width="100"><s:property value="#st.count"/></td>
		    			<td align="left">
		    				<font style="font-size: 14px;">
		    					<s:property value="#ads.province"/><s:property value="#ads.city"/><s:property value="#ads.county"/><s:property value="#ads.street"/>
		    					&nbsp;
		    					<s:property value="#ads.receiver"/>
		    					收
		    					&nbsp;
		    					<s:property value="#ads.tel"/>
		    				</font>
		    			</td>
		    			<td width="100" align="center">
		    				<s:if test="#ads.flag==1">
		    					<font style="font-weight: bold;">默认地址</font>
		    				</s:if>
		    				<s:else>
		    					<a href="setDefaultAddress!setDefaultAddress.action?aid=<s:property value='#ads.aid'/>">设为默认</a>
		    				</s:else>
		    			</td>
		    			<td width="100" align="center">
		    				<a href="delAddress!delAddress.action?aid=<s:property value='#ads.aid'/>"  onclick="return del_confim();">删除</a>
		    			</td>
		    		</tr>
	    		</s:iterator>
	    	</table>
	    	
	    	<form action="addAddress.action" method="post">
	    	<div class="info">
		    	<table border="0" width="987" cellspacing="0" cellpadding="4" style="margin-top: 15px;">
		    		<tr>
		    			<td colspan="5"><font size="4" face="微软雅黑">添加新地址</font></td>
		    		</tr>
		    		<tr align="center" height="25">
		    			<td width="150">省/市/县:</td>
		    			<td align="left" width="100"><select id="s_province" name="province"></select></td>
		    			<td align="left" width="100"> <select id="s_city" name="city" ></select></td>
		    			<td align="left" colspan="2"><select id="s_county" name="county"></select></td>
		    		</tr>
		    		<tr align="center" height="25">
		    			<td width="150">街道/门号：</td>
		    			<td align="left" colspan="4"><input type="text" class="ys01" name="street"/></td>
		    		</tr>
		    		<tr align="center" height="25">
		    			<td width="150">收货人：</td>
		    			<td align="left" colspan="4"><input type="text" class="ys01" name="receiver"/></td>
		    		</tr>
		    		<tr align="center" height="25">
		    			<td width="150">手机号：</td>
		    			<td align="left" colspan="4"><input type="text" class="ys01" name="tel"/></td>
		    		</tr>
		    		
	    			<script type="text/javascript">_init_area();</script>
	    			<script type="text/javascript">
						var Gid  = document.getElementById ;
						var showArea = function(){
							Gid('show').innerHTML = "<h3>" + Gid('s_province').value + " - " + 
													Gid('s_city').value + " - " + 
													Gid('s_county').value + "</h3>"
						}
						Gid('s_county').setAttribute('onchange','showArea()');
					</script>
		    		
		    		<tr align="center" height="25">
		    			<td width="150" align="right"><input type="submit" value="确认添加"/></td>
		    			<td align="left" colspan="1">
		    				&nbsp;<input type="reset" value="清空重填"/>
		    				<font style="font-size: 14px;color: red"><s:property value="addressAddInfo"/></font>
		    			</td>
		    			<td align="left" colspan="3">&nbsp;
		    				<label style="color: red; font-size: 14px;">
		    					<s:property value="#request.meg"/>
	    					</label>
		    			</td>
		    		</tr>
		    	</table>
	    	</div>
	    	</form>
	    </div>
    </div>
  </body>
</html>
