require_relative( '../db/sql_runner.rb' )

class Tag

  attr_reader :id
  attr_accessor :tag_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO tags
    (tag_name)
    VALUES ($1)
    RETURNING id"
    values = [@tag_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map {|tag| Tag.new(tag)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def merchants()
    sql = "SELECT m.* FROM merchants m INNER JOIN transactions transaction ON merchant_id = m.id WHERE transaction.tag_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|merchant| Merchant.new(merchant)}
  end


end
