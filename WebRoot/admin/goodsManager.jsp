<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>商品管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	
	<script type='text/javascript' src='/jb_ssh/dwr/interface/categoryAction.js'></script>
  	<script type='text/javascript' src='/jb_ssh/dwr/engine.js'></script>
	<script type='text/javascript' src='/jb_ssh/dwr/util.js'></script>
	
	<script type="text/javascript" src="./admin/files/js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="./admin/files/js/goodsManager.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8">
	
	<!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
	<tr>
	 <td height="26">
		  <table width="98%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				  <td align="center">
				  	<a href="manageAllGoods!manageAllGoods.action?pageNow=1&condition=all" class="coolbg np" >在售商品</a>&nbsp;
				  	<a href="getStorageGoodsByPage!getStorageGoodsByPage.action?pageNow=1" class="coolbg np" >商品仓库</a>&nbsp;
				    <a href="./admin/goodspup.jsp" class="coolbg np" >商品发布</a>&nbsp;
				    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
				  </td>
			 </tr>
		</table>
	</td>
	</tr>
	</table>
	
	<s:if test="#session.allGoodsByPage.list==null">
		<div style="text-align: center;">暂 无</div>
	</s:if>
	<s:else>
		<!--  内容列表   -->
		<form name="form2" action="removeOffShelves.action" method="post" onsubmit="return isDel();">
		
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr class="gsjtitlebg">
			<td height="24" colspan="14">&nbsp;在售商品列表&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="2%">ID</td>
			<td width="2%">全选</td>
			<td width="26%">商品详情</td>
			<td width="4%">售价</td>
			<td width="3%">库存</td>
			<td width="3%">已售(件)</td>
			<td width="7%">修改时间</td>
			<td width="4%">类型</td>
			<td width="3%">是否包邮</td>
			<td width="3%">地区</td>
			<td width="6%">操作</td>
		</tr>
		
		<s:iterator var="goods" value="#session.allGoodsByPage.list" status="stat">
			<tr align='center' <s:if test="#stat.count%2 == 0">bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
			onMouseOut="javascript:this.bgColor='#FFFFFF';" </s:if> 
			<s:if test="#stat.count%2 != 0">bgcolor="#fff" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
			onMouseOut="javascript:this.bgColor='#fff';" </s:if> 
			height="22" >
				<td><s:property value="#stat.count"/></td>
				<td><input name="id" type="checkbox" value="<s:property value="#goods.gid"/>" class="np" id="<s:property value="#goods.gid"/>"></td>
				<td align="left">
						<table style="width: 100%;" border="0">
							<tr>
								<td width="15%" align="center">
									<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.gid'/>&pageNow=1" target="_blank">
		   	 						<s:generator separator="," val="#goods.img" id="image"></s:generator>
							 	 		<s:iterator value="#attr.image" var="mm" status="st" >
							 	 			<s:if test="#st.isFirst()">
							 	 				<img src="<s:property value="mm"/>" width="45" height="45"/>
							 	 			</s:if>
							 	 		</s:iterator>
		   	 						</a>
								</td>
								<td align="left">
									<label for="<s:property value="#goods.gid"/>">
										<s:property value="#goods.gname"/>
									</label>
								</td>
							</tr>
						</table>
				</td>
				<td><label for="<s:property value="#goods.gid"/>">￥<s:property value="#goods.sprice"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.gnum"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.snum"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.modifyTime"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.category.name"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.noPostage"/></label></td>
				<td><label for="<s:property value="#goods.gid"/>"><s:property value="#goods.area"/></label></td>
				<td>
					<a href="buyGoods!adminGetGoodsById.action?gid=<s:property value='#goods.gid'/>" style="text-decoration: underline;">进货</a>&nbsp;
					<a href="adminGetGoodsById!adminGetGoodsById.action?gid=<s:property value='#goods.gid'/>" style="text-decoration: underline;">修改</a>
				</td>
			</tr>
		</s:iterator>
		
		<tr bgcolor="#FAFAF1">
		<td height="28" colspan="14">
			&nbsp;
			<a href="javascript:selAll()" class="coolbg">全选</a>
			<a href="javascript:noSelAll()" class="coolbg">取消</a>
			<input type="submit" value="下架" class="coolbg">
		</td>
		</tr>
		
		<!-- 翻页代码begin -->
		<tr bgcolor="#EEF4EA" class="pageInfo">
			<td height="36" colspan="14" align="center">
					<s:if test="#session.allGoodsByPage.hasPre==true">
							<a href="manageAllGoods!manageAllGoods.action?pageNow=1">首页</a>
							<a href="manageAllGoods!manageAllGoods.action?pageNow=<s:property value="#session.allGoodsByPage.pageNow-1"/>">上一页</a>
					</s:if>
					<s:else>
							首页&nbsp;上一页
					</s:else>
					
					<s:iterator begin="1" end="#session.allGoodsByPage.pageCount" var="num">
							<s:if test="#session.allGoodsByPage.pageNow != #num">
			    					<span class="pageOther"><a href="
			    							<s:url action="manageAllGoods" method="manageAllGoods">
												<s:param name="pageNow" value="#num"></s:param>
											</s:url>
			    					"><s:property value="#num"/></a></span>
			    			</s:if>
			    			<s:else>
			    					<span class="pageNow"><s:property value="#num"/></span>
			    			</s:else>
					</s:iterator>
				
					<s:if test="#session.allGoodsByPage.hasNext==true">
							<a href="manageAllGoods!manageAllGoods.action?pageNow=<s:property value="#session.allGoodsByPage.pageNow+1"/>">下一页</a>
							<a href="manageAllGoods!manageAllGoods.action?pageNow=<s:property value="#session.allGoodsByPage.pageCount"/>">尾页</a>
					</s:if>
					<s:else>
						下一页&nbsp;尾页
					</s:else>
				  共<s:property value="#session.allGoodsByPage.pageNow"/>/<s:property value="#session.allGoodsByPage.pageCount"/>页(<s:property value="#session.allGoodsByPage.pageAllSize"/>件商品)	
				  
				  &nbsp;&nbsp;
			    	跳转至
			    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1();">
			    			<s:iterator var = "number" begin="1" end="#session.allGoodsByPage.pageCount">
					    			<s:if test="#session.allGoodsByPage.pageNow != #number">
					    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
					    			</s:if>
					    			<s:else>
					    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
					    			</s:else>
					    	</s:iterator>
			    	</select>
			    	页
			</td>
		</tr>
		<!-- 翻页代码end -->
		
		</table>
		</form>
	</s:else>
	
	<!--  搜索表单  -->
	<form name='form3' action='searchGoodsByAdmin.action' method="post">
	<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
	  <tr bgcolor='#EEF4EA'>
	    <td background='./admin/files/images/wbg.gif' align='center'>
	      <table border='0' cellpadding='0' cellspacing='0'>
	        <tr>
	          <td width='90' align='center'>搜索条件：</td>
	          <td width='160'>
		          <select id="info" name="info" onclick="showTwo()">
					 <option value="">一级标题</option>
				 </select>
	         </td>
	          <td width='160'>
		          <select id="info2" name="info2" onchange="showThree()" style="width: 150px;">
					 <option value="">二级标题</option>
				 </select>
	         </td>
	          <td width='160'>
		         <select id="info3" name="categoryId" style="width: 150px;">
					<option value="">三级标题</option>
				</select>
	         </td>
	        <td width='70'>
	          关键字：
	        </td>
	        <td width='160'>
	          	<input type='text' name='keyword' id='keyword' style='width:150px' />
	        </td>
	        <td width='110'>
	    		<select name='orderby' style='width:80px'>
		            <option value=''>排序...</option>
		            <option value='modifyTime'>修改时间</option>
		            <option value='sprice'>售价↑</option>
		            <option value='gnum'>库存↑</option>
		            <option value='snum'>销量↑</option>
		      	</select>
	        </td>
	        <td>
	          <!-- <input name="imageField" type="image" src="./admin/files/images/search.gif" width="45" height="20" border="0" class="np" /> -->
	          <input type="submit" value="搜索"/>
	        </td>
	       </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	</form>
	</body>
</html>
