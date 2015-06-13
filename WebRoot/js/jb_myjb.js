function down(m,n){
	//alert("123");
	var o=document.getElementById(m).style.display;
	if(o=='none'){
		document.getElementById(m).style.display = "block";
		document.getElementById(n).style.background = "url(./images/up.png)";
	}else{
		document.getElementById(m).style.display = "none";
		document.getElementById(n).style.background = "url(./images/down.png)";
	}
}

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