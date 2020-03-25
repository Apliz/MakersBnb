require "sinatra/base"
require './lib/space'
require './lib/user'
require './database_connection_setup'


class MakersBnB < Sinatra::Base
  enable :sessions

  get "/test" do
    "Testing infrastructure: self.code"
  end

  get "/" do
    erb :'index'
  end

  post "/users" do
    user = User.create(
      name: params['name'],
      username: params['username'],
      email: params['email'],
      password: params['password'])
    session[:user_id] = user.id
    redirect :'spaces'
  end

  get "/spaces" do
    @spaces = Space.all
    erb :'spaces/spaces'
  end
  
  get "/spaces/new" do
    erb :'spaces/new'
  end

  post "/spaces" do
    Space.create(name: params[:name], description: params[:description], price: params[:price], date_from: params[:date_from], date_to: params[:date_to])
    redirect :'spaces'
  end
  
  run! if app_file == $0
end
 