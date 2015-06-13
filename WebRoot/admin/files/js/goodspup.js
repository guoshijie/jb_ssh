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
