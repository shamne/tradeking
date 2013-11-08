require 'tradeking/http/request'
require 'tradeking/http/response'

module Tradeking
  class Client

    include Tradeking::Http::Request
    include Tradeking::Http::Response

    # Creates an instance of an API client
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

  end
end
