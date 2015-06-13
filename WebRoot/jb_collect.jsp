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
    
    <title>我的收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_collect.css">
	<script type="text/javascript" src="<%=basePath%>js/jb_collect.js"></script>
  </head>
  
  <body>
    <div id="bd">
	    <div id="title">我的收藏</div>
	    
	    <div id="table_orders">
	    	<form action="deleteCollects.action" method="get" onsubmit="return cancel_collect()">
	    	<table width="987" border="1" frame="box" rules="all" cellspacing="0" id="collect_tbl">
	    		<tr align="center">
	    			<td width="70">全选</td>
	    			<td width="400">商&nbsp;品&nbsp;详&nbsp;情</td>
	    			<td width="80">价&nbsp;格</td>
	    			<td width="175">收&nbsp;藏&nbsp;日&nbsp;期</td>
	    			<td>操作</td>
	    		</tr>
	    		
	    		<s:iterator value="#listByPage"  var="goods" status="st">
	    			<tr align="center">
		    			<td width="70"><input type="checkbox" id="<s:property value='#goods.goods.gid'/>" name="selGoods" value="<s:property value='#goods.cid'/>"></td>
		    			<td width="500">
		    				<table border="0" width="100%">
		    					<tr>
		    						<td width="15%">
		    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.goods.gid'/>" target="_blank">
				   	 						<s:generator separator="," val="#goods.goods.img" id="image"></s:generator>
								 	 		<s:iterator value="#attr.image" var="mm" status="st" >
								 	 			<s:if test="#st.isFirst()">
								 	 				<img src="<s:property value="mm"/>" width="80" height="65"/>
								 	 			</s:if>
								 	 		</s:iterator>
			   	 						</a>
		    						</td>
		    						<td>
		    							<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.goods.gid'/>" target="_blank">
		    								<label style="font-size: 14px; line-height: 20px;"><s:property value="#goods.goods.gname"/></label>
		    							</a>
		    						</td>
		    					</tr>
		    				</table>
		    			</td>
		    			<td width="80"><font style="font-weight: normal; color: red;">￥<s:property value="#goods.goods.sprice"/></font></td>
		    			<td width="175"><s:property value="#goods.ctime"/></td>
		    			<td>
		    				<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.goods.gid'/>" target="_parent">[购买]</a>
		    				<a href="deleteOneCollect!deleteOneCollect.action?pageNow=<s:property value= '#page.pageNow'/>&cid=<s:property value='#goods.cid'/>"  onclick="return cancel_collect();">[取消收藏]</a>
		    			</td>
		    		</tr>
	    		</s:iterator>
	    		
	    		<tr>
	    			<td colspan="5">
						<input type="button" value="全选" onclick="selAll()">
						<input type="button" value="取消" onclick="noSelAll()">
						<input type="hidden" name="pageNow" value="<s:property value='#page.pageNow'/>" >
						<input type="submit" value="取消收藏" class="coolbg">
	    			</td>
	    		</tr>
	    	</table>
	    	</form>
	    	
	    	<!-- 页码显示begin -->
	    	<div id="pageNumber"> 
	    		<s:if test="#page.hasPre==true">
						<a href="getCollectListByPage!getCollectListByPage.action?pageNow=1">首页</a>
						<a href="getCollectListByPage!getCollectListByPage.action?pageNow=<s:property value='#page.pageNow-1'/>">上一页</a>
				</s:if>
				<s:else>
						首页&nbsp;上一页
				</s:else>
	    	
	    		<s:iterator begin="1" end="#page.pageCount" var="num">
	    				<s:if test="#page.pageNow != #num">
		    					<span class="pageOther"><a href="
		    							<s:url action="getCollectListByPage" method="getCollectListByPage">
											<s:param name="pageNow" value="#num"></s:param>
										</s:url>
		    					"><s:property value="#num"/></a></span>
		    			</s:if>
		    			<s:else>
		    					<span class="pageNow"><s:property value="#num"/></span>
		    			</s:else>
	    		</s:iterator>
	    		
	    		<s:if test="#page.hasNext==true">
						<a href="getCollectListByPage!getCollectListByPage.action?pageNow=<s:property value='#page.pageNow+1'/>">下一页</a>
						<a href="getCollectListByPage!getCollectListByPage.action?pageNow=<s:property value='#page.pageCount'/>">尾页</a>
				</s:if>
				<s:else>
						下一页&nbsp;尾页
				</s:else>
				共<s:property value="#page.pageNow"/>/<s:property value="#page.pageCount"/>页&nbsp;(<s:property value="#page.pageAllSize"/>个)
				
				&nbsp;&nbsp;
		    	跳转至
		    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1();">
		    			<s:iterator var = "number" begin="1" end="#page.pageCount">
				    			<s:if test="#page.pageNow != #number">
				    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
				    			</s:if>
				    			<s:else>
				    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
				    			</s:else>
				    	</s:iterator>
		    	</select>
		    	页
	    	</div>
	    	<!-- 页码显示end -->
	    </div>
    </div>
  </body>
</html>
