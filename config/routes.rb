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

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # routes for locations API:
  get '/api_nearby' => 'locations#user_location'
  get '/api_current' => 'locations#current'
  get '/api_search_coordinates' => 'locations#search_coordinates'
  ## test route for searching
  get '/api_search_test' => 'locations#search_test'

  # views for testing locations API, with output:
  get '/location' => 'pianos#map_me'
  get '/location/:id' => 'pianos#nearbys'
  ## test view for search_test
  get '/search_test' => 'pianos#search_test'


end
