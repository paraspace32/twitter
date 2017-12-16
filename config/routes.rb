Twitter::Application.routes.draw do
  root :to => "tweets#index"
  devise_for :users

  resources :replies

  resources :follows

  resources :tweets do
    member do
      post 'retweet'
    end
  end

  resources :users do
    collection do
      get 'count' 
    end
    member do
      post 'follow'
    end
  end
end
