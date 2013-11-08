module Tradeking
  module Http
    module Response

      def response resp
        output = JSON.parse(resp.body)["response"]
        raise output["description"] if output["type"] == "Error"
        output
      end

    end
  end
end