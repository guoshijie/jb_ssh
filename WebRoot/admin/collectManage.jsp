<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收藏管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<link rel="stylesheet" href="./admin/files/css/orderManage.css" type="text/css"></link>
	<script type="text/javascript" src="./admin/files/js/orderManage.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8" bottommargin="8">
    	<!--  快速转换位置按钮  -->
		<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#fff" align="center">
		<tr>
			<td width="30%">
				<label style="font-size: 18px; font-family: Microsoft Yahei;">用户收藏管理</label>
			</td>
			 <td height="26" align="left">
			 	<form action="adminGetAllCollectByPage.action" method="get">
				  <table width="98%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						  <td align="left">
						  		请输入要查询收藏的用户名：
						  		<input type="text" name="collect_keywords" id="collect_keywords"/>&nbsp;
						  		<input type="submit" value="查询订单">
						  </td>
					 </tr>
				</table>
				</form>
			</td>
		</tr>
		</table>
		
		<div style="margin: 0 auto; width: 98%;margin-top: 10px;">
			关键词：
			<s:if test="#session.collectManage_keywords==null">
				无
			</s:if>
			<s:else>
				<div style="background-color: #eee; padding: 3px 5px;display: inline; width: auto;">
					<a href="delCollectKeywords!delCollectKeywords.action">
						<s:property value="#session.collectManage_keywords"/>&nbsp;×
					</a>
				</div>
			</s:else>
		</div>
		
		<s:if test="#session.collectManageByAdmin!=null">
					<!--  内容列表   -->
					<form name="form2" action="delOrdersPatch.action" method="post" onsubmit="return isDel();">
					
					<table width="98%" border="1" frame="border" rules="all" cellspacing="0" align="center" style="margin-top: 10px;">
						    		
			    		<tr align="center">
			    			<td>全选</td>
			    			<td width="70">编号</td>
			    			<td width="580">商&nbsp;品&nbsp;信&nbsp;息</td>
			    			<td width="80">单价</td>
			    			<td width="150">收藏日期</td>
			    			<td width="">所属用户</td>
			    		</tr>
					
					<s:iterator value="#session.collectManageByAdmin.list" status="stat" var="collect">
						    			
			    				<tr align="center">
			    					<td width="5%" align="center"><input type="checkbox" name="id" value="<s:property value="#collect.cid"/>"/></td>
					    			<td width="70"><s:property value="#stat.count"/></td>
					    			<td width="400" align="left">
					    				<table>
					    					<tr>
					    						<td>
					    							<%-- 商品图片begin--%>
								    				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#collect.goods.gid'/>" target="_blank">
							   	 						<s:generator separator="," val="#collect.goods.img" id="image"></s:generator>
											 	 		<s:iterator value="#attr.image" var="mm" status="st" >
											 	 			<s:if test="#st.isFirst()">
											 	 				<img src="<s:property value="mm"/>" width="70" height="65"/>
											 	 			</s:if>
											 	 		</s:iterator>
						   	 						</a>
						   	 						<%-- 商品图片end--%>
					    						</td>
					    						<td>
					    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#collect.goods.gid'/>" target="_blank">
					    								<label class="goodsName" style="font-size: 14px;line-height: 25px;"><s:property value="#collect.goods.gname"/></label>
					    							</a>
					    						</td>
					    					</tr>
					    				</table>
					    			</td>
					    			<td width="80">￥<s:property value="#collect.goods.sprice"/></td>
					    			<td width="80" rowspan="<s:property value="#collect.itemses.size"/>"><s:property value="#collect.ctime"/></td>
					    			<td width="80" rowspan="<s:property value="#collect.itemses.size"/>"><s:property value="#collect.user.uname"/></td>
					    		</tr>
					    	</s:iterator>
					</table>
					
					<div id="selOrDel">
		    			<a href="javascript:selAll()" class="coolbg">全选</a>
						<a href="javascript:noSelAll()" class="coolbg">取消</a>
						<input type="submit" value="删除" class="coolbg">
		    		</div>
					    		
					<!-- 分页页码begin -->
					    <div id="pageNum">
					    		<s:if test="#session.collectManageByAdmin.hasPre==true">
										<a href="adminGetAllCollectByPage!adminGetAllCollectByPage.action?pageNow=1&condition=allOrder">首页</a>&nbsp;&nbsp;
										<a href="adminGetAllCollectByPage!adminGetAllCollectByPage.action?pageNow=<s:property value='#session.collectManageByAdmin.pageNow-1'/>&condition=allOrder">上一页</a>&nbsp;
								</s:if>
								<s:else>
										首页&nbsp;&nbsp;上一页&nbsp;
								</s:else>
					    	
					    		<s:iterator begin="1" end="#session.collectManageByAdmin.pageCount" var="num">
					    				<s:if test="#session.collectManageByAdmin.pageNow != #num">
						    					<span class="pageOther"><a href="
						    							<s:url action="adminGetAllCollectByPage" method="adminGetAllCollectByPage">
															<s:param name="pageNow" value="#num"></s:param>
															<s:param name="condition">allOrder</s:param>
														</s:url>
						    					"><s:property value="#num"/></a></span>
						    			</s:if>
						    			<s:else>
						    					<span class="pageNow"><s:property value="#num"/></span>
						    			</s:else>
					    		</s:iterator>
					    		
					    		<s:if test="#session.collectManageByAdmin.hasNext==true">
										&nbsp;<a href="adminGetAllCollectByPage!adminGetAllCollectByPage.action?pageNow=<s:property value='#session.collectManageByAdmin.pageNow+1'/>&condition=allOrder">下一页</a>&nbsp;
										<a href="adminGetAllCollectByPage!adminGetAllCollectByPage.action?pageNow=<s:property value='#session.collectManageByAdmin.pageCount'/>&condition=allOrder">尾页</a>
								</s:if>
								<s:else>
										&nbsp;下一页&nbsp;&nbsp;尾页
								</s:else>
								共<s:property value="#session.collectManageByAdmin.pageNow"/>/<s:property value="#session.collectManageByAdmin.pageCount"/>页&nbsp;(<s:property value="#session.collectManageByAdmin.pageAllSize"/>个)
								
								&nbsp;&nbsp;
						    	跳转至
						    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage2();">
						    			<s:iterator var = "number" begin="1" end="#session.collectManageByAdmin.pageCount">
								    			<s:if test="#session.collectManageByAdmin.pageNow != #number">
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
					
					</form>
		</s:if>
		<s:else>
			<div style="text-align: center;">对不起，暂无符合要求的收藏</div>
		</s:else>
		
		
  </body>
</html>
