require("minitest/autorun")
require("minitest/rg")
require_relative("../tag.rb")

class TagTest < MiniTest::Test

  def setup()
    option1 = {
      "tag_name" => "Groceries"
    }
    @tag = Tag.new(option1)
  end


  def test_tag_has_name()
    assert_equal("Groceries", @tag.tag_name)
  end


end
