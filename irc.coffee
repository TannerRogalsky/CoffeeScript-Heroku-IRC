sys = require 'sys'
config = require('./config').config

irc = require './lib/irc'
repl = require 'repl'

sys.puts(sys.inspect(config))

client = new irc.Client(config.host, config.port)

client.connect(config.username)

client.addListener '001', ->
  this.send('JOIN', config.channel)

client.addListener 'PRIVMSG', (prefix, channel, text) ->
  if /^!test/i.test(text)
    @send('PRIVMSG', channel, "I'm working!")
  else if /^!remember/i.test(text)
    content = text.match /^\w+(.+)/
    window.remember = content[1]
  else if /^!tell me/i.test(text)
    @send('PRIVMSG', channel, window.remember || "I don't know anything.")


repl.start("log> ")
