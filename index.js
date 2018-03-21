var express = require('express');
var app = express();
const { exec } = require('child_process');
var portNum = 8080;

function formateaLista(lst){
	lst = lst.trim()
	arr =  lst.substr(1,lst.length-2).split(" ");
	return arr
}

app.get('/', function(req, res){
	idIni = req.query.ini
	idFin = req.query.fin
	r = {"status" : null, "camino":null}

	exec('./main.lisp '+idIni+' '+ idFin, (err, stdout, stderr) => {
  if (err) {
  	r.status = "error"
    res.send(r)
    return;
  }

  // the *entire* stdout and stderr (buffered)
  //console.log(stdout);
  r.status = "exito"
  r.camino = formateaLista(stdout)
  res.send(r)
  //console.log(`stderr: ${stderr}`);
});
	//res.send('Holi')
})

app.get('/prueba', function(req, res){
	res.send(req.param('p'))
})

app.listen(portNum, function (){
	console.log('Servidor en puerto: '+ portNum)
})

