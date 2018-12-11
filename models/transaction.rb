require_relative( '../db/sql_runner.rb' )
require_relative('./merchant.rb')
require_relative('./tag.rb')
require ('date')

class Transaction

  attr_reader :id, :value, :merchant_id, :tag_id, :day, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @value = options['value'].to_i if options['id'].to_f
    @day = options['day']
    @budget = 250
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, value, day, budget) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@merchant_id, @tag_id, @value, @day, @budget]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.order()
    sql = "SELECT * FROM transactions ORDER BY day DESC"
    results = SqlRunner.run(sql)
    return results.map {|transaction| Transaction.new(transaction)}
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

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    result = SqlRunner.run(sql, values)
    return Tag.new(result.first)
  end




end
