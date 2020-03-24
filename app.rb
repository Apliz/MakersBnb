require "sinatra/base"
require './lib/space'


class MakersBnB < Sinatra::Base
  enable :sessions

  get "/test" do
    "Testing infrastructure: self.code"
  end

  get "/spaces" do
    @space = Space.all
    erb(:index)
  end
  
  get "/spaces/new" do
    erb :'spaces/new'
  end

  post "/spaces" do
    Space.create(name: params[:name], description: params[:description])
    redirect :'spaces'
  end
  
  run! if app_file == $0
end
 