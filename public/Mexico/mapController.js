var ini  = 1
var fin = 89
var actual = 1

var bandsBtns = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false];

var lugares = [];
var stringLug;

function cambiaColor(id){
	if(bandsBtns[id - 1] == false){
		document.getElementById(id).style.backgroundColor = "#cc0000";
		bandsBtns[id - 1] = true;
		lugares.push(id);
		stringLug = lugares.toString();
		
	}else{
		// document.getElementById(id).style.backgroundColor = "#4545cc";
		document.getElementById(id).style.backgroundColor = "#0066cc";
		bandsBtns[id - 1] = false;
		lugares.pop();
		stringLug = lugares.toString();
	}
	document.getElementById("arrC").innerHTML = stringLug;
	actual = id
}

function setIni(){
	ini = actual
}

function setFin(){
	fin = actual
}

function añade(){
	fin = actual
}

function pinta(arr){
	for (i = 0; i < arr.length; i++) { 
    	document.getElementById(arr[i]).style.backgroundColor = "#1fca00";
    	bandsBtns[arr[i] - 1] = true;
	}
}

function calculaCamino2(){
	for(var i=0; i < lugares.length - 1; i++){
		ini = lugares[i];
		fin = lugares[i+1];
		calculaCamino();
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

function limpia(){
	while(lugares.length != 0){
		lugares.pop();
	}
	stringLug = lugares.toString();
	document.getElementById("arrC").innerHTML = stringLug;
	for(var i=0;i<89;i++){
		if(bandsBtns[i] == true){
			document.getElementById(i+1).style.backgroundColor = "#0066cc";
			bandsBtns[i]=false;
		}
	}
}