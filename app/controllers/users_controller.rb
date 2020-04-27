class UsersController < ApplicationController

    get '/login' do 
        erb :'users/login'
    end 

    get '/signup' do
        erb :'/users/signup'
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/dashboard'
        else 
            @error = "Please enter valid credentials."
            erb :'users/login'
        end 
    end 

    post '/signup' do
        user = User.create(params)
        if user.valid?
          session[:user_id] = user.id
          redirect to '/dashboard'
        else
          user.delete
          @error = "Please enter valid credentials."
          erb :'users/signup'
        end
      end

    get '/dashboard' do
        check_login
        erb :'/users/dashboard'
    end 

    get '/logout' do
        session.clear
        redirect '/'
    end

end 
