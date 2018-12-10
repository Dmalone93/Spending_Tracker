require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/merchant' do
  @merchants = Merchant.all()
  erb (:"merchant/index")
end

get '/merchant/new' do
  @merchants = Merchant.all()
  erb ( :"merchant/new")
end

post '/merchant/new' do
  @merchants = Merchant.all()
  Merchant.new(params).save()
  redirect('/merchant')
end

get '/merchant/:id/edit' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchant/edit")
end

post '/merchant/:id/edit' do
  merchant = Merchant.new(params)
  merchant.update
  redirect ('/merchant')
end


get '/merchant/:id' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchant/show")
end

post '/merchant/:id/delete' do
  @merchant = Merchant.find(params['id'])
  @merchant.delete()
  redirect ('/merchant')
end
