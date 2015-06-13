<%@ page language="java" import="com.jb.pojo.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<base href="<%=basePath%>">
    <title>商品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_goodsdetails.css">
  	<script type="text/javascript" src="js/jb_goodsdetails.js"></script>
  	<script type="text/javascript" src="js/jb_goodsDiscuss.js"></script>
  	<script type="text/javascript">
  		 function meg(){
			var m = document.getElementById("addInfo").value;
			if(null!=m&&""!=m){
			alert("恭喜您，成功加入购物车！");
			}
		}
		
		function clearMeg(){
			var a = document.getElementById("addInfo");
			a.value = "";
		}
  	</script>
  	</head>
  
  <body onload="meg();" onunload="clearMeg()">
	 <%@include file="./content/jb_head.jsp" %>
	 <div id="main">
		 	<div id="top">
		 		<div id="left">
		 			<s:generator separator="," val="#session.goods.img" id="image"></s:generator>
		 	 		<s:iterator value="#attr.image" var="mm" status="st" >
		 	 			<s:if test="#st.isFirst()">
		 	 				<img src="<s:property value="mm"/>" width="280" height="275"/>
		 	 			</s:if>
		 	 		</s:iterator>
		 		</div>
		 		<div id="right">
			 		<table border="0" width="100%" height="290" cellpadding="3" cellspacing="0">
                                <tr>
                                     <td height="25" colspan="3" bgcolor="#E9E9E9">商家信息</td>   
                                </tr> 
                                <tr>
                                     <td height="130" colspan="2" align="center" valign="middle"><img src="./images/tx.jpg"  width="148" height="136"></td>   
                                </tr>
                                <tr>
                                     <td height="15" width="70">名称：</td> 
                                     <td colspan="2">郭世杰</td>  
                                </tr>
                                <tr>
                                     <td height="15">tel：</td> 
                                     <td height="">18734915338</td>  
                                </tr>
                                <tr>
                                     <td height="15">Email：</td> 
                                     <td height="">guoshijie_hi@yeah.net</td>  
                                </tr>
                          </table>
		 		</div>
		 		<div id="center_">
				 		<table border="0" width="630" height="285">
	                            <tr>
	                                   <td height="30" colspan="3"><font size="4" style="font-weight: bold;"><s:property value="#session.goods.gname"/></font></td>   
	                            </tr>
	                            <tr>
	                                   <td height="25" width="90">配送方式:</td>
	                                   <td align="left"  colspan="2">快递、EMS</td>
	                            </tr>
	                            <tr>
	                                   <td height="25" width="90">价  格:</td>
	                                   <td align="left" width="440" colspan="2"><font color=red size=5 face=黑体>￥<s:property value="#session.goods.sprice"/></font></td>
	                            </tr>
	                            <tr>
	                                   <td height="25" width="90">上架时间:</td>
	                                   <td align="left" colspan="2"><s:property value="#session.goods.modifyTime"/></td>
	                            </tr>
	                            <tr>
	                                   <td height="25" width="90">产品类型:</td>
	                                   <td align="left" colspan="2"><s:property value="#session.goods.category.name"/></td>
	                            </tr>
	                            <tr>
	                                  <td height="25" width="90">是否包邮:</td>
	                                  <td align="left" colspan="2">
	                                  	<s:if test='#session.goods.noPostage=="是"'>
	                                  		包邮
	                                  	</s:if>
	                                  	<s:else>不包邮</s:else>
	                                  </td>
	                            </tr>
	                            <tr>
	                                   <td height="25" width="90">地址:</td>
	                                   <td align="left" colspan="2">
	                                   		天津
	                                   </td>
	                            </tr>
	                            <tr>
	                                   <td height="35" width="90" align="center"><a href="buyNow!buyNow.action?gid=<s:property value="#session.goods.gid"/>">立即购买</a></td>
	                                   <td width="210" align="center">
	                                   		<a href="addGoodsToCart!addGoodsToCart.action?gid=<s:property value='#session.goods.gid'/>" >加入购物车</a>
	                                   		<input type="hidden" value="<s:property value='#request.addCartSuccess'/>" id="addInfo">
	                                   		<s:if test="#isCollectGoods==false">
	                                   			<a href="collectGoods!execute.action?gid=<s:property value='#session.goods.gid'/>">收藏商品</a>&nbsp;&nbsp;
	                                   		</s:if>
	                                   		<s:else>
	                                   			<span style="margin-left: 10px;color: gray;">已收藏</span>
	                                   		</s:else>
	                                   </td>
	                                   <td align="left" style="font-size: 14px;color: #555555;">
	                                   		收藏<s:property value="#userCollectNum"/>次
	                                   		(库存<s:property value="#session.goods.gnum"/>件)<font color="red">${meg }</font>
	                                   </td>
	                            </tr>
		                </table>
		 		</div>
		 	</div>
		 	<div id="bottom">
				 	<table border="0" width="1198" cellspacing="0">
                          <tr height="30">
                                     <td bgcolor="#E9E9E9">产品详细信息</td>
                          </tr>
  
                          <tr>
                                    <td>
	                                    <s:generator separator="," val="#session.goods.img" id="images"></s:generator>
							 	 		<s:iterator value="#attr.images" var="mm" status="st" >
							 	 				<a href="<s:property value="mm"/>"><img src="<s:property value="mm"/>" width="280" height="275"/></a>
							 	 		</s:iterator>
                                    </td>
                          </tr>
                    </table>
		 	</div>
		 	<div id="bottom_01">
		 		<div id="bottom_01_left">
		 			<div class="bottom_01_left_title">相关推荐</div>
	   	 			<s:iterator value="#application.zhitongche" var="tui">
	   	 				<div class="bottom_02_details_01_01">
	   	 					<div class="bottom_02_details_img_01">
	   	 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#tui.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#tui.img" id="image"></s:generator>
						 	 		<s:iterator value="#attr.image" var="mm" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm"/>" width="190" height="170"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
	   	 					</div>
	   	 					<div class="bottom_02_goods_name_01">
	   	 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#tui.gid'/>&pageNow=1">
   	 								<s:property value="#tui.gname"/>
   	 							</a>
	   	 					</div>
	   	 					<div class="bottom_02_price_01">￥<font  size="4" face="幼圆" color="red"><s:property value="#tui.sprice"/></font></div>
	   	 				</div>
	   	 			</s:iterator>
		 		</div>
		 		
		 		<div id="bottom_01_right">
		 			<div class="bottom_01_left_title">商品评价</div>
		 			<div id="estimate">
		 				<span class="estimate_01"><input type="radio" name="pingjia" id="pingjia_01" checked="checked" onclick="getDiscussByPage('0',<s:property value='#session.goods.gid'/>);"><label for="pingjia_01">全部评价(<s:property value="#session.goods.discusses.size"/>)</label></span>
		 				<span class="estimate_01"><input type="radio" name="pingjia" id="pingjia_02" onclick="getDiscussByPage('1',<s:property value='#session.goods.gid'/>);"><label for="pingjia_02">好评</label></span>
		 				<span class="estimate_01"><input type="radio" name="pingjia" id="pingjia_03" onclick="getDiscussByPage('2',<s:property value='#session.goods.gid'/>);"><label for="pingjia_03">中评</label></span>
		 				<span class="estimate_01"><input type="radio" name="pingjia" id="pingjia_04" onclick="getDiscussByPage('3',<s:property value='#session.goods.gid'/>);"><label for="pingjia_04">差评</label></span>
		 				<input type="hidden" id="path" value="<%=basePath%>"/>
		 			</div>
		 			<div id="estimate_details">
		 					<iframe id="right_01" name="right" marginwidth=0 marginheight=0 width=100% height="100%" src="jb_goodsDiscuss.jsp" frameborder=0 scrolling="no" onload="Javascript:SetWinHeight(this)"></iframe>
		 			</div>
		 			
		 		</div>
		 	</div>
	 </div>
	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
