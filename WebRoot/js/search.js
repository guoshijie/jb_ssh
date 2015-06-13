var data = new Array("android" , "apache" , "java" , "javaScript" , "jbpm" , "jquery");
var data2 = new Array();
var temp = [];
var xhr;

window.onkeyup = function(event){
	var result = $("#result");
	if(event.keyCode=="38"){
		var curr = $('.infoFocus').first();
		if(curr.length==0) {
			result.children().last().attr("class","infoFocus");
			return;
		}else if(curr.prev().length>0) {
			curr.prev().attr("class","infoFocus");
			curr.attr("class","info");
		}else {
			result.children().last().attr("class","infoFocus");
			curr.attr("class","info");
			return;
		}
	}else if(event.keyCode =="40") {
		var curr = $('.infoFocus').first();
		if(curr.length==0) {
			result.children().first().attr("class","infoFocus");
			return;
		}else if(curr.next().length>0) {
			curr.next().attr("class","infoFocus");
			curr.attr("class","info");
		}else {
			result.children().first().attr("class","infoFocus");
			curr.attr("class","info");
			return;
		}
	}else if(event.keyCode == "13") {
		var curr =$('.infoFocus').first();
		$('#search_text').val(curr.first().html());
		clearContent();
	}else {
		handlerMethod();
	}
}

function handlerMethod() {
	var key =  $("#search_text").val();
	if(key!=null && key!="" && key.length>0) {
		filterAndPopulate(key);//创建临时数组
		if(temp!=null && temp.length>0) {
			showRes(temp);	
		}else {
			clearContent();
		}
	}else {
		clearContent();
	}
}

//根据给定关键字，返回所包含的数组信息
function filterAndPopulate(key) {
	ajaxRequestBackArray();
	temp.length = 0;
	for(var i = 0 ; i < data2.length ; i++) {
		if(data2[i].indexOf(key)!=-1) {
			temp.push(data2[i]);
		}
	}
}

//ajax异步请求后台
function ajaxRequestBackArray(){
	var path = document.getElementById("path").value;
	//1.创建xhr对象	
	xhr = new XMLHttpRequest();//IE7.0+版本可以
	//2.指定交互路径
	xhr.open("post", path+"searches!execute.action", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");//定义传输的文件HTTP头信息
	//3.指定回调函数
	xhr.onreadystatechange = function (){
		if(xhr.readyState==4&&xhr.status==200){
			var result = eval('('+xhr.responseText+')');
			data2 = result;
		}
	}
	//4.开始发出异步请求
	xhr.send(null);
}


function showRes(){
	var result = $('#result');
	//清空区域
	clearContent();
	//根据数据内容创建显示区域
	for(var i = 0 ; i<temp.length ; i++) {
		var txt=$('<div class="info" ></div>').text(temp[i]).mouseover(function () {
			this.className = 'infoFocus';
		}).mouseout(function () {
			this.className = 'info';
		}).click(function (){
			$('#search_text').val($(this).text());
			clearContent();
		});
		result.append(txt);
	}
	
}

function clearContent() {
	$('#result').empty();
}