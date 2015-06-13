<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jb_goodsDiscuss.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/jb_goodsDiscuss.css" type="text/css"></link>
	<script type="text/javascript" src="js/jb_goodsDiscuss.js"></script>
  </head>
  
  <body>
  <div>
    <table width="100%" border="1" cellspacing="0" cellpadding="3" frame="box" rules="all">
          <s:if test="#session.goods.discusses.size > 0">
          		<s:iterator value="#session.goodsDetailsDiscussByPage" var="discuss" status="st">
         			<tr>
		              <td height="15" align="left" valign="top">
			                  <table height="15" width="800" border="0" cellspacing="0" cellpadding="0">
			                     <tr height="15">
			                         <td width="100" align="center">用户名：</td>
			                         <td width="245"><s:property value="#discuss.user.uname"/></td>
			                         <td width="118" align="center">评论时间：</td>
			                       	 <td width="473"><s:property value="#discuss.dtime"/></td>
			                         <td width="83" align="center" valign="middle"><s:property value="#discuss.grade"/></td>
			                     </tr>
			                  </table>
		              </td>
		              <td width="110" height="110" rowspan="2">
		              	<s:if test="null==#discuss.user.headImg">
		              		<img src="./images/tx.jpg" width="110" height="110">
		              	</s:if>
		              	<s:else>
		              			<img src="<s:property value='#discuss.user.headImg'/>" width="110" height="110">
		              	</s:else>
		              
		              </td>
			     </tr>
		          <tr height="95" valign="top">
		              <td><s:property value="#discuss.details"/></td>
		          </tr>
		       </s:iterator>
          </s:if>
          <s:else>
          		<tr height="20px">
          			<td align="center">暂无评论</td>
          		</tr>
          </s:else>
       </table>
</div>
<!-- 分页代码begin -->
<div id="fenye_">
	<s:if test="#session.goodsDetailsPage.hasPre==true">
			<a href="discussByPage!discussByPage.action?gid=<s:property value='#session.goods.gid'/>&pageNow=1">首页</a>
			<a href="discussByPage!discussByPage.action?gid=<s:property value='#session.goods.gid'/>&pageNow=<s:property value='#session.goodsDetailsPage.pageNow-1'/>">上一页</a>
	</s:if>
	<s:else>
			首页&nbsp;上一页
	</s:else>
  	
  		<s:iterator begin="1" end="#session.goodsDetailsPage.pageCount" var="num">
  				<s:if test="#session.goodsDetailsPage.pageNow != #num">
   					<span class="pageOther"><a href="
   							<s:url action="discussByPage" method="discussByPage">
								<s:param name="pageNow" value="#num"></s:param>
								<s:param name="gid" value="#session.goods.gid"></s:param>
							</s:url>
   					"><s:property value="#num"/></a></span>
   			</s:if>
   			<s:else>
   					<span class="pageNow"><s:property value="#num"/></span>
   			</s:else>
  		</s:iterator>
  		
  		<s:if test="#session.goodsDetailsPage.hasNext==true">
			<a href="discussByPage!discussByPage.action?gid=<s:property value='#session.goods.gid'/>&pageNow=<s:property value='#session.goodsDetailsPage.pageNow+1'/>">下一页</a>
			<a href="discussByPage!discussByPage.action?gid=<s:property value='#session.goods.gid'/>&pageNow=<s:property value='#session.goodsDetailsPage.pageCount'/>">尾页</a>
	</s:if>
	<s:else>
			下一页&nbsp;尾页
	</s:else>
	共<s:property value="#session.goodsDetailsPage.pageNow"/>/<s:property value="#session.goodsDetailsPage.pageCount"/>页&nbsp;(<s:property value="#session.goodsDetailsPage.pageAllSize"/>个)
	
	&nbsp;&nbsp;
   	跳转至
   	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1(<s:property value='#session.goods.gid'/>);">
   			<s:iterator var = "number" begin="1" end="#session.goodsDetailsPage.pageCount">
	    			<s:if test="#session.goodsDetailsPage.pageNow != #number">
	    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
	    			</s:if>
	    			<s:else>
	    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
	    			</s:else>
	    	</s:iterator>
   	</select>
   	页
</div>
 <!-- 分页代码end -->     
  </body>
</html>
