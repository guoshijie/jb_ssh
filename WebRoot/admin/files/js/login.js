function checkLogin(){
	
	var name = document.getElementById("uname");
	name = name.value.replace(/(^\s*)|(\s*$)/g,'');
	var pwd = document.getElementById("pwd");
	pwd = pwd.value.replace(/(^\s*)|(\s*$)/g,'');
	
	if(name==''){
		alert("用户名不能为空");
		return false;
	}else if(pwd==''){
		alert("密码不能为空");
		return false;
	}else{
		return validate();
	}
	return true;
}

function submitForm(){
	document.getElementById('form1').submit();
}

function validate ()  
{  
  var inputCode = document.getElementById("input1").value;  
  if(inputCode.length <=0)  
  {  
      alert("请输入验证码！");  
      return false;
  }  
  else if(inputCode.toUpperCase() != code )  
  {  
     alert("验证码输入错误！");  
     document.getElementById("input1").value = "";
     createCode();//刷新验证码 
     return false;
  }  
  else  
  {  
    return true;
  }  
}