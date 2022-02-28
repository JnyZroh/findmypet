Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :posters, only: %i[new create]
  end
  get '/my_pets', to: 'pets#my_pets'

end
