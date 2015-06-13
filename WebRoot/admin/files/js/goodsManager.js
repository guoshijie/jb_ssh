function isDel(){
//	alert();
	if(window.confirm("确定下架选中商品么 ? ")) { // true / false
		return true;
	}else{
		return false;
	}
}

function gotoPage1(){
	var pageCode = document.getElementById("selectPage");
	location = "manageAllGoods!manageAllGoods.action?pageNow="+pageCode.value;
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

function pageOnLoad(){
	categoryAction.getAllRootCategory(populate);
}

function populate(data){
	dwr.util.removeAllOptions("info");
	dwr.util.addOptions("info",data);
}

function showTwo(){
	var id = document.getElementById("info").value;
	categoryAction.getChildCategoryById(id,populate2);
}

function populate2(data){
	dwr.util.removeAllOptions("info2");
	dwr.util.addOptions("info2",data);
	showThree();
}

function showThree(){
	var id = document.getElementById("info2").value;
	categoryAction.getChildCategoryById(id,populate3);
}

function populate3(data){
	dwr.util.removeAllOptions("info3");
	dwr.util.addOptions("info3",data);
}

function deleteTheMeg(){
	var meg = document.getElementById("meg");
	meg.innerHTML = "<label id='meg'></label>";
}

window.onload = function(){
	pageOnLoad();
}
