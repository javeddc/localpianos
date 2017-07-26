Rails.application.routes.draw do

  # user-facing routes:
  get '/' => 'pianos#index'
  get '/pianos' => 'pianos#index'
  # get '/pianos/:id', to: 'pianos#show', as: 'piano'
  resources :pianos, only: [:index, :new, :create, :destroy, :show], shallow: true do
    resources :comments
    resources :flags
    resources :stars
    resources :piano_photos
  end

  get '/about' => 'pianos#about'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # routes for locations API:
  get '/api_nearby' => 'locations#user_location'
  get '/api_current' => 'locations#current'
  get '/api_pianos_near' => 'locations#pianos_near'

  # routes for testing locations API, with output:
  get '/location' => 'pianos#map_me'
  get '/location/:id' => 'pianos#nearbys'

end
