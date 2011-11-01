var sys = require('sys');
var config = require('./config').config;

var irc = require('./lib/irc');
var fs = require('fs');
var path = require('path');
var repl = require('repl');

sys.puts(sys.inspect(config));

var
  client = new irc.Client(config.host, config.port),
  inChannel = false;

client.connect(config.user);

client.addListener('001', function() {
  this.send('JOIN', config.channel);
});

repl.start("logbot> ");
