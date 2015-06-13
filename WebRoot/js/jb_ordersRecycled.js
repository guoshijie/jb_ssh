function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "ordersRecycle!ordersRecycle.action?pageNow="+pageCode.value;
}

function selAll(){
	var len = document.getElementsByName("oid");
	for(i=0;i<len.length;i++)
	{
		if(!len[i].checked)
		{
			len[i].checked=true;
		}
	}
}

function noSelAll(){
	var len = document.getElementsByName("oid");
	for(i=0;i<len.length;i++)
	{
		if(len[i].checked)
		{
			len[i].checked=false;
		}
	}
}