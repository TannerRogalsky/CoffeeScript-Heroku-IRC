sys = require 'sys'
config = require('./config').config
global = exports ? this
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
    content = text.match /!\w+ (.+)/
    global.remember = if content then content[1] else null
    @send('PRIVMSG', channel, if global.remember then "I'm going to remember:" + global.remember else "I'm not going to remember anything.")
  else if /^!tell me/i.test(text)
    @send('PRIVMSG', channel, global.remember || "I don't know anything.")


repl.start("log> ")
