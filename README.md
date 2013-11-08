# Tradeking API wrapper

Ruby wrapper for a Tradeking API.
Allows access to a Tradeking account's rest operations. Check out the [api documentation](https://developers.tradeking.com/documentation/getting-started)


## Basic Usage

API wrapper can be used from the command line or as part of a Ruby web framework. First install the gem:

    gem install tradeking

Instantiate a client with your tradeking credentials. You can get it [here](https://developers.tradeking.com/applications)

    require 'tradeking'
    client = Tradeking::Client.new(consumer_key: "YOUR_KEY", consumer_secret: "YOUR_SECRET", access_token: "TOKEN", access_token_secret: "TOKEN_SECRET")

Then access API operations, you can find a full list of operations [here](https://developers.tradeking.com/documentation/request-structure)

    client.get("market/options/expirations")
    client.get("market/news/search", {keywords: "ford"})
    client.post("watchlists", {id: "MyNewWatchlist", symbols: "AAPL,MSFT"})
    client.delete("watchlists/MyList")


## Testing

You should be able to run the test suite:

    bundle install
    rake

You can also run just one test file:

    rake test test/tradeking_test.rb

