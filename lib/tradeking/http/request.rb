module Tradeking
  module Http
    module Request

      def request args
        attrs = args[0] || {}
        headers = args[1] || {}
        response(yield(attrs, headers))
      end

      # GET API accessor
      # Will make a GET request to a specified operation path
      # You can find a list of all available GET requests here: https://developers.tradeking.com/documentation/getting-started
      #
      # ==== Attributes
      # * +operation+ - Operation path without API version ("/v1/")
      # * +*args+ - Attributes and headers
      # ==== Example
      # client.get("market/options/expirations")
      # client.get("market/news/search", {keywords: "ford"}, {'Accept' => 'application/json'})
      def get operation, *args
        request(args) do |attrs, headers|
          uri = "/#{API_VERSION}/#{operation}.#{API_FORMAT}"
          uri << "?#{URI.encode_www_form(attrs.to_a)}" unless attrs.empty?
          @oauth_access_token.send(:get, uri, headers)
        end
      end

      # POST API accessor
      # Will make a POST request to a specified operation path
      # You can find a list of all available POST requests here: https://developers.tradeking.com/documentation/getting-started
      #
      # ==== Attributes
      # * +operation+ - Operation path without API version ("/v1/")
      # * +*args+ - Attributes and headers
      # ==== Example
      # client.post("watchlists", {id: "MyNewWatchlist", symbols: "AAPL,MSFT"})
      def post operation, *args
        request(args) do |attrs, headers|
          @oauth_access_token.send(:post, "/#{API_VERSION}/#{operation}.#{API_FORMAT}", attrs, headers)
        end
      end

      # DELETE API accessor
      # Will make a DELETE request to a specified operation path
      # You can find a list of all available DELETE requests here: https://developers.tradeking.com/documentation/getting-started
      #
      # ==== Attributes
      # * +operation+ - Operation path without API version ("/v1/")
      # * +*args+ - Attributes and headers
      # ==== Example
      # client.delete("watchlists/MyList")
      def delete operation, *args
        request(args) do |attrs, headers|
          @oauth_access_token.send(:delete, "/#{API_VERSION}/#{operation}.#{API_FORMAT}", headers)
        end
      end

      def put
        # Not implemented on a Tradeking API
      end

    end
  end
end