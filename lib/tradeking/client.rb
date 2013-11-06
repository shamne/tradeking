module Tradeking
  class Client

    include Tradeking::Http::Request
    include Tradeking::Http::Response

    API_URI = "https://api.tradeking.com"

    VALID_CALLS = [
      :accounts,
      :watchlists
    ]

    # Creates an instance of an API accessor
    #
    # ==== Attributes
    # * +options+ - Access credentials hash, required keys are: consumer_key, consumer_secret, access_token, access_token_secret
    # ==== Example
    # client = Tradeking::Client.new({consumer_key: "abc", consumer_secret: "abc", access_token: "abc", access_token_secret: "abc"})
    def initialize options = {}
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @access_token = options[:access_token]
      @access_token_secret = options[:access_token_secret]

      @oauth_consumer = OAuth::Consumer.new @consumer_key, @consumer_secret, { :site => API_URI }
      @oauth_access_token = OAuth::AccessToken.new(@oauth_consumer, @access_token, @access_token_secret)
    end

    # Generates accessors for REST API resources
    # Will call a show method if Id of a resource is provided
    #
    # ==== Attributes
    # * +id+ - Optional id of a resource
    # ==== Example
    # client.accounts
    # client.watchlists("123")
    VALID_CALLS.each do |name|
      define_method(name) do |*args|
        id = args[0]
        path = name.to_s
        path << "/#{id}" unless id.nil?
        api(:get, "#{path}.json")[name.to_s]
      end
    end

    # Generic API accessor
    # Will make an API call with a specified request type and operation path
    # You can find a list of all available requests here: https://developers.tradeking.com/documentation/getting-started
    #
    # ==== Attributes
    # * +type+ - HTTP request type
    # * +operation+ - Operation path without API version ("/v1/")
    # ==== Example
    # client.api(:get, "market/options/expirations.json")
    def api type, operation, *args
      response = send(type, operation, args)
      JSON.parse(response.body)["response"]
    end

  end
end
