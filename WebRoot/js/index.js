function show(o){
	switch(o){
	  case 1:	var dd = document.getElementById("bottom_01_title_01_01");dd.style.display="block";break;
	  case 2:	var dd = document.getElementById("bottom_01_title_01_02");dd.style.display="block";break;
	  case 3:	var dd = document.getElementById("bottom_01_title_01_03");dd.style.display="block";break;
	  case 4:	var dd = document.getElementById("bottom_01_title_01_04");dd.style.display="block";break;
	  case 5:	var dd = document.getElementById("bottom_01_title_01_05");dd.style.display="block";break;
	  case 6:	var dd = document.getElementById("bottom_01_title_01_06");dd.style.display="block";break;
	  case 7:	var dd = document.getElementById("bottom_01_title_01_07");dd.style.display="block";break;
	  case 8:	var dd = document.getElementById("bottom_01_title_01_08");dd.style.display="block";break;
	  default:break;
	}
}

function hide(o){
	switch(o){
	  case 1:	var dd = document.getElementById("bottom_01_title_01_01");dd.style.display="none";break;
	  case 2:	var dd = document.getElementById("bottom_01_title_01_02");dd.style.display="none";break;
	  case 3:	var dd = document.getElementById("bottom_01_title_01_03");dd.style.display="none";break;
	  case 4:	var dd = document.getElementById("bottom_01_title_01_04");dd.style.display="none";break;
	  case 5:	var dd = document.getElementById("bottom_01_title_01_05");dd.style.display="none";break;
	  case 6:	var dd = document.getElementById("bottom_01_title_01_06");dd.style.display="none";break;
	  case 7:	var dd = document.getElementById("bottom_01_title_01_07");dd.style.display="none";break;
	  case 8:	var dd = document.getElementById("bottom_01_title_01_08");dd.style.display="none";break;
	  default:break;
	}
}

function show_(o,n){
	var m = document.getElementById(o);
	var x = document.getElementById(n);
	m.style.borderTop = "1px solid #e4393c";
	m.style.borderBottom = "1px solid #e4393c";
	m.style.backgroundColor = "#ffffff";
	x.style.display = 'block';
}

function hide_(o,n){
	var m = document.getElementById(o);
	var x = document.getElementById(n);
	m.style.background = "#ffffff";
	m.style.border = "none";
	x.style.display = 'none';
}

