require_relative( '../db/sql_runner.rb' )

class Merchant

  attr_reader :id
  attr_accessor :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants
    (merchant_name)
    VALUES ($1)
    RETURNING id"
    values = [@merchant_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    return results.map{|merchant| Merchant.new(merchant)}
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def tags()
    sql = "SELECT t.* FROM tags t INNER JOIN transactions transaction ON transaction.tag_id = t.id WHERE transaction.merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|tag| Tag.new(tag)}
  end

  #self.delete(id) #update()






end
