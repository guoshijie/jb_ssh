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
    
    <title>聚宝后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./admin/files/css/Default.css" type="text/css"></link>
	<link rel="stylesheet" href="./admin/files/css/User_Login.css" type="text/css"></link>
	<link rel="stylesheet" href="./admin/files/css/xtree.css" type="text/css"></link>
	<link rel="stylesheet" href="./admin/files/css/verificationCode.css" type="text/css"></link>
	<script type="text/javascript" src="./admin/files/js/login.js"></script>
	<script type="text/javascript" src="./admin/files/js/verificationCode.js"></script>
 </head>
  
 <BODY id=userlogin_body onload="createCode()">
 	<form id="form1" name="form1" method="post" action="adminLogin.action" onsubmit="return checkLogin();">
	<DIV></DIV>

	<DIV id=user_login>
		<DL>
		  		<DD id=user_top>
		  		<UL>
		   			 <LI class=user_top_l></LI>
		    		 <LI class=user_top_c></LI>
		    		 <LI class=user_top_r></LI>
		        </UL>
		  		<DD id=user_main>
		  		<UL>
		    			<LI class=user_main_l></LI>
		   <LI class=user_main_c>
		   <DIV class=user_main_box>
		    	<UL>
			      <LI class=user_main_text>用户名： </LI>
			      <LI class=user_main_input>
			      	<INPUT class=TxtUserNameCssClass maxLength=20 name="uname" id="uname"> 
			      </LI>
		    </UL>
		    <UL>
		      		<LI class=user_main_text>密 码： </LI>
		      		<LI class=user_main_input>
		      				<INPUT class=TxtPasswordCssClass type=password name="pwd" id="pwd"> 
		      		</LI>
		    </UL>
		    <UL>
		      		<LI class=user_main_text>验证码： </LI>
		      		<LI class=user_main_input>
							<input  type="text"   id="input1" style="width: 70px;font-weight: bold;letter-spacing:2px;"/>  
    						<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged" style="width: 80px"  /><br />  
		       	   </LI>
		    </UL>
		    <ul>
		    	<li style="color:red; font-size:13px;"><s:property value="#request.login"/></li>
		    </ul>
		    </DIV>
		    </LI>
		    <LI class=user_main_r>
		    	<INPUT type="submit" name=IbtnEnter class=IbtnEnterCssClass id=IbtnEnter  value=" " style="background:url('./admin/files/images/user_botton.gif');  BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px;" >
		    </LI>
		   </UL>
		   <DD id=user_bottom>
  				<UL>
				    <LI class=user_bottom_l></LI>
				    <LI class=user_bottom_c></LI>
				    <LI class=user_bottom_r></LI>
				</UL>
		   </DD>
		</DL>
	</DIV>
	</form>
</BODY>
</html>
