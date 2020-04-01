class SubscriptionsController < ApplicationController

    # CREATE
    get '/mysubs/new' do 
        @user = User.find(session[:id])
        erb :'/subscriptions/new' 
    end 

    post '/mysubs' do 
        current_user.subscriptions << Subscription.create(params)
        redirect '/mysubs'
    end 
    # READ 
    get '/mysubs' do
        @user = current_user
            erb :'subscriptions/mysubs'
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