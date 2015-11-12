Rails.application.routes.draw do
  root 'page#home'
  get '/home',to:'page#home'
end
