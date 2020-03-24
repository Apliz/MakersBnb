require "sinatra/base"

class MakersBnB < Sinatra::Base
  get "/test" do
    "Testing infrastructure: self.code"
  end

  run! if app_file == $0

end
 