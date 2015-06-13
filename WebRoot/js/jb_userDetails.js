function isCheck(){
	var pwd = document.getElementById("pwd");
	pwd = pwd.value.replace(/(^\s*)|(\s*$)/g,'');
	var tpwd = document.getElementById("confirm_pwd");
	tpwd = tpwd.value.replace(/(^\s*)|(\s*$)/g,'');
	var email = document.getElementById("email");
	email = email.value.replace(/(^\s*)|(\s*$)/g,'');
	var label1 = document.getElementById("label1");
	var label2 = document.getElementById("label2");
	var label3 = document.getElementById("label3");
	var label4 = document.getElementById("label4");
	var em =  /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
	
	if(pwd !== ''){
		label2.innerHTML="<label id='label2'><font style='color:#4BB100;'>&nbsp;正确</font></label>";
	}else{
		label2.innerHTML="<label id='label2'>*密码不能为空!</label>";
		return false;
	}
	if(tpwd !== '' && tpwd == pwd){
		label3.innerHTML="<label id='label3'><font style='color:#4BB100;'>&nbsp;正确</font></label>";
	}else if(tpwd != pwd && tpwd !== ''){
		label3.innerHTML="<label id='label3'><font style='color:red;font-size:12px;'>两次输入密码不一致</font></label>";
		return false;
	}else{
		label3.innerHTML="<label id='label3'><font style='font-size:12px;color:red;'>*确认密码不能为空!</font></label>";
		return false;
	}
	if(em.test(email)){
		label4.innerHTML="<label id='label4'><font style='color:#4BB100;'>&nbsp;格式正确</font></label>";
	}else{
		label4.innerHTML="<label id='label4'><font style='color:red;font-size:12px;'>*邮箱格式不正确!</font></label>";
		return false;
	}
	return true;
}

var xhr;

function checkName(){
	
	var path = document.getElementById("path").value;
	//获取控件的数据
	var uname = document.getElementById("uname").value;
	uname = uname.replace(/(^\s*)|(\s*$)/g,'');
	if(uname === ""){
		//label1.value = "*用户名不能为空";
		label1.innerHTML="<label id='label1'><font style='color:red;font-size:12px;'>*用户名不能为空!</font></label>";
	}else{
		//1.创建xhr对象	
		xhr = new XMLHttpRequest();//IE7.0+版本可以
		//2.指定交互路径
		xhr.open("post", path+"hasUser!hasUser.action", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//3.指定回调函数
		xhr.onreadystatechange = handler;	//函数引用，加上()的话指调用
		//4.开始发出异步请求
		xhr.send("uname="+uname);
	}
}

function handler(){//这个函数用来显示用户名是否可用
	//http(200,400,404,500) 
	//ajax状态：初始化，1、准备中，2、开始交互，3、交互过程中，4、交互完成
	var res = document.getElementById("label1");
	if(xhr.readyState==4&&xhr.status==200){
		//如果成功交互并返回数据，开始接收服务器返回的数据
		//var result = xhr.responseText;		//用result接收
		var result = eval('('+xhr.responseText+')');
		//alert(result);
		if(result){
			res.innerHTML = "<label id='label1'><font style='color:red;font-size:13px;'>*已存在此用户名!</font></label>";
		}else{
			res.innerHTML ="<label id='label1'><font style='color:#4BB100;'>可以使用</font></label> ";
		}
	}else{
		res.innerHTML="<img src='./images/loading2.gif' width='20' height='20'/>";
	}
}