<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_cart.css">
    <script type="text/javascript" src="./js/jb_cart.js"></script>
  </head>
   
  <body>
	 <%@include file="./content/jb_head.jsp" %>
     <div id="main">
	    <div id=title> 	
	     	<div class="my_title" style="font-family: 幼圆;border-bottom: 2px solid #dd0000;">我的购物车</div>
	     	<div class="my_title" style="font-family: 幼圆">填写定单核对信息</div>
	     	<div class="my_title" style="font-family: 幼圆">购买成功</div>
	    </div>
	    
     	<div id="my_cart">
     		<div id="cart_title">
     			<span id="select">全选</span>
     			<span id="goods">商品</span>
     			<span id="price">价格</span>
     			<span id="num_">数量</span>
     			<span id="have_goods">价格</span>
     			<span id="operate">操作</span>
     		</div>
     		<s:iterator value="#session.jb_cart" var="map" status="st">
     			<div class="cart_content">
	     			<span  class="select_one"><input type="checkbox" name="sel_cart_goodsArray" value="<s:property value='#map.value.goods.gid'/>" checked="checked">&nbsp;</span>
	     			<span  class="goods_info">
	     				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#map.value.goods.gid'/>" target="_blank">
   	 						<s:generator separator="," val="#map.value.goods.img" id="image"></s:generator>
				 	 		<s:iterator value="#attr.image" var="mm" status="st" >
				 	 			<s:if test="#st.isFirst()">
				 	 				<img src="<s:property value="mm"/>" width="80" height="76" align="top" />
				 	 			</s:if>
				 	 		</s:iterator>
 						</a>
 						&nbsp;<label class="cartGoodsName">
				 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#map.value.goods.gid'/>" target="_blank">
				 							<s:property value="#map.value.goods.gname"/>
				 						</a>
			 						</label>
	     			</span>
	     			<span  class="goods_price">￥<label id="price<s:property value='#map.value.goods.gid'/>" ><s:property value="#map.value.goods.sprice"/></label></span>
	     			<span  class="goods_num">
	     				<button class="plusBtn" onclick="return plus('-','<s:property value='#map.value.goods.gid'/>');">-</button>&nbsp;
     					<input type="text"  name="goodsNum" class="goods_num_s" value="<s:property value="#map.value.num"/>" id="<s:property value='#map.value.goods.gid'/>" onchange="getSum(<s:property value='#map.value.goods.gid'/>);">&nbsp;
     					<button class="plusBtn" onclick="return plus('+','<s:property value='#map.value.goods.gid'/>');">+</button>
     				</span>
	     			<span  class="goods_have">
	     				￥<label id="lbl<s:property value='#map.value.goods.gid'/>"><s:property value="#map.value.amount"/></label>
	     				<input type="hidden" name="hiddenItemAmt" id="hiddenItemAmt<s:property value='#map.value.goods.gid'/>" value="<s:property value="#map.value.amount"/>"/>
	     			</span>
	     			<span  class="goods_oprate"><a href="delGoodsFormCart!delGoodsFromCart.action?gid=<s:property value='#map.value.goods.gid'/>">删除</a></span>
	     		</div>
     		</s:iterator>
     		<div id="cart_foot">
     			<div id="cart_foot_01" style="float: none">
     				<div class="cart_foot_01_01">
     					<button onclick="selAllGoodsInCart()">全选</button>
     					<button onclick="reverseSelAllGoodsInCart()">反选</button>
     					<button onclick="noSelAllGoodsInCart();">全不选</button>
     					<button onclick="confirm_delGoods()">删除选中商品</button>
     				</div>
     				<div class="cart_foot_01_03">总计：￥<label id="sumPrice_01"><s:property value="#session.sumPrice"/></label></div>
     				<div  class="cart_foot_01_02"><font color="red"><label id="sumCount"><s:property value="#session.sumCount"/></label></font>件商品</div>
     			</div>
     			<div id="cart_foot_02" style="text-align: right; margin-right: 15px;">
     				<input type="hidden" id="path" value="<%=basePath%>"/>
     				返现：&nbsp;&nbsp;-￥0.00
     			</div>
     		</div>
     		<div id="cart_foot1">
     			总计（包含运费）：<font color="red" face="幼圆" size="5">￥<label id="sumPrice_02"><s:property value="#session.sumPrice"/></label></font>
     		</div>
     	</div>
     	<div id="cart_button">
     		<a href="jb_index.jsp"><span id="continue"></span></a>
     		<span id="go_pay">
     			<a href="javascript:commitForm();">下 单</a>
     		</span>
     	</div>
     	
     </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
