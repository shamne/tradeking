require 'helper'

class TestTradeking < Test::Unit::TestCase
  def test_one
    tradeking = Tradeking::Client.new()
    assert_equal [], tradeking.accounts
  end
end
