# config/routes.rb
Rails.application.routes.draw do
  root 'welcome#index'

# routes.rb
get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/generate_qr_code', to: 'qr_code#generate_qr_code', as: 'generate_qr_code'


end
