# encoding: utf-8
class App < Sinatra::Application
	get "/" do
		@title = "Welcome!"				
		haml :main
	end
end