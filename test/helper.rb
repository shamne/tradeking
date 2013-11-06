require 'test/unit'
require 'webmock/test_unit'

require 'tradeking'

class Test::Unit::TestCase

  ACCESS_CREDENTIALS = {
    consumer_key: "abc",
    consumer_secret: "abc",
    access_token: "abc",
    access_token_secret: "abc"
  }

  def stub_v1_api_call type, operation
    stub_request(type, 'https://api.tradeking.com/v1/' << operation).to_return(
      :body => File.read(File.join(File.dirname(__FILE__), 'support/responses/' << operation.gsub("/","_"))),
      :status => 200
    )
  end

end
