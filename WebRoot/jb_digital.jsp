<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数码城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_digital.css">

  </head>
  
  <body>
  	 <jsp:include page="content/jb_head.jsp"></jsp:include>
 	 <div id="main">
 	 	<div id="top">
 	 		<div id="top_left">
 	 			<ul>
 	 				<li><span style="font-family: 幼圆" class="ys01">数码配件</span><span class="ys02">&nbsp;&gt;&nbsp;内存卡、移动电源</span></li>
 	 				<li><span style="font-family: 幼圆;" class="ys01">手机通讯</span><span class="ys02">&nbsp;&gt;&nbsp;手机、电池</span></li>
 	 				<li><span style="font-family: 幼圆" class="ys01">电脑整机</span><span class="ys02">&nbsp;&gt;&nbsp;笔记本、台式机</span></li>
 	 				<li><span style="font-family: 幼圆" class="ys01">摄影摄像</span><span class="ys02">&nbsp;&gt;&nbsp;单反、镜头</span></li>
 	 				<li><span style="font-family: 幼圆" class="ys01">电脑配件</span><span class="ys02">&nbsp;&gt;&nbsp;内存、硬盘</span></li>
 	 				<li><span style="font-family: 幼圆" class="ys01">时尚影音</span><span class="ys02">&nbsp;&gt;&nbsp;MP3/MP4、电子书</span></li>
 	 				<li><span style="font-family: 幼圆" class="ys01">外设产品</span><span class="ys02">&nbsp;&gt;&nbsp;鼠标、键盘</span></li>
 	 			</ul>
 	 		</div>
 	 		
 	 		<div id="top_right">
 	 			<div id="top_right_title">聚宝动态</div>
 	 			<div id="top_right_details">
 	 				<ol>
 	 					<li><span class="ys_left">有国庆节系统定期维护通知<img src="./images/new.gif"/></span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">关于双十一全网活动细则<img src="./images/new.gif"/></span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">有关产品质量退货的问题<img src="./images/new.gif"/></span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">部分用户密码建议修改</span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">关于国庆节系统定期维护</span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">关于国庆节系统定期维护</span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">关于国庆节系统定期维护</span><span class="ys_right">2013-10-13</span></li>
 	 					<li><span class="ys_left">关于国庆节系统定期维护</span><span class="ys_right">2013-10-13</span></li>
 	 				</ol>
 	 			
 	 			</div>
 	 		</div>
 	 		
 	 		<div id="top_middle">
 	 			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="645" height="279">
	                <param name="movie" value="./files/swf/bcastr3.swf">
	                <param name="quality" value="high">
	                <param name="wmode" value="transparent">
	                <param name="FlashVars" value="bcastr_file=images/img_01 (1).jpg|images/img_01 (2).jpg|images/img_01 (3).jpg|images/img_01 (4).jpg&bcastr_link=index.html&bcastr_title=&bcastr_config=0xffffff:文字颜色|2:文字位置|0x6399CC:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x6399CC:按键默认颜色|0x000033:按键当前颜色|3:自动播放时间(秒)|3:图片过渡效果|1:是否显示按钮|_blank:打开窗口">
	                <embed src="./files/swf/bcastr3.swf" FlashVars="bcastr_file=images/img_01 (1).jpg|images/img_01 (2).jpg|images/img_01 (3).jpg|images/img_01 (4).jpg&bcastr_link=index.html&bcastr_title=&bcastr_config=0xffffff:文字颜色|2:文字位置|0x6399CC:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x6399CC:按键默认颜色|0x000033:按键当前颜色|3:自动播放时间(秒)|3:图片过渡效果|1:是否显示按钮|_blank:打开窗口" width="645" height="279" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
	           </object>
 	 		</div>
 	 	</div>
 	 	<div id="bottom">
 	 		
 	 	</div>
 	 </div>
   	 <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
