//让Iframe自动适应高度
function SetWinHeight(obj)
{
 var win=obj;
 if (document.getElementById)
 {
  if (win && !window.opera)
 {
 if (win.contentDocument && win.contentDocument.body.offsetHeight)
  {
  if(win.contentDocument.body.offsetHeight<435){
   win.height = 435;//设置最小高度
  }else{
   win.height = win.contentDocument.body.offsetHeight;
   }
  }
  else if(win.Document && win.Document.body.scrollHeight)
  win.height = win.Document.body.scrollHeight;
  }
 }
}

function gotoPage1(gid){
	var pageCode = document.getElementById("selectPage");
	location = "discussByPage!discussByPage.action?gid="+gid+"&pageNow="+pageCode.value;
}