var ini  = 1
var fin = 89
var actual = 1
var distP = 0

var bandsBtns = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, 
		 false, false, false, false, false, false, false, false, false, false, false, false];

var lugares = [];
var cant = 0;
var stringLug;

function cambiaColor(id){
	if(bandsBtns[id - 1] == false){
		document.getElementById(id).style.backgroundColor = "#cc0000";
		bandsBtns[id - 1] = true;
		lugares[cant] = id;
		cant++;
		stringLug = lugares.toString();
		
	}else{
		// document.getElementById(id).style.backgroundColor = "#4545cc";
		document.getElementById(id).style.backgroundColor = "#0066cc";
		bandsBtns[id - 1] = false;
		var aux = [];

		var i = lugares.indexOf(id);
		for(var j=0; j<i;j++){
			aux[j]=lugares[j];
		}
		for(var j=i+1;j<lugares.length;j++){
			aux[j-1] = lugares[j];
		}
		lugares = aux;
		cant--;
		console.log(lugares);
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
	for (i = 1; i < arr.length; i++) { 
    	document.getElementById(arr[i]).style.backgroundColor = "#cc0000";
    	bandsBtns[arr[i] - 1] = true;
	}
	distP += parseFloat(arr[0]);

}

function calculaCamino2(){
	for(var i=0; i < lugares.length - 1; i++){
		ini = lugares[i];
		fin = lugares[i+1];
		calculaCamino();
	}
	document.getElementById("escondeD").style.display = "block";
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
	lugares=[];
	cant = 0;
	stringLug = lugares.toString();
	document.getElementById("arrC").innerHTML = stringLug;
	for(var i=0;i<89;i++){
		if(bandsBtns[i] == true){
			document.getElementById(i+1).style.backgroundColor = "#0066cc";
			bandsBtns[i]=false;
		}
	}
	distP = 0;
	document.getElementById("escondeD").style.display = "none";
	document.getElementById("escondeT").style.display = "none";
	document.getElementById("escondeT2").style.display = "none";
	document.getElementById("dist").innerHTML = "";
	document.getElementById("tiempo").innerHTML = "";
	document.getElementById("vel").value = "";
}

function calculaDist(){
	
	distP = distP * 6.07676;
	document.getElementById("dist").innerHTML = distP.toString()+"km";
	document.getElementById("escondeT").style.display = "block";
}

function muestraT(){
	document.getElementById("escondeT2").style.display = "block";
}

function calculaT(){	
	var v =  parseInt(document.getElementById("vel").value);
	console.log(v);
	var t = distP/v;
	document.getElementById("tiempo").innerHTML = t.toString()+"h";
}