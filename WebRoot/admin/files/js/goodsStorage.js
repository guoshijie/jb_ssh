function isDel(){
//	alert();
	if(window.confirm("确定上架选中商品么 ? ")) { // true / false
		return true;
	}else{
		return false;
	}
}

function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "getStorageGoodsByPage!getStorageGoodsByPage.action?pageNow="+pageCode.value;
}

function selAll()
{
	var len = document.getElementsByName("id");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
	}
}

function noSelAll()
{
	var len = document.getElementsByName("id");
	for(i=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			len[i].checked=false;
		}
	}
}