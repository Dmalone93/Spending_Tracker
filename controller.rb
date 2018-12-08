require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/merchant_controller')
require_relative('./controllers/tag_controller')
require_relative('./controllers/transaction_controller')
also_reload('./models/*')

get '/' do
  erb( :index )
end

get '/transaction' do
  @transaction = Transaction.all()
  erb( :"transaction/index" )
end

get '/transaction/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transaction/new")
end
