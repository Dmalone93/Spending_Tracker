class Merchant

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = merchant_name['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name) VALUES ($1) RETURNING id"
    values = [@merchant_name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end


end
