sys = require 'sys'
config = require('./config').config

irc = require './lib/irc'
path = require 'path'
repl = require 'repl'

sys.puts(sys.inspect(config))

client = new irc.Client(config.host, config.port)

client.connect(config.user)

client.addListener '001', ->
  this.send('JOIN', config.channel)

client.addListener 'PRIVMSG', (prefix, channel, text) ->
  switch(text) 
    when "!test" then @send('PRIVMSG', channel, "I'm working!")

repl.start("logbot> ")

require('net').createServer(->).listen(process.env.PORT)
