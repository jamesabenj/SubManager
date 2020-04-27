class SubscriptionsController < ApplicationController

    # CREATE
    get '/mysubs/new' do 
        check_login
        erb :'/subscriptions/new' 
    end 

    post '/mysubs/new' do 
        sub = Subscription.create(params)
        if sub.valid? 
            current_user.subscriptions << sub
            redirect '/mysubs'
        else
            @error = "Please fill out all fields and enter only numbers for 'Amount'."
            erb :'/subscriptions/new'
        end
    end 
    # READ 
    get '/mysubs' do
        check_login
        erb :'subscriptions/mysubs'
    end

    get '/mysubs/:name' do
        check_login
        @sub = Subscription.find_by(name: params[:name].gsub('%20', ' '))
        erb :'/subscriptions/show'
    end 

    get '/mysubs/metrics' do 
        check_login
        @subs = current_user.subscriptions 
        @total = 0
        @monthly_pie  = Graph.monthly_pie(current_user)
        erb :'subscriptions/metrics'
    end 
    # UPDATE
    get '/mysubs/:name/edit' do
        check_login
        @sub = Subscription.find_by(name: params[:name].gsub('%20', ' '))
        erb :'subscriptions/edit'
    end 

    patch '/mysubs/:name' do
        check_login
        @sub = Subscription.find_by(name: params[:name].gsub('%20', ' '))
        @sub.update(params[:subscription])
        redirect '/mysubs/:name'
    end 

    # DESTROY
    get '/mysubs/:name/delete' do
        check_login
        sub = Subscription.find_by(name: params[:name].gsub('%20', ' '))
        @confirm = "#{sub.name} has been successfully deleted."
        sub.delete
        erb :'/subscriptions/mysubs'
    end 

end 