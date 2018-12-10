require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tag' do
  @tags = Tag.all()
  erb (:"tag/index")
end

get '/tag/new' do
  @tags = Tag.all()
  erb (:"tag/new")
end

post '/tag/new' do
  @tags = Tag.all()
  Tag.new(params).save()
  redirect('/tag')
end

get '/tag/:id' do
  @tags = Tag.find(params['id'])
  erb (:"tag/show")
end

post '/tag/:id/delete' do
  @tags = Tag.find(params['id'])
  @tags.delete()
  redirect('/tag')
end

get '/tag/:id/edit' do
  @tags = Tag.find(params['id'])
  erb(:edit)
end
