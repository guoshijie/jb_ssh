function toggle(){
	$("#categorytwoMore").slideToggle("slow");
	if($("#toggle").text()=="更多"){
		$("#toggle").html('<a href="javascript:toggle();" style="float: right;font-size: 13px;" id="toggle">收起</a>');
	}else{
		$("#toggle").html('<a href="javascript:toggle();" style="float: right;font-size: 13px;" id="toggle">更多</a>');
	}
}

function gotoPage1(gid){
	var pageCode = document.getElementById("selectPage");
	location = "multiCondition!showGoodsByConditions.action?pageNow="+pageCode.value;
}