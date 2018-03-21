var ini  = 1
var fin = 89
var actual = 1

var bandsBtns = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false];


function cambiaColor(id){
	if(bandsBtns[id - 1] == false){
		document.getElementById(id).style.backgroundColor = "#cc0000";
		bandsBtns[id - 1] = true;
	}else{
		document.getElementById(id).style.backgroundColor = "#666699";
		bandsBtns[id - 1] = false;
	}

	actual = id
}

function setIni(){
	ini = actual
}

function setFin(){
	fin = actual
}
function pinta(arr){
	for (i = 0; i < arr.length; i++) { 
    document.getElementById(arr[i]).style.backgroundColor = "#33cc33";
}
}

function calculaCamino(){
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var res = JSON.parse( this.responseText );
	     pinta(res.camino)
	    }
	  };
	  xhttp.open("GET", "http://localhost:8080/?ini="+ini+"&fin="+fin, true);
	  xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	  xhttp.send();
}