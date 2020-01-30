class SubscriptionsController < ApplicationController


# CREATE
get '/subscriptions/new' do 
    erb :'subscriptions/new' 
end 

post '/subscriptions' do 
    subscription = Subscription.new(params)
    if subscription.save
        redirect '/subscriptions'

    else 
        erb :'/subscriptions/new'
    end 
end 
# READ 

get '/subscriptions' do 
    @subscriptions = Subscription.all 
    erb :'subscriptions/index'
end 

get '/subscriptions/:id' do 
    @subscription = Subscription.find(params["id"])
    erb :'subscriptions/show'

end 

# UPDATE


# DESTROY





end 