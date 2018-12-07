require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require("pry-byebug")

Merchant.delete_all()
Tag.delete_all()

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

tag1 = Tag.new({
  "tag_name" => "Books"
  })

tag1.save()

tag2 = Tag.new({
  "tag_name" => "Groceries"
  })

tag2.save()

tag3 = Tag.new({
  "tag_name" => "Exercise"
  })

tag3.save()


binding.pry
nil
