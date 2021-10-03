Rails.application.routes.draw do
  
  
  # get '/examples', to: 'example#index'
  resources :users, param: :_username
  resources :cats
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
