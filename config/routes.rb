Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :sessions, only: [:index, :new, :create]
  resources :appearances, only: [:new, :show, :create]
  get '/login', to: 'sessions#new'
  get '/', to: 'sessions#index'
end
