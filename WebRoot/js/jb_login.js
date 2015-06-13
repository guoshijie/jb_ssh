function check(){
	
	var name = document.getElementById("uname");
	var pwd = document.getElementById("pwd");
	var labela = document.getElementById("label_01");
	var labelb = document.getElementById("label_02");
	if(name.value.replace(/(^\s*)|(\s*$)/g,'') === ""){
		//alert("234");
		labela.innerHTML="<label id='label_01'>*用户名不能为空!</label>";
		return false;
	}else if(name.value.replace(/(^\s*)|(\s*$)/g,'') !== "" && pwd.value.replace(/(^\s*)|(\s*$)/g,'') === ""){
		labela.innerHTML="<label id='label_01'></label>";
		labelb.innerHTML="<label id='label_02'>*密码不能为空!</label>";
		return false;
	}
}

function isNull(){
	var name = document.getElementById("uname");
	var pwd = document.getElementById("pwd");
	var labela = document.getElementById("label_01");
	var labelb = document.getElementById("label_02");
	if(name.value.replace(/(^\s*)|(\s*$)/g,'') === ""){
		//alert("234");
		labela.innerHTML="<label id='label_01'>*用户名不能为空!</label>";
		return false;
	}else if(name.value.replace(/(^\s*)|(\s*$)/g,'') !== "" && pwd.value.replace(/(^\s*)|(\s*$)/g,'') === ""){
		labela.innerHTML="<label id='label_01'></label>";
		labelb.innerHTML="<label id='label_02'></label>";
		return false;
	}
}

