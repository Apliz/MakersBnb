require "sinatra/base"
require './lib/space'

class MakersBnB < Sinatra::Base
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
    puts params[:name]
    puts params[:description]
  end
  
  run! if app_file == $0
end
 