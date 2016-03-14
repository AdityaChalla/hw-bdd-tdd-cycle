Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  get '/similar/:movie_id' => 'movies#similar', :as => 'movie_similar'
  post '/similar/:movie_id' => 'movies#similar', :as => 'movie_similar2'

    #get '/similar', :to => redirect('/movies#similar')
  #get '/similar/:id', to: 'movies#similar'
  root :to => redirect('/movies')
end
