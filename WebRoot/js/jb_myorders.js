function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "obtainAllOrdersByUser!obtainAllOrdersByUser.action?pageNow="+pageCode.value;
}

function selAll(){
	var len = document.getElementsByName("id");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
	}
}

function noSelAll(){
	var len = document.getElementsByName("id");
	for(i=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			len[i].checked=false;
		}
	}
}

function del(){
	if(window.confirm("确定要删除选中定单吗 ? ")) { // true / false
		return true;
	}else{
		return false;
	}
}