http = require "http"

http.createServer( (request, response) ->
  response.writeHead 200, {'Content-Type': 'text/plain'}
  response.end 'Hello World'
).listen 1337

console.log "Server running at http://127.0.0.1:1337/"
