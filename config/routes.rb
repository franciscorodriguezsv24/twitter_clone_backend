Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :tweets 

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :api do
    post 'sign_in', to: 'sessions#create' 
    delete 'sign_out', to: 'sessions#destroy' 
    post 'sign_up', to: 'registrations#create' 

    resources :tweets, only:[:create, :update, :show, :index] do 
      member do 
        get 'stats', to: 'tweets#stats'
        post 'like', to: 'tweets#like'
        delete 'dislike', to: 'tweets#destroy'
        post 'retweet', to: 'tweets#retweet'
        post 'quote', to: 'tweets#quote'
        post 'reply', to: 'tweets#create_reply'
        post 'bookmark', to: 'tweets#bookmark'
        patch 'tweets', to: 'tweets#update'
        put 'tweets', to: 'tweets#update'
      end
    end 

    resources :users, only:[:create, :update, :show, :index] do
      member do 
        get 'tweets', to: 'users#tweets'
        get 'tweets_replies', to: 'users#tweets_replies'

      end 
    end 
  end
end
