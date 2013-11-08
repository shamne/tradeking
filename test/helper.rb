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

  def stub_v1_api_call type, operation, attrs={}
    filename = "#{type}_"
    filename << operation.split("?").first.gsub("/","_")
    stub_request(type, 'https://api.tradeking.com/v1/' << operation)
      .with(:body => attrs.empty? ? {} : attrs)
      .to_return(
        :body => expected_body(filename),
        :status => 200
    )
  end

  def expected_body filename
    File.read(File.join(File.dirname(__FILE__), 'support/responses/' << filename))
  end

end
