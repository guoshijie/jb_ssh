<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>聚宝商城后台首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./admin/files/css/base.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="./admin/files/css/index.css"/>
	<script language='javascript'>var curopenItem = '1';</script>
	<script language="javascript" type="text/javascript" src="./admin/files/js/menu.js"></script>
	<script language="javascript" type="text/javascript" src="./admin/files/js/index.js"></script>
  </head>
  
  <body>
   	<div id="main">
   		<div id="top">
   			<jsp:include page="top.jsp"></jsp:include>
   		</div>
   		<div id="bottom">
   			<div id="left">
   				<table width='100%' height="100%" border='0' cellspacing='0' cellpadding='0'>
					  <tr align="center">
					    <td style='padding-left:3px;padding-top:8px' valign="top">
						<!-- Item 1 Strat -->
					      <dl class='bitem'>
					        <dt id="dt1" onclick="down('items1_1','dt1')"><b>用户信息</b></dt>
					        <dd style='display:block' class='sitem' id='items1_1'>
					          <ul class='sitemu'>
					            <li>
					              <div class='items'>
						                <div class='fllct'><a href='getUserByPage!getUserByPage.action?condition=allUser' target='right'>用户信息管理</a></div>
					              </div>
					            </li>
					            <li>
					              <div class='items'>
						                <div class='fllct'><a href='orderManageByAdmin!orderManageByAdmin.action?condition=allOrder' target='right'>用户订单管理</a></div>
					              </div>
					            </li>
					            <!-- <li>
					              <div class='items'>
						                <div class='fllct'><a href='./admin/selectAll.jsp' target='right'>我的团购管理</a></div>
						                <div class='flrct'><a href='./admin/userManager.jsp' target='right'><img src='./admin/files/images/gtk-sadd.png' alt='创建栏目' title='创建栏目'/></a> </div>
					              </div>
					            </li>-->
					            <li>
					              <div class='items'>
						                <div class='fllct'><a href='adminGetAllCollectByPage!adminGetAllCollectByPage.action?condition=allOrder' target='right'>用户收藏管理</a></div>
					              </div>
					            </li> 
					            <!-- <li>
					              <div class='items'>
					                <div class='fllct'><a href='./admin/archives.html' target='right'>订单回收站</a></div>
					                <div class='flrct'> <a href='./admin/archives.html' target='right'><img src='./admin/files/images/gtk-del.png' alt='清空回收站' title='清空回收站'/></a> </div>
					              </div>
					            </li> -->
					          </ul>
					        </dd>
					      </dl>
					      <!-- Item 1 End -->
					      <!-- Item 2 Strat -->
					      <dl class='bitem'>
					        <dt id="dt2" onClick='down("items2_1","dt2")'><b>首页管理</b></dt>
					        <dd style='display:block' class='sitem' id='items2_1'>
					          <ul class='sitemu'>
					          	<li><a href='<%=basePath%>admin/addNews.jsp' target='right'>发布通告</a> </li>
					            <li><a href='newsManage!newsManage.action?pageNow=1' target='right'>通告管理</a></li>
					          </ul>
					        </dd>
					      </dl>
					      <!-- Item 2 End -->
					      <!-- Item 3 Strat -->
					      <dl class='bitem'>
					        <dt id="dt3" onClick='down("items3_1","dt3")'><b>商品管理</b></dt>
					        <dd style='display:block' class='sitem' id='items3_1'>
					          <ul class='sitemu'>
					          	<!--  <li><a href='./admin/typeManage.jsp' target='right'>商品类型</a> </li>-->
					          	<li><a href='getType.action' target='right'>添加类型</a> </li>
					            <li><a href='./admin/goodspup.jsp' target='right'>商品发布</a></li>
					          	<li><a href='manageAllGoods!manageAllGoods.action?pageNow=1&&condition=all' target='right'>在售商品</a> </li>
					            <li>
					              <div class='items'>
					                <div class='fllct'><a href='getStorageGoodsByPage!getStorageGoodsByPage.action?pageNow=1' target='right'>商品仓库</a></div>
					                <div class='flrct'><a href='./admin/archives.html' target='right'></a> </div>
					              </div>
					            </li>
					            <li><a href='./admin/showChartPie.jsp' target='right'>销量统计</a></li>
					          </ul>
					        </dd>
					      </dl>
					      <!-- Item 3 End -->
					      
					      <!-- Item 4 Strat -->
					      <dl class='bitem'>
					        <dt id="dt4" onClick='down("items4_1","dt4")'><b>商家管理</b></dt>
					        <dd style='display:block' class='sitem' id='items4_1'>
					          <ul class='sitemu'>
					          	<li><a href='./admin/nofinish.jsp' target='right'>注册商家</a> </li>
					            <li><a href='./admin/nofinish.jsp' target='right'>商家管理</a></li>
					            <li>
					              <div class='items'>
					                <div class='fllct'><a href='./admin/nofinish.jsp' target='right'>商家查询</a></div>
					                <div class='flrct'><a href='./admin/nofinish.jsp' target='right'></a> </div>
					              </div>
					            </li>
					          </ul>
					        </dd>
					      </dl>
					      <!-- Item 4 End -->
						  </td>
					  </tr>
					</table>
   			</div>
   			<div id="right">
   				 <iframe name="right" marginwidth=0 marginheight=0 width=100% height=100% src="./admin/main.jsp" hspace="0" vspace="0" frameborder=0 scrolling="no" onload="Javascript:SetWinHeight(this)"></iframe> 
   			</div>
   		</div>
   	</div>
  </body>
</html>
