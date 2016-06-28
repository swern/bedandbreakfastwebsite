require('sinatra')
require('sinatra/contrib/all')
require(pry-byebug)
require_relative('./models/bbw')

  get '/bbw/new' do
    erb(:new)
  end

  post '/bbw' do
    @bbw = Bbw.new(params)
    @bbw.save
    erb(:create)
  end

  get '/bbw' do
    @bbws = Bbw.all()
    erb(:index)
  end


