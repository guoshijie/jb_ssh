<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的团购</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_myorders.css">

  </head>
  
  <body>
    <div id="bd">
	    <div id="title">我的团购</div>
	    <div id="content">
	    	<span class="dai_">待付款(0)</span>
	    	<span class="dai_">待确认收货(0)</span>
	    </div>
	    <div id="table_orders">
	    	<table width="987" border="1" frame="box" rules="all" cellspacing="0">
	    		<tr align="center">
	    			<td width="70"><input type="checkbox" id="select_all">全选</td>
	    			<td width="120">商&nbsp;品&nbsp;编&nbsp;号</td>
	    			<td width="400">商&nbsp;品&nbsp;名&nbsp;称</td>
	    			<td width="70">价&nbsp;格</td>
	    			<td width="100">商&nbsp;品&nbsp;数&nbsp;量</td>
	    			<td width="100">下&nbsp;单&nbsp;日&nbsp;期</td>
	    			<td>操作</td>
	    		</tr>
	    	</table>
	    </div>
    </div>
  </body>
</html>
