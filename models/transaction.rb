require_relative( '../db/sql_runner.rb' )
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

  attr_reader :id, :value, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @value = options['value'].to_i
  end

  #remember to put non sql functions in here

  # make functions that test that there is money in the budget

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, value) VALUES ($1, $2, $3) RETURNING id"
    values = [@merchant_id, @tag_id, @value]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map {|transaction| Transaction.new(transaction)}
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result.first)
  end



end
