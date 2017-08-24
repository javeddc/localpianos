Rails.application.routes.draw do

  # user-facing routes:
  get '/' => 'pianos#index'
  get '/pianos' => 'pianos#index'
  resources :pianos do
    resources :comments, shallow: true
    resources :flags, shallow: true
    resources :stars, shallow: true
    resources :piano_photos, shallow: true
  end
  get '/about' => 'pianos#about'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/favourites' => 'pianos#favourites'

  # needed?
  # post '/piano_photos' => 'piano_photos#post'


  # routes for internal API:
  get '/api_nearby' => 'locations#user_location'
  get '/api_current' => 'locations#current'
  get '/api_search_coordinates' => 'locations#search_coordinates'
  get '/api_star_toggle' => 'stars#toggle'
  get '/api_piano_comments' => 'comments#grab'
  post '/api_piano_comments' => 'comments#create'

  # run before each heroku deploy
  # bundle exec rake assets:precompile

end
