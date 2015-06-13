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
    
    <title>定单回收站</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_myorders.css">
	<link rel="stylesheet" href="css/jb_ordersRecycled.css" type="text/css"></link>
	<script type="text/javascript" src="js/jb_ordersRecycled.js"></script>
  </head>
  
  <body>
    <div id="bd">
	    <div id="title">
	    	定单回收站
	    	<label style="color: gray;font-size: 14px; margin-left: 40px; font-weight: normal;">未评价商品(<s:property value="#session.numNoDiscussItems"/>)</label>
	    </div>
	   <form action="delRelOrders.action" method="get">
	   <s:if test="#session.userOrdersRecycle.size>0">
	   			
	   			 <div id="table_orders">
				    	<s:iterator value="#session.userOrdersRecycle" status="st" var="order">
				    		<table width="987" border="1" frame="border" rules="all" cellspacing="0">
					    		<tr>
					    			<td colspan="7" height="20px">
					    				<table width="100%" style="background-color: #F3F3F3;margin: 0; font-size: 14px;">
					    					<tr>
					    						<td width="5%" align="center"><input type="checkbox" name="oid" value="<s:property value='#order.oid'/>"/></td>
					    						<td width="35%">订单编号：<s:property value="#order.num"/></td>
					    						<td>成交时间：<s:property value="#order.otime"/></td>
					    					</tr>
					    				</table>
					    			</td>
					    		</tr>
					    		<tr align="center">
					    			<td width="70">编号</td>
					    			<td width="530">商&nbsp;品&nbsp;信&nbsp;息</td>
					    			<td width="80">单价</td>
					    			<td width="50">数量</td>
					    			<td width="70">合&nbsp;价</td>
					    			<td width="80">订单总价</td>
					    			<td>操作</td>
					    		</tr>
					    		
					    		<s:iterator value="#order.itemses" var="item" status="stat">
					    			<s:if test="#stat.isFirst()">
					    				<tr align="center">
							    			<td width="70"><s:property value="#stat.count"/></td>
							    			<td width="400" align="left">
							    				<table>
							    					<tr>
							    						<td>
							    							<%-- 商品图片begin--%>
										    				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#item.goods.gid'/>" target="_blank">
									   	 						<s:generator separator="," val="#item.goods.img" id="image"></s:generator>
													 	 		<s:iterator value="#attr.image" var="mm" status="st" >
													 	 			<s:if test="#st.isFirst()">
													 	 				<img src="<s:property value="mm"/>" width="70" height="65"/>
													 	 			</s:if>
													 	 		</s:iterator>
								   	 						</a>
								   	 						<%-- 商品图片end--%>
							    						</td>
							    						<td>
							    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#item.goods.gid'/>" target="_blank">
							    								<label class="goodsName" style="font-size: 14px;line-height: 25px;"><s:property value="#item.goods.gname"/></label>
							    							</a>
							    						</td>
							    					</tr>
							    				</table>
							    			</td>
							    			<td width="80">￥<s:property value="#item.goods.sprice"/></td>
							    			<td width="50"><s:property value="#item.num"/></td>
							    			<td width="70">￥<s:property value="#item.amount"/></td>
							    			<td width="80" rowspan="<s:property value="#order.itemses.size"/>">￥<s:property value="#order.total"/></td>
							    			<td rowspan="<s:property value="#order.itemses.size"/>">
							    				<a href="putawayOrders!putawayOrders.action?oid=<s:property value='#order.oid'/>" >恢复</a>
							    			</td>
							    		</tr>
					    			</s:if>
					    			<s:else>
					    				<tr align="center">
							    			<td width="70"><s:property value="#stat.count"/></td>
							    			<td width="400" align="left">
							    				<table>
							    					<tr>
							    						<td>
							    							<%-- 商品图片begin--%>
										    				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#item.goods.gid'/>" target="_blank">
									   	 						<s:generator separator="," val="#item.goods.img" id="image"></s:generator>
													 	 		<s:iterator value="#attr.image" var="mm" status="st" >
													 	 			<s:if test="#st.isFirst()">
													 	 				<img src="<s:property value="mm"/>" width="70" height="65"/>
													 	 			</s:if>
													 	 		</s:iterator>
								   	 						</a>
								   	 						<%-- 商品图片end--%>
							    						</td>
							    						<td>
							    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#item.goods.gid'/>" target="_blank">
							    								<s:property value="#item.goods.gname"/>
							    							</a>
							    						</td>
							    					</tr>
							    				</table>
							    			</td>
							    			<td width="80">￥<s:property value="#item.goods.sprice"/></td>
							    			<td width="50"><s:property value="#item.num"/></td>
							    			<td width="70">￥<s:property value="#item.amount"/></td>
							    		</tr>
					    			</s:else>
					    		</s:iterator>
					    	</table>
				    	</s:iterator>
				    </div>
				    
				    <div id="selOrDel">
			   			<input type="button" value="全选" onclick="selAll()">
						<input type="button" value="取消" onclick="noSelAll()">
						<input type="submit" value="彻底删除" class="coolbg">
			   		</div>
			   		
				    <!-- 分页页码begin -->
				    <div id="pageNum">
				    		<s:if test="#session.orderPageRecycle.hasPre==true">
									<a href="ordersRecycle!ordersRecycle.action?pageNow=1">首页</a>
									<a href="ordersRecycle!ordersRecycle.action?pageNow=<s:property value='#session.orderPageRecycle.pageNow-1'/>">上一页</a>
							</s:if>
							<s:else>
									首页&nbsp;上一页
							</s:else>
				    	
				    		<s:iterator begin="1" end="#session.orderPageRecycle.pageCount" var="num">
				    				<s:if test="#session.orderPageRecycle.pageNow != #num">
					    					<span class="pageOther"><a href="
					    							<s:url action="ordersRecycle" method="ordersRecycle">
														<s:param name="pageNow" value="#num"></s:param>
													</s:url>
					    					"><s:property value="#num"/></a></span>
					    			</s:if>
					    			<s:else>
					    					<span class="pageNow"><s:property value="#num"/></span>
					    			</s:else>
				    		</s:iterator>
				    		
				    		<s:if test="#session.orderPageRecycle.hasNext==true">
									<a href="ordersRecycle!ordersRecycle.action?pageNow=<s:property value='#session.orderPageRecycle.pageNow+1'/>">下一页</a>
									<a href="ordersRecycle!ordersRecycle.action?pageNow=<s:property value='#session.orderPageRecycle.pageCount'/>">尾页</a>
							</s:if>
							<s:else>
									下一页&nbsp;尾页
							</s:else>
							共<s:property value="#session.orderPageRecycle.pageNow"/>/<s:property value="#session.orderPageRecycle.pageCount"/>页&nbsp;(<s:property value="#session.orderPageRecycle.pageAllSize"/>个)
							
							&nbsp;&nbsp;
					    	跳转至
					    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1();">
					    			<s:iterator var = "number" begin="1" end="#session.orderPageRecycle.pageCount">
							    			<s:if test="#session.orderPageRecycle.pageNow != #number">
							    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
							    			</s:if>
							    			<s:else>
							    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
							    			</s:else>
							    	</s:iterator>
					    	</select>
					    	页
				    </div>
				    <!-- 分页页码end -->
	   			
	   </s:if>
	   <s:else>
	   			<div style="text-align: center;padding-top: 5px;">暂无定单</div>
	   </s:else>
	   </form>
    </div>
  </body>
</html>
