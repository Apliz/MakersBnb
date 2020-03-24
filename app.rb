require "sinatra/base"

class MakersBnB < Sinatra::Base
  get "/test" do
    "Testing infrastructure: self.code"
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
