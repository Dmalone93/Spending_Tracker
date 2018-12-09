#params is alwasy a hash
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
  Merchant.new(params).save
  redirect to '/merchant'
end
