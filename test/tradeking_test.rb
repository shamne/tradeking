require 'helper'

class TestTradeking < Test::Unit::TestCase

  def setup
    @client = Tradeking::Client.new(ACCESS_CREDENTIALS)
  end

  def test_client_instance_vars
    assert_equal @client.instance_variable_get(:@oauth_consumer).class, OAuth::Consumer
    assert_equal @client.instance_variable_get(:@oauth_access_token).class, OAuth::AccessToken
  end

  def test_api_get
    stub_request = stub_v1_api_call(:get, "watchlists.json")
    assert_equal JSON.parse(expected_body("get_watchlists.json"))["response"], @client.get("watchlists")
    assert_requested(stub_request)
  end

  def test_api_get_with_attributes
    params = {keywords: "qqq"}
    stub_request = stub_v1_api_call(:get, "market/news/search.json?keywords=qqq")
    assert_equal JSON.parse(expected_body("get_market_news_search.json"))["response"], @client.get("market/news/search", params)
    assert_requested(stub_request)
  end

  def test_api_get_wrongpath
    stub_request = stub_v1_api_call(:get, "wrongpath.json")
    exception = assert_raise(RuntimeError) {@client.get("wrongpath")}
    assert_equal("Service Operation Identification Failure", exception.message)
    assert_requested(stub_request)
  end

  def test_api_post
    params = {id: "New watchlist", symbols: "AAPL,MSFT"}
    stub_request = stub_v1_api_call(:post, "watchlists.json", params)
    assert_equal JSON.parse(expected_body("post_watchlists.json"))["response"], @client.post("watchlists", params)
    assert_requested(stub_request)
  end

  def test_api_delete
    stub_request = stub_v1_api_call(:delete, "watchlists/One.json")
    assert_equal JSON.parse(expected_body("delete_watchlists_One.json"))["response"], @client.delete("watchlists/One")
    assert_requested(stub_request)
  end

end
