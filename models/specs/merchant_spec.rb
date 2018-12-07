require("minitest/autorun")
require("minitest/rg")
require_relative("../merchant.rb")

class MerchantTest < MiniTest::Test

  def setup()
    option1 = {
      "merchant_name" => "Tesco"
    }
    @merchant = Merchant.new(option1)
  end


  def test_merchant_has_name()
    assert_equal("Tesco", @merchant.merchant_name)
  end


end
