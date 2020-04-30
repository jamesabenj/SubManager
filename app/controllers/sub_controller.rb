class SubscriptionsController < ApplicationController

    # CREATE
    get '/mysubs/new' do 
        check_login
        erb :'/subscriptions/new' 
    end 

    post '/mysubs/new' do 
        @sub = Subscription.create(params)
        if @sub.valid? 
            current_user.subscriptions << @sub
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

    get '/mysubs/metrics' do 
        check_login
        @subs = current_user.subscriptions 
        @total = 0
        @monthly_pie  = Graph.monthly_pie(current_user)
        erb :'subscriptions/metrics'
    end 

    get '/mysubs/:id' do
        check_login
        @sub = Subscription.find_by(id: params[:id])
        erb :'/subscriptions/show'
    end 
    # UPDATE
    get '/mysubs/:id/edit' do
        check_login
        @sub = Subscription.find_by(id: params[:id])
        verify_user
        erb :'subscriptions/edit'
    end 

    patch '/mysubs/:id' do
        @sub = Subscription.find_by(id: params[:id])
        verify_user
        @sub.update(params[:subscription])
        @sub.save
        redirect "mysubs/#{@sub.id}"
    end 

    # DESTROY
    get '/mysubs/:id/delete' do
        check_login
        @sub = Subscription.find_by(id: params[:id])
        verify_user
        @confirm = "#{@sub.name} has been successfully deleted."
        @sub.delete
        erb :'/subscriptions/mysubs'
    end 

end 