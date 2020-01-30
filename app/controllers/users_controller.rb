class UsersController < ApplicationController
    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Please enter valid credentials"
            erb :'users/login'
        else 
            binding.pry
            user.save
            session[:user_id] = user.id
            redirect '/subscriptions'
        end 
    end 




end 
