require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/transaction' do
  @transaction = Transaction.order()
  erb( :"transaction/index" )
end

get '/transaction/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transaction/new")
end

post '/transaction/new' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect('/transaction')
end

get '/transaction/:id' do
  @transactions = Transaction.find(params['id'])
  erb (:"transaction/index")
end

post '/transaction/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete()
  redirect ('/transaction')
end
