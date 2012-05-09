# encoding: utf-8
require 'sinatra'
require 'haml'

class App < Sinatra::Application
  enable :sessions

  configure :production do
    set :haml, { :ugly => true, :format => :html5 }
    set :clean_trace, true
  end

  configure :development do
    set :haml, { :format => :html5 }
  end
  
  configure do
    # Last modification time for browser cache
    @last_mod_time = Time.now
  end

	helpers do
		include Rack::Utils
		alias_method :h, :escape_html
	end
  
  before do
    headers "X-UA-Compatible" => "IE=Edge,chrome=1"
    expires 300, :public, :must_revalidate
    last_modified(@last_mod_time)
  end

end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'