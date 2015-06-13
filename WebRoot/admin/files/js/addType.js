function showTwo(id){
	categoryAction.getChildCategoryById(id,populate);
}

function populate(data){
	dwr.util.removeAllOptions("info2");
	dwr.util.addOptions("info2",data);
	dwr.util.addOptions("info2",[{name:'二级标题',id:''}],'id','name');
}

function showThree(){
	var id = document.getElementById("info2").value;
	categoryAction.getChildCategoryById(id,populate3);
}

function populate3(data){
	dwr.util.removeAllOptions("info3");
	dwr.util.addOptions("info3",data);
	dwr.util.addOptions("info3",[{name:'三级标题',id:''}],'id','name');

}
