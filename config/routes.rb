Rails.application.routes.draw do
  # user-facing routes:
  get '/' => 'pianos#index'
  get '/pianos' => 'pianos#index'
  # get '/pianos/:id', to: 'pianos#show', as: 'piano'
  resources :pianos do
    resources :comments, shallow: true
    resources :flags, shallow: true
    resources :stars, shallow: true
    resources :piano_photos, shallow: true
  end
# , only: %i[index new create destroy show]

  post '/piano_photos' => 'piano_photos#post'

  get '/about' => 'pianos#about'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  # routes for internal API:
  get '/api_nearby' => 'locations#user_location'
  get '/api_current' => 'locations#current'
  get '/api_search_coordinates' => 'locations#search_coordinates'
  get '/api_star_toggle' => 'stars#toggle'
  get '/api_piano_comments' => 'comments#grab'
  post '/api_piano_comments' => 'comments#create'

  # ## test route for searching
  # get '/api_search_test' => 'locations#search_test'

  # views for testing locations API, with output:
  # get '/location' => 'pianos#map_me'
  # get '/location/:id' => 'pianos#nearbys'
  ## test view for search_test
  # get '/search_test' => 'pianos#search_test'
end
