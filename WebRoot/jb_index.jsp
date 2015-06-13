<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>聚宝首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_index.css">
    <script type="text/javascript" src="./js/index.js"></script>
    
  </head>
  
  <body>
	 <%@include file="./content/jb_head.jsp" %>
   	 <div id="main">
   	 	<div id="top">
   	 		<div id="left">
   	 			<ul>
   	 				<li id="li_01" onmouseover="show_('li_01','pannel_01')" onmouseout="hide_('li_01','pannel_01')"><a href="#">图书、音像、数字商品</a></li>
   	 				<li id="li_02" onmouseover="show_('li_02','pannel_02')" onmouseout="hide_('li_02','pannel_02')" ><a href="#">手机、数码</a></li>
   	 				<li id="li_03" onmouseover="show_('li_03','pannel_03')" onmouseout="hide_('li_03','pannel_03')"><a href="#">电脑、办公</a></li>
   	 				<li id="li_04" onmouseover="show_('li_04','pannel_04')" onmouseout="hide_('li_04','pannel_04')"><a href="#">服饰鞋帽</a></li>
   	 				<li id="li_05" onmouseover="show_('li_05','pannel_05')" onmouseout="hide_('li_05','pannel_05')"><a href="#">礼品箱包、钟表、珠宝</a></li>
   	 				<li id="li_06" onmouseover="show_('li_06','pannel_06')" onmouseout="hide_('li_06','pannel_06')"><a href="#">个护化装</a></li>
   	 				<li id="li_07" onmouseover="show_('li_07','pannel_07')" onmouseout="hide_('li_07','pannel_07')"><a href="#">运动健康、体育用品</a></li>
   	 				<li id="li_08" onmouseover="show_('li_08','pannel_08')" onmouseout="hide_('li_08','pannel_08')"><a href="#">食品饮料、保健食品</a></li>
   	 				<li id="li_09" onmouseover="show_('li_09','pannel_09')" onmouseout="hide_('li_09','pannel_09')"><a href="#">家用电器</a></li>
   	 				<li id="li_10" onmouseover="show_('li_10','pannel_10')" onmouseout="hide_('li_10','pannel_10')"><a href="#">汽车用品</a></li>
   	 				<li id="li_11" onmouseover="show_('li_11','pannel_11')" onmouseout="hide_('li_11','pannel_11')"><a href="#">彩票、旅游</a></li>
   	 				<li id="li_12" onmouseover="show_('li_12','pannel_12')" onmouseout="hide_('li_12','pannel_12')"><a href="#">家居、家具、家装、厨具</a></li>
   	 				<li id="li_13" onmouseover="show_('li_13','pannel_13')" onmouseout="hide_('li_13','pannel_13')"><a href="#">母婴、玩具乐器</a></li>
   	 			</ul>
   	 			
   	 			<div id="pannel_01" onmouseover="show_('li_01','pannel_01')" onmouseout="hide_('li_01','pannel_01')">
   	 				<div id="pannel_01_01">
   	 					<div class="pannel_left"><font class="red">电子书：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">免费</a>&nbsp;|
	   	 					<a href="#">小说</a>&nbsp;|
	   	 					<a href="#">励志</a>&nbsp;|
	   	 					<a href="#">婚恋</a>&nbsp;|
	   	 					<a href="#">文学</a>&nbsp;|
	   	 					<a href="#">经管</a>
	   	 				</div>
   	 				</div>
   	 				<div id="pannel_01_02">
   	 					<div class="pannel_left"><font class="red">数字音乐：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">通俗流行</a>&nbsp;|
	   	 					<a href="#">古典音乐</a>&nbsp;|
	   	 					<a href="#">摇滚说唱</a>&nbsp;|
	   	 					<a href="#">其它</a>&nbsp;
   	 					</div>
   	 					<div class="pannel_left"><font class="red">音像：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">音乐</a>&nbsp;|
	   	 					<a href="#">影视</a>&nbsp;|
	   	 					<a href="#">游戏</a>&nbsp;|
	   	 					<a href="#">教育音像</a>&nbsp;|
	   	 					<a href="#">其它</a>&nbsp;
   	 					</div>
   	 					<div class="pannel_left"><font class="red">科技：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">科普</a>&nbsp;|
	   	 					<a href="#">建筑</a>&nbsp;|
	   	 					<a href="#">医学</a>&nbsp;|
	   	 					<a href="#">IT</a>&nbsp;|
	   	 					<a href="#">其它</a>&nbsp;
   	 					</div>
   	 					<div class="pannel_left"><font class="red">教育：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">教材教辅</a>&nbsp;|
	   	 					<a href="#">考试</a>&nbsp;|
	   	 					<a href="#">外语学习</a>&nbsp;|
	   	 					<a href="#">其它</a>&nbsp;
   	 					</div>
   	 					<div class="pannel_left"><font class="red">生活：</font></div>
   	 					<div class="pannel_right">
	   	 					<a href="#">旅游地图</a>&nbsp;|
	   	 					<a href="#">娱乐休闲</a>&nbsp;|
	   	 					<a href="#">体育运动</a>&nbsp;|
	   	 					<a href="#">其它</a>&nbsp;
   	 					</div>
   	 				</div>
   	 			</div>
   	 			<div id="pannel_02" onmouseover="show_('li_02','pannel_02')" onmouseout="hide_('li_02','pannel_02')">
   	 				<div id="pannel_02_01">
	   	 				<div class="pannel_left"><font class="red">手机通讯：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">手机</a>&nbsp;|
		   	 					<a href="#">对讲机</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 				</div>
   	 				</div>
   	 				<div id="pannel_02_02">
	   	 					<div class="pannel_left"><font class="red">手机配件：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">电池</a>&nbsp;|
		   	 					<a href="#">充电器</a>&nbsp;|
		   	 					<a href="#">数据线</a>&nbsp;|
		   	 					<a href="#">贴膜</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">摄影摄像：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">数码相机</a>&nbsp;|
		   	 					<a href="#">单反</a>&nbsp;|
		   	 					<a href="#">摄像机</a>&nbsp;|
		   	 					<a href="#">镜头</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">数码配件：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">内存卡</a>&nbsp;|
		   	 					<a href="#">读卡器</a>&nbsp;|
		   	 					<a href="#">相机包</a>&nbsp;|
		   	 					<a href="#">移动电源</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">时尚影音：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">MP3/MP4</a>&nbsp;|
		   	 					<a href="#">电子书</a>&nbsp;|
		   	 					<a href="#">电子词典</a>&nbsp;|
		   	 					<a href="#">录音笔</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">其它：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">苹果配件</a>&nbsp;|
		   	 					<a href="#">数码相框</a>&nbsp;|
		   	 					<a href="#">音箱</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			<div id="pannel_03" onmouseover="show_('li_03','pannel_03')" onmouseout="hide_('li_03','pannel_03')">
   	 				<div id="pannel_03_01">
   	 						<div class="pannel_left"><font class="red">电脑整机：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">笔记本</a>&nbsp;|
		   	 					<a href="#">超级本</a>&nbsp;|
		   	 					<a href="#">游戏本</a>&nbsp;|
		   	 					<a href="multiCondition!showGoodsByConditions.action?search_text=平板电脑">平板电脑</a>&nbsp;|
		   	 					<a href="#">台式机</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_03_02">
   	 						<div class="pannel_left"><font class="red">电脑配件：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">CPU</a>&nbsp;|
		   	 					<a href="#">主板</a>&nbsp;|
		   	 					<a href="#">显卡</a>&nbsp;|
		   	 					<a href="#">内存</a>&nbsp;|
		   	 					<a href="#">硬盘</a>&nbsp;|
		   	 					<a href="#">显示器</a>&nbsp;|
		   	 					<a href="#">声卡</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">外设产品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">鼠标</a>&nbsp;|
		   	 					<a href="#">键盘</a>&nbsp;|
		   	 					<a href="#">游戏设备</a>&nbsp;|
		   	 					<a href="#">U盘</a>&nbsp;|
		   	 					<a href="#">移动硬盘</a>&nbsp;|
		   	 					<a href="#">插座</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">网络产品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">路由器</a>&nbsp;|
		   	 					<a href="#">网卡</a>&nbsp;|
		   	 					<a href="#">交换机</a>&nbsp;|
		   	 					<a href="#">网络存储</a>&nbsp;|
		   	 					<a href="#">3G上网</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">办公打印：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">打印机</a>&nbsp;|
		   	 					<a href="#">一体机</a>&nbsp;|
		   	 					<a href="#">投影机</a>&nbsp;|
		   	 					<a href="#">传真机</a>&nbsp;|
		   	 					<a href="#">扫描仪</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">办公文仪：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">办公文具</a>&nbsp;|
		   	 					<a href="#">文件管理</a>&nbsp;|
		   	 					<a href="#">笔类</a>&nbsp;|
		   	 					<a href="#">计算器</a>&nbsp;|
		   	 					<a href="#">财务用品</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">服务产品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">上门服务</a>&nbsp;|
		   	 					<a href="#">远程服务</a>&nbsp;|
		   	 					<a href="#">电脑软件</a>&nbsp;|
		   	 					<a href="#">其它</a>&nbsp;
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_04" onmouseover="show_('li_04','pannel_04')" onmouseout="hide_('li_04','pannel_04')">
   	 				<div id="pannel_04_00">
   	 						<div class="pannel_left"><font class="red">女装：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">T恤</a>&nbsp;|
		   	 					<a href="#">衬衫</a>&nbsp;|
		   	 					<a href="#">针织衫</a>&nbsp;|
		   	 					<a href="#">卫衣</a>&nbsp;|
		   	 					<a href="#">连衣裙</a>&nbsp;|
		   	 					<a href="#">牛仔裤</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_04_01">
   	 						<div class="pannel_left"><font class="red">男装：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">衬衫</a>&nbsp;|
		   	 					<a href="#">T恤</a>&nbsp;|
		   	 					<a href="#">POLO衫</a>&nbsp;|
		   	 					<a href="#">针织衫</a>&nbsp;|
		   	 					<a href="#">夹克</a>&nbsp;|
		   	 					<a href="#">西装</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_04_02">
   	 						<div class="pannel_left"><font class="red">运动：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">羽绒服</a>&nbsp;|
		   	 					<a href="#">帆布鞋</a>&nbsp;|
		   	 					<a href="#">套装</a>&nbsp;|
		   	 					<a href="#">拖鞋</a>&nbsp;|
		   	 					<a href="#">运动裤</a>&nbsp;|
		   	 					<a href="#">T恤</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">女鞋：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">平底鞋</a>&nbsp;|
		   	 					<a href="#">高跟鞋</a>&nbsp;|
		   	 					<a href="#">单鞋</a>&nbsp;|
		   	 					<a href="#">休闲鞋</a>&nbsp;|
		   	 					<a href="#">凉鞋</a>&nbsp;|
		   	 					<a href="#">雪地靴</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">男鞋：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">商务休闲鞋</a>&nbsp;|
		   	 					<a href="#">正装鞋</a>&nbsp;|
		   	 					<a href="#">休闲鞋</a>&nbsp;|
		   	 					<a href="#">功能</a>&nbsp;|
		   	 					<a href="#">拖鞋</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">配饰：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">太阳镜</a>&nbsp;|
		   	 					<a href="#">框镜</a>&nbsp;|
		   	 					<a href="#">皮带</a>&nbsp;|
		   	 					<a href="#">围巾</a>&nbsp;|
		   	 					<a href="#">手套</a>&nbsp;|
		   	 					<a href="#">帽子</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">童装：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">套装</a>&nbsp;|
		   	 					<a href="#">上衣</a>&nbsp;|
		   	 					<a href="#">裤子</a>&nbsp;|
		   	 					<a href="#">亲子装</a>&nbsp;|
		   	 					<a href="#">靴子</a>&nbsp;|
		   	 					<a href="#">凉鞋</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 		
   	 			<div id="pannel_05" onmouseover="show_('li_05','pannel_05')" onmouseout="hide_('li_05','pannel_05')">
   	 				<div id="pannel_05_00">
   	 						<div class="pannel_left"><font class="red">潮流女包：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">钱包</a>&nbsp;|
		   	 					<a href="#">手拿包</a>&nbsp;|
		   	 					<a href="#">单肩包</a>&nbsp;|
		   	 					<a href="#">双肩包</a>&nbsp;|
		   	 					<a href="#">手提</a>&nbsp;|
		   	 					<a href="#">斜跨包</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">时尚男包：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">钱包</a>&nbsp;|
		   	 					<a href="#">卡包</a>&nbsp;|
		   	 					<a href="#">男士手包</a>&nbsp;|
		   	 					<a href="#">腰带</a>&nbsp;|
		   	 					<a href="#">商务公文包</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_05_01">
   	 					<div class="pannel_left"><font class="red">功能箱包：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">电脑数码包</a>&nbsp;|
		   	 					<a href="#">拉杆箱</a>&nbsp;|
		   	 					<a href="#">旅行包</a>&nbsp;|
		   	 					<a href="#">旅行配件</a>&nbsp;|
		   	 					<a href="#">休闲运动包</a>&nbsp;
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_05_02">
   	 						<div class="pannel_left"><font class="red">礼品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">火机烟具</a>&nbsp;|
		   	 					<a href="#">礼品文具</a>&nbsp;|
		   	 					<a href="#">瑞士军刀</a>&nbsp;|
		   	 					<a href="#">收藏品</a>&nbsp;|
		   	 					<a href="#">工艺</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">钟表：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">瑞士品牌</a>&nbsp;|
		   	 					<a href="#">国产品牌</a>&nbsp;|
		   	 					<a href="#">日本品牌</a>&nbsp;|
		   	 					<a href="#">时尚品牌</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">珠宝首饰：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">钻石饰品</a>&nbsp;|
		   	 					<a href="#">银饰</a>&nbsp;|
		   	 					<a href="#">翡翠玉石</a>&nbsp;|
		   	 					<a href="#">宝石珍珠</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">婚庆：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">婚嫁首饰</a>&nbsp;|
		   	 					<a href="#">婚纱摄影</a>&nbsp;|
		   	 					<a href="#">婚纱礼服</a>&nbsp;|
		   	 					<a href="#">婚庆服务</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_06" onmouseover="show_('li_06','pannel_06')" onmouseout="hide_('li_06','pannel_06')">
   	 				<div id="pannel_06_00">
   	 						<div class="pannel_left"><font class="red">面部护理：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">洁面乳</a>&nbsp;|
		   	 					<a href="#">爽肤水</a>&nbsp;|
		   	 					<a href="#">精华露</a>&nbsp;|
		   	 					<a href="#">乳液面霜</a>&nbsp;|
		   	 					<a href="#">眼部护理</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">身体护理：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">洗发护发</a>&nbsp;|
		   	 					<a href="#">沐浴</a>&nbsp;|
		   	 					<a href="#">香皂</a>&nbsp;|
		   	 					<a href="#">手足护理</a>&nbsp;|
		   	 					<a href="#">染发</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_06_01">
   	 						<div class="pannel_left"><font class="red">口腔护理：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">牙膏</a>&nbsp;|
		   	 					<a href="#">牙刷</a>&nbsp;|
		   	 					<a href="#">漱口水</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_06_02">
   	 						<div class="pannel_left"><font class="red">男士护理：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">脸部</a>&nbsp;|
		   	 					<a href="#">眼部</a>&nbsp;|
		   	 					<a href="#">身体护理</a>&nbsp;|
		   	 					<a href="#">男士香水</a>&nbsp;|
		   	 					<a href="#">剃须</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">香水SPA：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">女士香水</a>&nbsp;|
		   	 					<a href="#">男士香水</a>&nbsp;|
		   	 					<a href="#">组合套装</a>&nbsp;|
		   	 					<a href="#">迷你香水</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">魅力彩妆：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">粉底</a>&nbsp;|
		   	 					<a href="#">腮红</a>&nbsp;|
		   	 					<a href="#">眉笔</a>&nbsp;|
		   	 					<a href="#">睫毛膏</a>&nbsp;|
		   	 					<a href="#">美甲</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_07" onmouseover="show_('li_07','pannel_07')" onmouseout="hide_('li_07','pannel_07')">
   	 				<div id="pannel_07_00">
   	 						<div class="pannel_left"><font class="red">户外鞋服：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">户外服装</a>&nbsp;|
		   	 					<a href="#">户外鞋袜</a>&nbsp;|
		   	 					<a href="#">户外配饰</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">户外装备：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">帐篷</a>&nbsp;|
		   	 					<a href="#">睡袋</a>&nbsp;|
		   	 					<a href="#">登山攀岩</a>&nbsp;|
		   	 					<a href="#">户外背包</a>&nbsp;|
		   	 					<a href="#">烧烤用品</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_07_01">
   	 						<div class="pannel_left"><font class="red">运动器械：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">健身器械</a>&nbsp;|
		   	 					<a href="#">运动器械</a>&nbsp;|
		   	 					<a href="#">防护器具</a>&nbsp;|
		   	 					<a href="#">极限轮滑</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_07_02">
   	 						<div class="pannel_left"><font class="red">体育娱乐：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">羽毛球</a>&nbsp;|
		   	 					<a href="#">乒乓球</a>&nbsp;|
		   	 					<a href="#">篮球</a>&nbsp;|
		   	 					<a href="#">足球</a>&nbsp;|
		   	 					<a href="#">网球</a>&nbsp;|
		   	 					<a href="#">排球</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 						<div class="pannel_left"><font class="red">保健器械：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">养生器械</a>&nbsp;|
		   	 					<a href="#">保健用品</a>&nbsp;|
		   	 					<a href="#">康复辅助</a>&nbsp;|
		   	 					<a href="#">家庭护理</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					<div class="pannel_left"><font class="red">急救卫生：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">跌打损伤</a>&nbsp;|
		   	 					<a href="#">烫伤止痒</a>&nbsp;|
		   	 					<a href="#">口腔咽部</a>&nbsp;|
		   	 					<a href="#">眼部保健</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			
   	 			</div>
   	 		
   	 			<div id="pannel_08" onmouseover="show_('li_08','pannel_08')" onmouseout="hide_('li_08','pannel_08')">
   	 				<div id="pannel_08_00">
   	 						<div class="pannel_left"><font class="red">进口食品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">饼干蛋糕</a>&nbsp;|
		   	 					<a href="#">糖果巧克力</a>&nbsp;|
		   	 					<a href="#">休闲零食</a>&nbsp;|
		   	 					<a href="#">粮油调味</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">地方特产：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">华北</a>&nbsp;|
		   	 					<a href="#">西北</a>&nbsp;|
		   	 					<a href="#">西南</a>&nbsp;|
		   	 					<a href="#">东北</a>&nbsp;|
		   	 					<a href="#">华南</a>&nbsp;|
		   	 					<a href="#">华东</a>&nbsp;|
		   	 					<a href="#">东中</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_08_01">
   	 						<div class="pannel_left"><font class="red">休闲食品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">休闲零食</a>&nbsp;|
		   	 					<a href="#">坚果炒货</a>&nbsp;|
		   	 					<a href="#">肉干肉松</a>&nbsp;|
		   	 					<a href="#">糖果</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_08_02">
   	 						<div class="pannel_left"><font class="red">粮油调味：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">米面杂粮</a>&nbsp;|
		   	 					<a href="#">食用油</a>&nbsp;|
		   	 					<a href="#">调味品</a>&nbsp;|
		   	 					<a href="#">南北干货</a>&nbsp;|
		   	 					<a href="#">有机食品</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">营养健康：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">基础营养</a>&nbsp;|
		   	 					<a href="#">美体养颜</a>&nbsp;|
		   	 					<a href="#">滋补调养</a>&nbsp;|
		   	 					<a href="#">保健茶饮</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">健康礼品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">参茸礼品</a>&nbsp;|
		   	 					<a href="#">更多礼品</a>&nbsp;
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_09" onmouseover="show_('li_09','pannel_09')" onmouseout="hide_('li_09','pannel_09')">
   	 				<div id="pannel_09_00">
   	 						<div class="pannel_left"><font class="red">大家电：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">平板电视</a>&nbsp;|
		   	 					<a href="#">空调</a>&nbsp;|
		   	 					<a href="#">冰箱</a>&nbsp;|
		   	 					<a href="#">家庭影院</a>&nbsp;|
		   	 					<a href="#">热水器</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">生活电器：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">取暖器</a>&nbsp;|
		   	 					<a href="#">加温器</a>&nbsp;|
		   	 					<a href="#">净化器</a>&nbsp;|
		   	 					<a href="#">饮水机</a>&nbsp;|
		   	 					<a href="#">吸尘器</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_09_01">
   	 						<div class="pannel_left"><font class="red">厨房电器：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">电压力锅</a>&nbsp;|
		   	 					<a href="#">电饭煲</a>&nbsp;|
		   	 					<a href="#">豆浆机</a>&nbsp;|
		   	 					<a href="#">面包机</a>&nbsp;|
		   	 					<a href="#">微波炉</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_09_02">
   	 						<div class="pannel_left"><font class="red">个护健康：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">剃须刀</a>&nbsp;|
		   	 					<a href="#">口腔护理</a>&nbsp;|
		   	 					<a href="#">电吹风</a>&nbsp;|
		   	 					<a href="#">美容</a>&nbsp;|
		   	 					<a href="#">血压计</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">五金家族：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">电动工具</a>&nbsp;|
		   	 					<a href="#">手动工具</a>&nbsp;|
		   	 					<a href="#">灯具</a>&nbsp;|
		   	 					<a href="#">LED灯</a>&nbsp;|
		   	 					<a href="#">电气开关</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_10" onmouseover="show_('li_10','pannel_10')" onmouseout="hide_('li_10','pannel_10')">
   	 				<div id="pannel_10_00">
   	 						<div class="pannel_left"><font class="red">电子电器：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">充气泵</a>&nbsp;|
		   	 					<a href="#">行车记录仪</a>&nbsp;|
		   	 					<a href="#">车载电源</a>&nbsp;|
		   	 					<a href="#">倒车雷达</a>&nbsp;|
		   	 					<a href="#">导航</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">系统养护：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">机油</a>&nbsp;|
		   	 					<a href="#">添加剂</a>&nbsp;|
		   	 					<a href="#">防冻冷却液</a>&nbsp;|
		   	 					<a href="#">附属油</a>&nbsp;|
		   	 					<a href="#">底盘装甲</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">改装配件：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">雨刷</a>&nbsp;|
		   	 					<a href="#">车灯</a>&nbsp;|
		   	 					<a href="#">轮胎</a>&nbsp;|
		   	 					<a href="#">贴膜</a>&nbsp;|
		   	 					<a href="#">后视镜</a>&nbsp;|
		   	 					<a href="#">刹车盘</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_10_01">
   	 						<div class="pannel_left"><font class="red">洗车美容：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">漆面美容</a>&nbsp;|
		   	 					<a href="#">漆面修复</a>&nbsp;|
		   	 					<a href="#">内饰清洁</a>&nbsp;|
		   	 					<a href="#">车掸</a>&nbsp;|
		   	 					<a href="#">洗车液</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_10_02">
   	 						<div class="pannel_left"><font class="red">座垫脚垫：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">凉热</a>&nbsp;|
		   	 					<a href="#">四季垫</a>&nbsp;|
		   	 					<a href="#">毛垫</a>&nbsp;|
		   	 					<a href="#">后备箱垫</a>&nbsp;|
		   	 					<a href="#">通用脚垫</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">内饰精品：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">车用香水</a>&nbsp;|
		   	 					<a href="#">车用炭包</a>&nbsp;|
		   	 					<a href="#">空气净化</a>&nbsp;|
		   	 					<a href="#">方向盘套</a>&nbsp;|
		   	 					<a href="#">挂件</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   	 			<div id="pannel_11" onmouseover="show_('li_11','pannel_11')" onmouseout="hide_('li_11','pannel_11')">
   	 				<div id="pannel_11_00">
   	 						<div class="pannel_left"><font class="red">彩票：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">双色球</a>&nbsp;|
		   	 					<a href="#">七乐彩</a>&nbsp;|
		   	 					<a href="#">福彩3D</a>&nbsp;|
		   	 					<a href="#">足彩</a>&nbsp;|
		   	 					<a href="#">大乐透</a>&nbsp;|
		   	 					<a href="#">快3</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
	   	 					
   	 						<div class="pannel_left"><font class="red">机票：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">国内机票</a>&nbsp;|
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">酒店：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">国内酒店</a>&nbsp;|
		   	 					<a href="#">酒店团购</a>&nbsp;|
	   	 					</div>
	   	 					
	   	 					<div class="pannel_left"><font class="red">旅行：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">度假</a>&nbsp;|
		   	 					<a href="#">景点</a>&nbsp;|
		   	 					<a href="#">租车</a>&nbsp;|
		   	 					<a href="#">旅游团购</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_11_01">
   	 						<div class="pannel_left"><font class="red">票务：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">电影票</a>&nbsp;|
		   	 					<a href="#">演唱会</a>&nbsp;|
		   	 					<a href="#">音乐会</a>&nbsp;|
		   	 					<a href="#">体育赛事</a>&nbsp;|
		   	 					<a href="#">戏曲综艺</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 				<div id="pannel_11_02">
   	 						<div class="pannel_left"><font class="red">应用商店：</font></div>
	   	 					<div class="pannel_right">
		   	 					<a href="#">移动游戏</a>&nbsp;|
		   	 					<a href="#">移动软件</a>&nbsp;|
		   	 					<a href="#">网页应用</a>&nbsp;|
		   	 					<a href="#">其它</a>
	   	 					</div>
   	 				</div>
   	 			</div>
   	 		
   	 			<div id="pannel_12" onmouseover="show_('li_12','pannel_12')" onmouseout="hide_('li_12','pannel_12')">
   	 					<div id="pannel_12_01">
   	 							<div class="pannel_left"><font class="red">厨具：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">烹饪锅具</a>&nbsp;|
			   	 					<a href="#">刀剪菜板</a>&nbsp;|
			   	 					<a href="#">保鲜器皿</a>&nbsp;|
			   	 					<a href="#">水具酒具</a>&nbsp;|
			   	 					<a href="#">餐具</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">家纺：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">床品件套</a>&nbsp;|
			   	 					<a href="#">被子</a>&nbsp;|
			   	 					<a href="#">枕芯枕套</a>&nbsp;|
			   	 					<a href="#">床单被罩</a>&nbsp;|
			   	 					<a href="#">床垫</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">家具：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">卧室家具</a>&nbsp;|
			   	 					<a href="#">客厅家具</a>&nbsp;|
			   	 					<a href="#">餐厅</a>&nbsp;|
			   	 					<a href="#">书房家具</a>&nbsp;|
			   	 					<a href="#">阳台户外</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">灯具：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">台灯</a>&nbsp;|
			   	 					<a href="#">节能灯</a>&nbsp;|
			   	 					<a href="#">多用灯</a>&nbsp;|
			   	 					<a href="#">手电</a>&nbsp;|
			   	 					<a href="#">LED灯</a>&nbsp;|
			   	 					<a href="#">吸顶灯</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 				
   	 					</div>
   	 					<div id="pannel_12_02">
   	 							<div class="pannel_left"><font class="red">生活日用：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">收纳用品</a>&nbsp;|
			   	 					<a href="#">雨伞雨具</a>&nbsp;|
			   	 					<a href="#">浴室用品</a>&nbsp;|
			   	 					<a href="#">缝纫用品</a>&nbsp;|
			   	 					<a href="#">洗晒</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
   	 					</div>
   	 			</div>
   	 			
   	 			<div id="pannel_13" onmouseover="show_('li_13','pannel_13')" onmouseout="hide_('li_13','pannel_13')">
   	 					<div id="pannel_13_01">
   	 							<div class="pannel_left"><font class="red">奶粉：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">品牌奶粉</a>&nbsp;|
			   	 					<a href="#">特殊配方</a>&nbsp;|
			   	 					<a href="#">成人奶粉</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">洗护用品：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">宝宝护肤</a>&nbsp;|
			   	 					<a href="#">护理用品</a>&nbsp;|
			   	 					<a href="#">清洁用品</a>&nbsp;|
			   	 					<a href="#">洗浴用品</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">童车童床：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">婴儿推车</a>&nbsp;|
			   	 					<a href="#">安全座椅</a>&nbsp;|
			   	 					<a href="#">自行车</a>&nbsp;|
			   	 					<a href="#">学步车</a>&nbsp;|
			   	 					<a href="#">健身车</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
		   	 					
		   	 					<div class="pannel_left"><font class="red">喂养用品：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">奶瓶</a>&nbsp;|
			   	 					<a href="#">奶嘴</a>&nbsp;|
			   	 					<a href="#">吸奶器</a>&nbsp;|
			   	 					<a href="#">餐具</a>&nbsp;|
			   	 					<a href="#">水具</a>&nbsp;|
			   	 					<a href="#">其它</a>
		   	 					</div>
   	 					</div>
   	 					<div id="pannel_13_02">
   	 							<div class="pannel_left"><font class="red">玩具乐器：</font></div>
		   	 					<div class="pannel_right">
			   	 					<a href="#">适用年龄</a>&nbsp;|
			   	 					<a href="#">遥控电动</a>&nbsp;|
			   	 					<a href="#">娃娃玩具</a>&nbsp;|
			   	 					<a href="#">模型玩具</a>&nbsp;|
			   	 					<!-- <a href="#">健身玩具</a>&nbsp; -->
			   	 					<a href="#">其它</a>
		   	 					</div>
   	 					</div>
   	 			</div>
   	 		</div>
   	 		<div id="right">
   	 			<div id="right_01">
   	 				<div id="kuaibao_title"><span style="float: left">聚宝快报</span><span style="float: right"><font size="2">更多&gt;&gt;</font></span></div>
   	 				<div id="kuaibao_">
   	 					<div id="kuaibao_left">
   	 						幸运大转盘 4K电视<br>
   	 						国庆购物季,手机最<br>
   	 						旅行妆备最高150 <br>
   	 						LG G2独家发售赠千
   	 					</div>
   	 					<div id="kuaibao_right">
   	 						康佳KKTV电视开售<br>
   	 						四川西昌市配送延<br>
   	 						眉州东坡提点搬迁<br>
   	 						国庆 与爱车的N种
   	 					</div>
   	 				</div>
   	 			</div>
   	 			<div id="right_02">
   	 			   	 <div id="message_title"><span style="float: left">本站通告</span><span style="float: right"><font size="2">更多&gt;&gt;</font></span></div>
   	 				 <div id="message_info">
   	 				 	<ul>
   	 				 		<s:iterator value="#application.listShowIndex" var="news">
								<li><s:property value="#news.title"/></li>
   	 				 		</s:iterator>
   	 				 	</ul>
   	 				 </div>
   	 			</div>
   	 		</div>
   	 		<div id="middle">
   	 			<div id="show_imgs">
   	 				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="682" height="240">
		                <param name="movie" value="./files/swf/bcastr3.swf">
		                <param name="quality" value="high">
		                <param name="wmode" value="transparent">
		                <param name="FlashVars" value="bcastr_file=images/img_01 (1).jpg|images/img_01 (2).jpg|images/img_01 (3).jpg|images/img_01 (4).jpg&bcastr_link=index.html&bcastr_title=&bcastr_config=0xffffff:文字颜色|2:文字位置|0x6399CC:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x6399CC:按键默认颜色|0x000033:按键当前颜色|3:自动播放时间(秒)|3:图片过渡效果|1:是否显示按钮|_blank:打开窗口">
		                <embed src="./files/swf/bcastr3.swf" FlashVars="bcastr_file=images/img_01 (1).jpg|images/img_01 (2).jpg|images/img_01 (3).jpg|images/img_01 (4).jpg&bcastr_link=index.html&bcastr_title=&bcastr_config=0xffffff:文字颜色|2:文字位置|0x6399CC:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x6399CC:按键默认颜色|0x000033:按键当前颜色|3:自动播放时间(秒)|3:图片过渡效果|1:是否显示按钮|_blank:打开窗口" width="682" height="240" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
              		</object>
   	 			</div>
   	 			<div id="middle_01"><img src="./images/small_01.jpg" width="100%" height="100%"/></div>
   	 			<div id="middle_02"><img src="./images/small_02.jpg" width="100%" height="100%"/></div>
   	 			<div id="middle_03"><img src="./images/small_03.jpg" width="95%" height="90%"/></div>
   	 		</div>
   	 	</div>
   	 	<div id="bottom_01">
   	 		<div id="bottom_01_title">
   	 			<div class="bottom_01_title_01" onmouseover="show(1)" onmouseout="hide(1)"><a href="#">热门推荐</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(2)" onmouseout="hide(2)" id="new_goods"><a href="#">新品上架</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(3)" onmouseout="hide(3)"><a href="#">热评商品</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(4)" onmouseout="hide(4)"><a href="#">礼品箱包</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(5)" onmouseout="hide(5)"><a href="#">外设产品</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(6)" onmouseout="hide(6)"><a href="#">体育用品</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(7)" onmouseout="hide(7)"><a href="#">手机数码</a></div>
   	 			<div class="bottom_01_title_01" onmouseover="show(8)" onmouseout="hide(8)"><a href="#">家用电器</a></div>
   	 		</div>
   	 		<div id="bottom_01_title_01_00">
	   	 			<s:iterator value="#application.goodsListOrderBySnum" var="bysnum" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#bysnum.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#bysnum.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm1" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm1"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#bysnum.gid'/>&pageNow=1">
		   	 						<s:property value="#bysnum.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
			   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#bysnum.sprice"/></font></span>
			   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal; margin-right: 12px;">销量：<s:property value="#bysnum.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 		</div>
   	 		<div id="bottom_01_title_01_01" onmouseover="show(1)" onmouseout="hide(1)">
					<s:iterator value="#application.goodsListOrderBySnum" var="bysnum" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#bysnum.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#bysnum.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm1" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm1"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#bysnum.gid'/>&pageNow=1">
		   	 						<s:property value="#bysnum.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
			   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#bysnum.sprice"/></font></span>
			   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#bysnum.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 		</div>
   	 		<div id="bottom_01_title_01_02" onmouseover="show(2)" onmouseout="hide(2)">
   	 				<s:iterator value="#application.goodsListOrderByPubTime" var="byPubTime" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#byPubTime.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#byPubTime.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#byPubTime.gid'/>&pageNow=1">
		   	 						<s:property value="#byPubTime.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#byPubTime.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#byPubTime.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 		</div>
   	 		<div id="bottom_01_title_01_03" onmouseover="show(3)" onmouseout="hide(3)">
   	 				
   	 				<s:iterator value="#application.highDiscuss" var="phoneAndDigital" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:property value="#phoneAndDigital.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">评论数：<s:property value="#phoneAndDigital.discusses.size()"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 				
   	 		</div>
   	 		<div id="bottom_01_title_01_04" onmouseover="show(4)" onmouseout="hide(4)">
   	 		
   	 				<s:iterator value="#application.giftBags" var="phoneAndDigital" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:property value="#phoneAndDigital.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#phoneAndDigital.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 		
   	 		</div>
   	 		<div id="bottom_01_title_01_05" onmouseover="show(5)" onmouseout="hide(5)">
   	 		
   	 				<s:iterator value="#application.computerParts" var="phoneAndDigital" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:property value="#phoneAndDigital.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#phoneAndDigital.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 		
   	 		</div>
   	 		<div id="bottom_01_title_01_06" onmouseover="show(6)" onmouseout="hide(6)">
   	 		
   	 				<s:iterator value="#application.sports" var="phoneAndDigital" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:property value="#phoneAndDigital.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#phoneAndDigital.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 					
   	 		</div>
   	 		<div id="bottom_01_title_01_07" onmouseover="show(7)" onmouseout="hide(7)">
   	 				
   	 				<s:iterator value="#application.phoneAndDigital" var="phoneAndDigital" status="stat">
	   	 				<div class="bottom_01_title_01_01_01">
		   	 				<div class="img_01">
		   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
						 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
		   	 				</div>
		   	 				<div class="goods_name">
		   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
		   	 						<s:property value="#phoneAndDigital.gname"/>
		   	 					</a>
		   	 				</div>
		   	 				<div class="goods_price">
		   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
		   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#phoneAndDigital.snum"/></span>
		   	 				</div>
		   	 			</div>
	   	 			</s:iterator>
   	 				
   	 		</div>
   	 		<div id="bottom_01_title_01_08" onmouseover="show(8)" onmouseout="hide(8)">
   	 					
   	 					<s:iterator value="#application.appliance" var="phoneAndDigital" status="stat">
		   	 				<div class="bottom_01_title_01_01_01">
			   	 				<div class="img_01">
			   	 					 <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
			   	 						<s:generator separator="," val="#phoneAndDigital.img" id="image1"></s:generator>
							 	 		<s:iterator value="#attr.image1" var="mm2" status="st" >
							 	 			<s:if test="#st.isFirst()">
							 	 				<img src="<s:property value="mm2"/>" width="181" height="160"/>
							 	 			</s:if>
							 	 		</s:iterator>
		   	 						</a>
			   	 				</div>
			   	 				<div class="goods_name">
			   	 				 	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#phoneAndDigital.gid'/>&pageNow=1">
			   	 						<s:property value="#phoneAndDigital.gname"/>
			   	 					</a>
			   	 				</div>
			   	 				<div class="goods_price">
			   	 				<span style="float: left;">￥<font size="4px" face="幼圆"><s:property value="#phoneAndDigital.sprice"/></font></span>
			   	 				<span style="float: right;font-size: 13px;color: gray; font-weight: normal;margin-right: 12px;">销量：<s:property value="#phoneAndDigital.snum"/></span>
			   	 				</div>
			   	 			</div>
		   	 			</s:iterator>
   	 					
   	 		</div>
   	 	</div>
   	 	<div id="bottom_02">
   	 		<div id="bottom_02_01">
   	 			<div id="bottom_02_title"><span>商品展示</span></div>
   	 			<div id="bottom_02_details">
   	 				<s:iterator value="#application.goods" var="goods">
   	 					<div class="bottom_02_details_01">
	   	 					<div class="bottom_02_details_img">
	   	 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.gid'/>&pageNow=1">
		   	 						<s:generator separator="," val="#goods.img" id="image"></s:generator>
						 	 		<s:iterator value="#attr.image" var="mm" status="st" >
						 	 			<s:if test="#st.isFirst()">
						 	 				<img src="<s:property value="mm"/>" width="192" height="190"/>
						 	 			</s:if>
						 	 		</s:iterator>
	   	 						</a>
	   	 					</div>
	   	 					<div class="bottom_02_goods_name"><a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.gid'/>&pageNow=1"><s:property value="#goods.gname"/></a></div>
	   	 					<div class="bottom_02_price">
	   	 						<span style="float: left;"><font  size="4" face="幼圆">￥<s:property value="#goods.sprice"/></font></span>
	   	 						<span style="float: right;font-size: 13px;color: gray; font-weight: normal;">销量：<s:property value="#goods.snum"/></span>
	   	 					</div>
   	 					</div>
   	 				</s:iterator>
   	 			</div>
   	 		</div>
   	 		<div id="bottom_02_02">
   	 			<div id="bottom_02_02_title">直通车</div>
   	 			<s:iterator value="#application.zhitongche" var="ztc">
   	 				<div class="bottom_02_details_01_01">
   	 					<div class="bottom_02_details_img_01">
   	 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#ztc.gid'/>&pageNow=1">
	   	 						<s:generator separator="," val="#ztc.img" id="image"></s:generator>
					 	 		<s:iterator value="#attr.image" var="mm" status="st" >
					 	 			<s:if test="#st.isFirst()">
					 	 				<img src="<s:property value="mm"/>" width="222" height="190"/>
					 	 			</s:if>
					 	 		</s:iterator>
   	 						</a>
   	 					</div>
   	 					<div class="bottom_02_goods_name_01">
   	 						<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#ztc.gid'/>&pageNow=1">
   	 							<s:property value="#ztc.gname"/>
   	 						</a>
   	 					</div>
   	 					<div class="bottom_02_price_01">
   	 					<span style="float: left;"><font  size="4" face="幼圆">￥<s:property value="#ztc.sprice"/></font></span>
   	 					<span style="float: right;font-size: 13px;color: gray; font-weight: normal;">销量：<s:property value="#ztc.snum"/></span>
   	 					</div>
   	 				</div>
   	 			</s:iterator>
   	 		</div>
   	 	</div>
   	 </div>
   	  <%@include file="./content/jb_foot.jsp" %>
  </body>
</html>
