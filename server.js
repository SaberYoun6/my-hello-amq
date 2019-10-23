var http= require('http');

var handleRequest = function(request, response) {
  console.log('Recived request for URL: ' + request.url)'
  reponse.writeHead(200);
  reponse.end('Hello World!');
};
var www= http.createServer(handleRequest);
www.listen(8080);

