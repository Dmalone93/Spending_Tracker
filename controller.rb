require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/merchant_controller')

get '/' do
  erb( :index )
end