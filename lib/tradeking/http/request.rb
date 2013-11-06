module Tradeking
  module Http
    module Request

      def get operation, *args
        attrs = args[0] || {}
        headers = args[1] || {}
        uri = "/v1/#{operation}"
        uri << "?#{URI.encode_www_form(attrs.to_a)}" unless attrs.empty?
        @oauth_access_token.send(:get, uri, headers)
      end

      def post operation, *args
        attrs = args[0] || {}
        headers = args[1] || {}
        @oauth_access_token.send(:post, "/v1/#{operation}", attrs, headers)
      end

    end
  end
end