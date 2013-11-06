require 'helper'

class TestTradeking < Test::Unit::TestCase

  def setup
    @client = Tradeking::Client.new(ACCESS_CREDENTIALS)
  end

  def test_api_get
    resource = "watchlists"
    stub_request = stub_v1_api_call(:get, "#{resource}.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "get_#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"], @client.api(:get, "#{resource}.json")
    assert_requested(stub_request)
  end

  def test_api_post
    resource = "watchlists"
    params = {id: "New watchlist", symbols: "AAPL,MSFT"}
    stub_request = stub_v1_api_call(:post, "#{resource}.json", params)
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "post_#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"], @client.api(:post, "#{resource}.json", params)
    assert_requested(stub_request)
  end

  def test_accounts
    resource = "accounts"
    stub_request = stub_v1_api_call(:get, "#{resource}.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "get_#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.accounts
    assert_requested(stub_request)
  end

  def test_account_show
    resource = "accounts"
    stub_request = stub_v1_api_call(:get, "#{resource}/12345.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "get_#{resource}_12345.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.accounts("12345")
    assert_requested(stub_request)
  end

  def test_watchlists
    resource = "watchlists"
    stub_request = stub_v1_api_call(:get, "#{resource}.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "get_#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.watchlists
    assert_requested(stub_request)
  end

  def test_watchlist_show
    resource = "watchlists"
    stub_request = stub_v1_api_call(:get, "#{resource}/One.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "get_#{resource}_One.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.watchlists("One")
    assert_requested(stub_request)
  end
end
