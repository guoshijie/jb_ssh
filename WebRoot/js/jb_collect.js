function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "getCollectListByPage!getCollectListByPage.action?pageNow="+pageCode.value;
}

function cancel_collect(){
	if(window.confirm("确定要取消收藏吗 ? ")) { // true / false
		return true;
	}else{
		return false;
	}
}

function selAll(){
	var len = document.getElementsByName("selGoods");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
	}
}

function noSelAll(){
	var len = document.getElementsByName("selGoods");
	for(i=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			len[i].checked=false;
		}
	}
}
