var xhr;

function findChild(id){
	xhr = new XMLHttpRequest();
	xhr.open("post", "Http://localhost:8080/jb_ssh/getTypeById.action" , true );
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = handler;
	xhr.send("id="+id);
}
function handler(){
	if(xhr.readyState == 4 && xhr.status == 200) { 
		
		alert("success");
		// 如果成功交互并返回数据, 开始接收服务器端的 响应数据
		var result = eval('('+ xhr.responseText+')');
		// 判断如果可用 span : res 为 ok / 反之 err
		
		alert(result);
	} else {
		
	}
}