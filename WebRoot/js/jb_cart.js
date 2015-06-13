function plus(o,id){
	var v=document.getElementById(id);
	switch(o){
		case '-': 
			var s=v.value; 
			if(s<=1){
				return false;
			}
			else{
				v.value=s-1;
				cutOneGoodsToCartSession(id);
			};
			getCartGoodsNum();
			break;
		case '+': 
			var m=v.value; 
			v.value=parseInt(m)+1;
			addOneGoodsToCartSession(id);
			getCartGoodsNum();
			break;
		default: break;
	}
	getSum(id);
}

function getSum(id){
	var price = document.getElementById("price"+id).innerHTML;	//单价
	var num = document.getElementById(id).value;	//数量
	var result = changeTwoDecimal(price*num);
	result = parseFloat(result).toFixed(1);
	
	var itemSum = document.getElementById("lbl"+id);
	itemSum.innerHTML = '<label id="lbl'+id+'">'+result+'</label>';
	
	var hiddenItemAmt = document.getElementById("hiddenItemAmt"+id);
	hiddenItemAmt.value = result;
	getCartSumPrice();
}

//aJax
function addOneGoodsToCartSession(gid){
	var xhr;
	var path = document.getElementById("path").value;
	//1.创建xhr对象	
	xhr = new XMLHttpRequest();//IE7.0+版本可以
	//2.指定交互路径
	xhr.open("post", path+"addGoodsToCartByAjax!addGoodsToCartByAjax.action", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");//定义传输的文件HTTP头信息
	//3.指定回调函数
	xhr.onreadystatechange = function(){};	
	//4.开始发出异步请求
	xhr.send("gid="+gid);
}

function cutOneGoodsToCartSession(gid){
	var xhr;
	var path = document.getElementById("path").value;
	//1.创建xhr对象	
	xhr = new XMLHttpRequest();//IE7.0+版本可以
	//2.指定交互路径
	xhr.open("post", path+"cutGoodsToCart!cutGoodsToCart.action", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");//定义传输的文件HTTP头信息
	//3.指定回调函数
	xhr.onreadystatechange = function(){};	
	//4.开始发出异步请求
	xhr.send("gid="+gid);
}

function getCartGoodsNum(){
	var snum = document.getElementsByName("goodsNum");
	var sumCount = document.getElementById("sumCount");
	var sum = 0;
	for(i=0;i<snum.length;i++){
		sum+=parseInt(snum[i].value);
	}
	sum = changeTwoDecimal(sum);
	sumCount.innerHTML = '<label id="sumCount">'+sum+'</label>';
}

//计算购物车总价
function getCartSumPrice(){
	var sumPrice_01 = document.getElementById("sumPrice_01");
	var sumPrice_02 = document.getElementById("sumPrice_02");
	var snum = document.getElementsByName("hiddenItemAmt");
	var sumprice = 0.0;
	for(i=0;i<snum.length;i++){
		sumprice+=parseFloat(snum[i].value);
	}
	sumprice = changeTwoDecimal(sumprice).toFixed(1);
	sumPrice_01.innerHTML = '<label id="sumPrice_01">'+sumprice+'</label>';
	sumPrice_02.innerHTML = '<label id="sumPrice_02">'+sumprice+'</label>';
}

function changeTwoDecimal(floatvar){
	var f_x = Math.round(floatvar*100)/100;
	return f_x;
}

function selAllGoodsInCart(){
	var len = document.getElementsByName("sel_cart_goodsArray");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
	}
}

function reverseSelAllGoodsInCart(){
	var len = document.getElementsByName("sel_cart_goodsArray");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
		else
		{
			len[i].checked=false;
		}
	}
}

function noSelAllGoodsInCart(){
	var len = document.getElementsByName("sel_cart_goodsArray");
	for(i=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			len[i].checked=false;
		}
	}
}

function confirm_delGoods(){
	if(window.confirm("确定删除选中商品吗 ? ")) { // true / false
		var len = document.getElementsByName("sel_cart_goodsArray");
		var array = new Array();
		for(i=0,j=0;i<len.length;i++)
		{
			if(len[i].checked)
			{
				array[j] = len[i].value;
				j++;
			}
		}
		//1.创建xhr对象	
		xhr = new XMLHttpRequest();//IE7.0+版本可以
		//2.指定交互路径
		xhr.open("get","delBatchGoodsFromCart!delBatchGoodsFromCart.action?gid_array="+array, true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");//定义传输的文件HTTP头信息
		//3.指定回调函数
		xhr.onreadystatechange = function(){
			location.reload(true);
		};	
		//4.开始发出异步请求
		xhr.send(null);
		//window.location.reload();
		return true;
	}else{
		return false;
	}
}

function commitForm(){
	var len = document.getElementsByName("sel_cart_goodsArray");
	var array = new Array();
	for(i=0,j=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			array[j] = len[i].value;
			j++;
		}
	}
	//1.创建xhr对象	
	xhr = new XMLHttpRequest();//IE7.0+版本可以
	//2.指定交互路径
	xhr.open("get","settleAccounts!settleAccounts.action?gid_array="+array, true);
	//3.指定回调函数
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			window.location.href = 'jb_cart_02.jsp';
		}else{
			window.location.href = 'jb_cart.jsp';
		}
	};	
	//4.开始发出异步请求
	xhr.send(null);
	
}

//刷新当前页面
function refresh(){
	window.location.reload();
}


