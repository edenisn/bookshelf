Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :books

  get '/new_reservation/:id', to: 'reservations#new', as: :new_reservation
  get '/cancel_reservation/:id', to: 'reservations#destroy', as: :cancel_reservation
end
