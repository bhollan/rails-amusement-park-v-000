Rails.application.routes.draw do

  root to: 'welcome#home'
  get  '/signin', to: 'sessions#signin'
  get  '/logout', to: 'sessions#logout'
  post '/signin', to: 'sessions#create'
  resources :attractions
  resources :users
  post '/attractions/:id', to: 'attractions#ride', as: 'take_ride'

end
