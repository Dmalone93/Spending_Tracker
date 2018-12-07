require_relative('../models/merchant.rb')
require("pry-byebug")

merchant1 = Merchant.new ({
  "merchant_name" => "Amazon"
  })

merchant1.save()
