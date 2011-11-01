Heroku IRC Bot
---------------

This is an IRC bot written in CoffeeScript and designed to run on Heroku. To run your own, follow these instructions.

    git clone git://github.com/TannerRogalsky/CoffeeScript-Heroku-IRC.git
    cd CoffeeScript-Heroku-IRC

Modify the config.coffee file with your preferred settings.

    heroku create --stack cedar
    git push heroku master
    heroku ps:scale app=1

You may also have to acquaint yourself with `heroku logs` and `heroku restart` but mostly it should just work.
