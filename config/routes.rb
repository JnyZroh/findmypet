Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :posters, only: %i[new create]
  end
  resources :posters, only: %i[edit update show]
  get '/my_pets', to: 'pets#my_pets'
  get 'posters/:poster_id/print', to: 'posters#print'
  get 'posters/:poster_id/found', to: 'posters#mark_as_found'
  resources :reports, except: %i[destroy]
end
