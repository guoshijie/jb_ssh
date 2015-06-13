<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>填写并核对定单信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_cart_02.css">
	<script type="text/javascript">
		function commitForm(){
			window.form1.submit();
		}
	</script>
  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
	 <form action="placeAnOrder.action" method="get" name="form1">
 	 <div id="main">
	 	 <div id="title"> 	
		     	<div class="my_title" style="font-family: 幼圆;">我的购物车</div>
		     	<div class="my_title" style="font-family: 幼圆;border-bottom: 2px solid #dd0000;">填写定单核对信息</div>
		     	<div class="my_title" style="font-family: 幼圆">购买成功</div>
	     </div>
	     <div id="consignee_">
	     	<div class="consignee_title">收货人信息</div>
	     	<div id="consignee_info">
	     		
	     		<table border="0"  width="900" cellspacing="0" cellpadding="5">
	    		<tr>
	    			<td colspan="4"><font size="4" face="微软雅黑">我的地址</font></td>
	    		</tr>
	    		<s:iterator value="#session.list_address" var="ads" status="st">
	    			<tr align="center" >
	    				<s:if test="#ads.flag==1">
	    					<td width="5%"><input type="radio" name="address_order" value="<s:property value='#ads.aid'/>" checked="checked" /></td>
	    				</s:if>
		    			<s:else>
		    				<td width="5%"><input type="radio" name="address_order" value="<s:property value='#ads.aid'/>"/></td>
		    			</s:else>
		    			<td width="3%"><s:property value="#st.count"/>.</td>
		    			<td align="left" width="70%">
		    				<font style="font-size: 14px;">
		    					<s:property value="#ads.province"/><s:property value="#ads.city"/><s:property value="#ads.county"/><s:property value="#ads.street"/>
		    					&nbsp;
		    					<s:property value="#ads.receiver"/>
		    					收
		    					&nbsp;
		    					<s:property value="#ads.tel"/>
		    				</font>
		    			</td>
		    			
		    			<s:if test="#ads.flag==1">
	    					<td align="left"><font style="font-weight: bold; font-size: 14">默认</font></td>
	    				</s:if>
		    			
		    		</tr>
	    		</s:iterator>
	    	</table>
	     	
	     	</div>
	     </div>
	     <div id="delivery_pay">
	     		<div class="consignee_title">支付及配送信息</div>
	     		<div id="delivery_pay_info">
	     			<input type="radio" name="pay" id="online_pay" checked="checked"><label for="online_pay">在线支付</label>&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="later_pay"><label for="later_pay">货到付款</label><br><br>
	     			<input type="radio" name="expressage" id="expressage_01"><label for="expressage_01">快递送货</label>&nbsp;&nbsp;&nbsp;<input type="radio" name="expressage" id="expressage_02"  checked="checked"><label for="expressage_02">上门取货</label>
	     		</div>
	     </div>
	     <div id="fapiao_">
	     		<div class="consignee_title">发票</div>
	     		<div id="fapiao_01">
	     			<input type="radio" name="fapiao_have_name" id="fapiao_have" checked="checked"><label for="fapiao_have">有</label>&nbsp;&nbsp;&nbsp;<input type="radio" name="fapiao_have_name" id="fapiao_no" checked="checked"><label for="fapiao_no">无</label><br><br>
	     		</div>
	     </div>
	     <div id="goods_qindan">
	     	<div class="consignee_title">商品清单</div>
	     	<div class="goods_qindan_info">
	     		<div id="my_cart">
		     		<div id="cart_title">
		     			<span id="select">编号</span>
		     			<span id="goods">商品</span>
		     			<span id="price">单价</span>
		     			<span id="have_goods">是否有货</span>
		     			<span id="num_">数量</span>
		     			<span id="operate">总价</span>
		     		</div>
		     		<s:iterator value="#session.jb_newCart" status="st" var="orderMap">
			     		<div class="cart_content">
			     			<span  class="select_one"><s:property value="#st.count"/></span>
			     			<span  class="goods_info">
		     				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#orderMap.value.goods.gid'/>" target="_blank">
	   	 						<s:generator separator="," val="#orderMap.value.goods.img" id="image"></s:generator>
					 	 		<s:iterator value="#attr.image" var="mm" status="st" >
					 	 			<s:if test="#st.isFirst()">
					 	 				<img src="<s:property value="mm"/>" width="80" height="76" align="top" />
					 	 			</s:if>
					 	 		</s:iterator>
	 						</a>
	 						&nbsp;<label class="cartGoodsName"><s:property value="#orderMap.value.goods.gname"/></label>
			     			</span>
			     			<span  class="goods_price">￥<s:property value="#orderMap.value.goods.sprice"/></span>
			     			<span  class="goods_have">有</span>
			     			<span  class="goods_num"><font size="5" face="幼圆"  color="#000000"><s:property value="#orderMap.value.num"/></font></span>
			     			<span  class="goods_oprate">￥<s:property value="#orderMap.value.amount"/></span>
			     		</div>
		     		</s:iterator>
		     		
		     		<div id="cart_foot">
		     			<div id="cart_foot_01" style="float: none">
		     				<div class="cart_foot_01_01"></div>
		     				<div class="cart_foot_01_03"><span style="float: left;">总计：</span><span style="float: right;font-weight:bold;">￥<s:property value="#session.sumPrice2"/></span></div>
		     				<div  class="cart_foot_01_02"><font color="red"><s:property value="#session.sumCount2"/></font>件商品</div>
		     			</div>
		     			<div id="cart_foot_02" style="text-align: right; margin-right: 15px;">
		     				返现：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-￥0.00
		     			</div>
		     		</div>
		     		<div id="cart_foot1">
		     			总计（含运费）：<font color="red" face="幼圆" size="5">￥<s:property value="#session.sumPrice2"/></font>
		     		</div>
	     		</div>
	     		<div id="button_sb">
			     	<div id="button_submit">
			     		<a href="javascript:commitForm();">结 账</a>
			     	</div>
		     	</div>
		     
	     	</div>
 	 	 </div>
 	 </div>	</form>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
