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
    
    <title>聚宝通告管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./admin/files/css/base.css">
	<script type="text/javascript" src="./admin/files/js/notificationManage.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8">
    	<!--  快速转换位置按钮  -->
		<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF4EA" align="center">
		<tr>
		 <td height="26">
			  <table width="98%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					  <td align="center">
					  	<a href="newsManage!newsManage.action?pageNow=1" class="coolbg np" >所有通告</a>&nbsp;
					    <a href="./admin/addNews.jsp" class="coolbg np" >添加通告</a>&nbsp;
					    <a href="./admin/main.jsp" class="coolbg np" >后台首页</a>
					  </td>
				 </tr>
			</table>
		</td>
		</tr>
		</table>
		
		<!--  内容列表   -->
	<form name="form2" action="delNewsPatch.action" method="post" onsubmit="return isDel();">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr class="gsjtitlebg">
		<td height="24" colspan="14" background="./files/images/tbg.gif">&nbsp;通告列表&nbsp;</td>
	</tr>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<td width="5%">序号</td>
		<td width="5%">全选</td>
		<td width="50%">通告内容</td>
		<td width="15%">发布时间</td>
		<td width="10%">发布人</td>
		<td width="">操作</td>
	</tr>
	
	<s:iterator var="news" value="#session.newsListByPage" status="stat">
		<tr align='center' <s:if test="#stat.count%2 == 0">bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
		onMouseOut="javascript:this.bgColor='#FFFFFF';" </s:if> 
		<s:if test="#stat.count%2 != 0">bgcolor="#F7F1F0" onMouseMove="javascript:this.bgColor='#F1F6F6';" 
		onMouseOut="javascript:this.bgColor='#F7F1F0';" </s:if> 
		height="22" >
			<td><s:property value="#stat.count"/></td>
			<td><input name="id" type="checkbox" value="<s:property value="#news.id"/>" class="np" id="<s:property value="#news.id"/>"></td>
			<td align="left"><label for="<s:property value="#news.id"/>"><s:property value="#news.title"/></label></td>
			<td align="center"><label for="<s:property value="#news.id"/>"><s:property value="#news.addTime"/></label></td>
			<td align="center"><label for="<s:property value="#news.id"/>"><s:property value="#news.user.uname"/></label></td>
			<td style="text-decoration: none;">
				<a href="queryNewsById!queryNewsById.action?id=<s:property value='#news.id'/>">修改</a>&nbsp;
				<a href="delNews!delNews.action?id=<s:property value='#news.id'/>" onclick="return isDel();">删除</a>
			</td>
		</tr>
	</s:iterator>
	
	<tr bgcolor="#FAFAF1">
	<td height="28" colspan="14">
		&nbsp;
		<a href="javascript:selAll()" class="coolbg">全选</a>
		<a href="javascript:noSelAll()" class="coolbg">取消</a>
		<input type="submit" value="删除" class="coolbg">
	</td>
	</tr>
	
	<!-- 翻页代码begin -->
	<tr bgcolor="#EEF4EA" class="pageInfo">
		<td height="36" colspan="14" align="center">
				<s:if test="#session.newsPage.hasPre==true">
						<a href="newsManage!newsManage.action?pageNow=1">首页</a>
						<a href="newsManage!newsManage.action?pageNow=<s:property value='#session.newsPage.pageNow-1'/>">上一页</a>
				</s:if>
				<s:else>
						首页&nbsp;上一页
				</s:else>
				
				<s:iterator begin="1" end="#session.newsPage.pageCount" var="num">
						<s:if test="#session.newsPage.pageNow != #num">
		    					<span class="pageOther"><a href="
		    							<s:url action="newsManage" method="newsManage">
											<s:param name="pageNow" value="#num"></s:param>
										</s:url>
		    					"><s:property value="#num"/></a></span>
		    			</s:if>
		    			<s:else>
		    					<span class="pageNow"><s:property value="#num"/></span>
		    			</s:else>
				</s:iterator>
			
				<s:if test="#session.newsPage.hasNext==true">
						<a href="newsManage!newsManage.action?pageNow=<s:property value='#session.newsPage.pageNow+1'/>">下一页</a>
						<a href="newsManage!newsManage.action?pageNow=<s:property value="#session.newsPage.pageCount"/>">尾页</a>
				</s:if>
				<s:else>
					下一页&nbsp;尾页
				</s:else>
			  共<s:property value="#session.newsPage.pageNow"/>/<s:property value="#session.newsPage.pageCount"/>页(<s:property value="#session.newsPage.pageAllSize"/> 条)	
			  
			  &nbsp;&nbsp;
		    	跳转至
		    	<select name="selectPage" id="selectPage" class="selectPage" onchange="javascript:gotoPage1();">
		    			<s:iterator var = "number" begin="1" end="#session.newsPage.pageCount">
				    			<s:if test="#session.newsPage.pageNow != #number">
				    					<option value="<s:property value="#number"/>"><s:property value="#number"/></option>
				    			</s:if>
				    			<s:else>
				    					<option value="<s:property value="#number"/>" selected="selected"><s:property value="#number"/></option>
				    			</s:else>
				    	</s:iterator>
		    	</select>
		    	页
			<input type="hidden" id="condition" value="<s:property value="#condition"/>"/>
		</td>
	</tr>
	<!-- 翻页代码end -->
	
	</table>
	
	</form>
		
		
  </body>
</html>
