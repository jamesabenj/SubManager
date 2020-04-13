class SubscriptionsController < ApplicationController

    # CREATE
    get '/mysubs/new' do 
        @user = current_user
        erb :'/subscriptions/new' 
    end 

    post '/mysubs/new' do 
        sub = Subscription.create(params)
        if sub.valid? 
            current_user.subscriptions << sub
            redirect '/mysubs'
        else
            @user = current_user
            @error = "Please fill out all fields and enter only numbers for 'Amount'."
            erb :'/subscriptions/new'
        end
    end 
    # READ 
    get '/mysubs' do
        @user = current_user
        erb :'subscriptions/mysubs'
    end

    get '/mysubs/metrics' do 
        @subs = current_user.subscriptions 
        @total = 0
        @monthly_pie  = Graph.monthly_pie(current_user)
        erb :'subscriptions/metrics'
    end 
    # UPDATE
    get '/mysubs/:id/edit' do
        @sub = Subscription.find_by(id: params[:id])
        erb :'subscriptions/edit'
    end 

    patch '/mysubs/:id' do
        sub = Subscription.find_by(id: params[:id])
        if sub
            sub.update(params[:subscription])
            redirect '/mysubs'
        else
            redirect '/mysubs'
        end
    end 

    # DESTROY
    get '/mysubs/:id/delete' do
        @user = current_user
        sub = Subscription.find_by(id: params[:id])
        if sub 
            @confirm = "#{sub.name} has been successfully deleted."
            sub.delete
            erb :'/subscriptions/mysubs'
        else
            redirect '/mysubs'
        end
    end 

end 