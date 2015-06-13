<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>关于我们</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			margin:0px;
			text-align: center;
		}
		
		#main{
			margin:0 auto;
			width:1200px;
			height: 390px;
			line-height: 40px;
			font-size: 25px;
			font-family: Microsoft YAHEI;
			background-image: url("./images/about.gif");
			padding-top: 50px;
		}
	</style>
  </head>
  
  <body>
  		<%@include file="./content/jb_head.jsp" %>
  		<div id="main">
  		<h2>开 发 者 信 息&nbsp;&nbsp;</h2>
  				学校：中北大学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
  				学院：软件学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
  				班级：10210A05班<br>
  				姓名：郭世杰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
  				学号：1021011743<br>
  		</div>
  		<%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
