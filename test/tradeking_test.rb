require 'helper'

class TestTradeking < Test::Unit::TestCase

  def setup
    @client = Tradeking::Client.new(ACCESS_CREDENTIALS)
  end

  def test_accounts
    resource = "accounts"
    stub_get = stub_v1_api_call(:get, "#{resource}.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.accounts
    assert_requested(stub_get)
  end

  def test_account_show
    resource = "accounts"
    stub_get = stub_v1_api_call(:get, "#{resource}/12345.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "#{resource}_12345.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.accounts("12345")
    assert_requested(stub_get)
  end

  def test_watchlists
    resource = "watchlists"
    stub_get = stub_v1_api_call(:get, "#{resource}.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "#{resource}.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.watchlists
    assert_requested(stub_get)
  end

  def test_watchlist_show
    resource = "watchlists"
    stub_get = stub_v1_api_call(:get, "#{resource}/One.json")
    expected_body = File.read(File.join(File.dirname(__FILE__), 'support/responses/' << "#{resource}_One.json"))
    assert_equal JSON.parse(expected_body)["response"][resource], @client.watchlists("One")
    assert_requested(stub_get)
  end
end
