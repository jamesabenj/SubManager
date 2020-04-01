require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions 
    set :session_secret, "secret"
  end 

  get "/" do
    if logged_in?
      redirect '/dashboard'
    end
    erb :welcome
  end

  helpers do
    def current_user 
      User.find_by(id: session[:id])
    end

    def logged_in? 
     session[:id] ? true : false
    end
  end 

end
