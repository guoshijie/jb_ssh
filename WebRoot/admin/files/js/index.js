function submitForm(){
	 var myform = document.getElementById('form1');
  	 myform.submit();
}

function SetWinHeight(obj)
{
 var win=obj;
 if (document.getElementById)
 {
      if (win && !window.opera)
     {
         if (win.contentDocument && win.contentDocument.body.offsetHeight)
          {
              if(win.contentDocument.body.offsetHeight<596){
                   win.height = 596;//设置最小高度
              }else{
                   win.height = win.contentDocument.body.offsetHeight;
               }
          } else if(win.Document && win.Document.body.scrollHeight)
                win.height = win.Document.body.scrollHeight;
          }
     }
}