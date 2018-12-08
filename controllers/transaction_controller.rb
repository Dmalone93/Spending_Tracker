require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/transaction' do
  @transaction = Transaction.all()
  erb( :"transaction/index" )
end


get '/transaction/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transaction/new")
end
