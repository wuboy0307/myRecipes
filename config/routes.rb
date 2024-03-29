Rails.application.routes.draw do
  root 'page#home'
  get '/home',to:'page#home'
  resources :recipes do 
    member do
      post 'like'
    end
  end
  
  resources :chefs, except: [:new]
  get '/register',to: 'chefs#new'
  get '/login',to: 'logins#new'
  post '/login',to: 'logins#create'
  get '/logout',to: 'logins#destroy'
  
end
