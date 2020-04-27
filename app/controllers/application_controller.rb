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
      User.find_by(id: session[:user_id])
    end

    def logged_in? 
     !!session[:user_id]
    end
    
    def check_login
      if !logged_in? || !current_user
        redirect '/'
      end 
    end 

  end 

end
