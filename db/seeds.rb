require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require("pry-byebug")

Transaction.delete_all()
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

transaction1 = Transaction.new({
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "value" => 10,
  "day" => "12-12-18"
  })

  transaction1.save()

transaction2 = Transaction.new({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "value" => 30,
  "day" => "12-21-18"
  })

  transaction2.save()

transaction3 = Transaction.new({
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "value" => 50,
  "day" => "12-05-18"
  })

  transaction3.save()






binding.pry
nil
