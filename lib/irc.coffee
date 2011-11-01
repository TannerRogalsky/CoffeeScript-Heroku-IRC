sys = require 'sys'
tcp = require 'net'
irc = exports

class Client
  constructor: (@host, @port = 6667) ->
    @connection = null
    @buffer = ''
    @encoding = 'utf8'
    @timeout = 10 * 60 * 60 * 1000

    # the names
    @nick = null
    @user = null
    @real = null

  connect: (nick, user, real) ->
    
