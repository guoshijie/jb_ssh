function isDel(){
	if(window.confirm("确定要删除么 ? ")) { // true / false
		return true;
	}else{
		return false;
	}
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

function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "newsManage!newsManage.action?pageNow="+pageCode.value;
}
