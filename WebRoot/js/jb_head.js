 function time(){
	    //获得显示时间的div
	   t_div = document.getElementById('time');
	   var now=new Date()
	   var sec=now.getSeconds();
	   var min=now.getMinutes();
	   var hour=now.getHours();
	   if(hour<10){
	   		hour="0"+hour;
	   }
	   if(sec<10){
	   		sec="0"+sec;
	   }
	   if(min<10){
	   		min="0"+min;
	   }
	    //替换div内容 
	   t_div.innerHTML = ""+now.getFullYear()
	    +"/"+(now.getMonth()+1)+"/"+now.getDate()
	    +" "+hour+":"+min
	    +":"+sec+"";
	    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
	   setTimeout(time,1000);
}