require_relative('../models/merchant.rb')
require("pry-byebug")

merchant1 = Merchant.new ({
  "merchant_name" => "Amazon"
  })

  merchant1.save()

merchant2 = Merchant.new ({
  "merchant_name" => "Morrisons"
  })

  merchant2.save()

merchant3 = Merchant.new ({
  "merchant_name" => "Jiu Jitsu"
  })

  merchant3.save()




binding.pry
nil
