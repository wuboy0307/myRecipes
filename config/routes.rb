Rails.application.routes.draw do
  root 'page#home'
  get '/home',to:'page#home'
  resources :recipes do 
    member do
      post 'like'
    end
  end
end
