# encoding: utf-8
class App < Sinatra::Application
  not_found do
    @title = "404"
    haml :notfound
  end

  error do
    @title = "Error"
    haml :error
  end
end
