Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard', to: 'dashboard#index'

  resources :pets
  get '/my_pets', to: 'pets#my_pets'

  resources :posters, only: %i[edit update show new create] do
    get 'confirm', to: :confirm
  end

  get 'posters/:poster_id/print', to: 'posters#print'
  get 'posters/:poster_id/found', to: 'posters#mark_as_found'

  resources :reports, except: %i[destroy]
end
