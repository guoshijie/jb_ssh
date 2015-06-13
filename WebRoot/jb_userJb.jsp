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
    
    <title>我的聚宝</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/jb_userJb.css">
  </head>
  
  <body>
    <div id="main">
    	<div id="title">个人信息</div>
    	<div id="content">
    		<div id="content_top">
    			<div id="content_top_left">
    				<s:if test="#session.jbuser.headImg!=null">
    					<img src="<s:property value='#session.jbuser.headImg'/>" width="180" height="170" border="1">
    				</s:if>
    				<s:else>
    					<img src="./images/tx.jpg" width="180" height="170" border="1">
    				</s:else>
    			</div>
    			<div id="content_top_right">
    				<div id="content_top_right_name">
    					<s:property value="#session.jbuser.uname"/><font size="2" color="#aaaaaa"> 欢迎你！</font>
    					<label class="modifyUserInfo"><a href="queryCurUserDetails!queryCurUserDetails.action">[修改信息]</a></label>
    				</div>
    				<div id="content_top_right_money">
    					<span>帐户余额：￥<s:property value="#session.jbuser.money"/></span>
    					<span style="margin-left: 30px;">等级：<s:property value="#session.jbuser.level.level"/>&nbsp;级</span>
    					<span style="margin-left: 30px;">共消费:￥12000</span>
    					<span style="margin-left: 30px;">邮箱：<s:property value="#session.jbuser.email"/></span>
    				</div>
    				<div id="content_top_right_notion">
    					<font size="3" color="#000000">定单提醒：</font><span class="margin_left">待处理定单(0)</span><span class="margin_left"><a href="obtainAllOrdersByUser!obtainAllOrdersByUser.action?pageNow=1">待评价商品(<s:property value="#session.numNoDiscussItems"/>)</a></span><br>
    					<font size="3" color="#000000">我的关注：</font><span class="margin_left">降价商品(0)</span><span class="margin_left" style="margin-left: 45px">团购商品(0)</span><br>
    				    <font size="3" color="#000000">消息精灵：</font><span class="margin_left">提醒通知(0)</span><span class="margin_left" style="margin-left: 45px">已回复的咨询(0)</span><br>
    				</div>
    			</div>
    		</div>
    		<div id="content_bottom">
    			<div id="content_bottom_title">热卖商品</div>
    			<div id="content_bottom_goods">
    					<div   id=demo   style= 'overflow:hidden;height:200px;width:980px; '> 
				              <table width="950" height=200   border=0   cellspacing=0   cellpadding=0> 
				                <tr> 
				                   <td   id=demo1> 
				                      <!--   下面是你要显示的内容   --> 
				                      <table   width=750 height=200 border=0 cellspacing="5" cellpadding="5"> 
				                          <tr align="center"> 
				                              <s:iterator value="#application.goods" var="goods" status="st">
					                              <td valign="top" width="160px">
					                              <a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.gid'/>" target="blank">
							   	 						<s:generator separator="," val="#goods.img" id="image"></s:generator>
											 	 		<s:iterator value="#attr.image" var="mm" status="st" >
											 	 			<s:if test="#st.isFirst()">
											 	 				<img src="<s:property value="mm"/>" width="140" height="130" border="0"/>
											 	 			</s:if>
											 	 		</s:iterator>
						   	 						</a>
					                              	<div id="cycleImg"  style="overflow: hidden;	white-space: nowrap; text-overflow:ellipsis; width: 150px;">
					                              	<a href="goodsDetails!getGoodsById.action?gid=<s:property value='#goods.gid'/>" target="blank">
					                              			<s:property value="#goods.gname"/>
					                              	</a></div>
					                              	<div>价格：<font color="red" style="font-weight: bold;">￥<s:property value="#goods.sprice"/></font></div>
					                              </td>
				                              </s:iterator>
				                         </tr> 
				                      </table> 
				                    <!--   显示的内容结束！   -->
				                   </td> 
				                   <td   id=demo2> </td> 
				                 </tr> 
				               </table> 
						               <script> 
						                  var   speed=40 
						                  demo2.innerHTML=demo1.innerHTML 
						                  function   Marquee(){ 
						                  if(demo2.offsetWidth-demo.scrollLeft <=0) 
						                  demo.scrollLeft-=demo1.offsetWidth 
						                  else{ 
						                      demo.scrollLeft++ 
						                     } 
						                  } 
						                  var   MyMar=setInterval(Marquee,speed) 
						                 demo.onmouseover=function()   {clearInterval(MyMar)} 
						                 demo.onmouseout=function()   {MyMar=setInterval(Marquee,speed)} 
						              </script> 
				     </div>
    			</div>
    		</div>
    	</div>
    </div>
  </body>
</html>
