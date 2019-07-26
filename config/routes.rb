Rails.application.routes.draw do
  
  root 'flights#index'
  
  get '/flights', to: 'flights#index'
  get '/book',    to: 'bookings#new'
  
  resources :flights,  only: [:index]
  resources :bookings, only: [:new, :show, :create]
  
end
