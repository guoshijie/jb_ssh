function getDiscussByPage(str,gid){
	var xhr;
	var path = document.getElementById("path").value;
	var iframeid = document.getElementById("right_01");
	//1.创建xhr对象	
	xhr = new XMLHttpRequest();//IE7.0+版本可以
	//2.指定交互路径
	xhr.open("post", path+"discussByPage!discussByPage.action", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");//定义传输的文件HTTP头信息
	//3.指定回调函数
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			iframeid.src='jb_goodsDiscuss.jsp';
		}else{
			iframeid.src='jb_noGoodsDiscuss.jsp';
		}
	};	
	//4.开始发出异步请求
	xhr.send("gid="+gid+"&discussCondition="+str+"&pageNow="+1);
}
