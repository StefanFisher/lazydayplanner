Lazydayplanner::Application.routes.draw do
  devise_for :users
  #get "movies/index"
  #get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

#get '/movies/searchresults', to: "movies#searchresults"
resources :movies do
    collection do
    post 'new'
    post 'addOwnership'
    delete 'userDestroy'
  end
  resources :comments
  resources :actors
  resources :genres
end

resources :actors do
  resources :movies
  resources :roles
end

resources :genres do
  resources :movies
end

resources :users do
  resources :genre_overrides
  resources :movie_overrides
  resources :movie_prefs
  resources :movies
end

resources :genre_overrides do
  resources :movie_overrides
end

resources :movie_overrides do
  resources :genre_overrides
end

#resources :movie_prefs

root to: "welcome#index"

get '/movies' => "movies#index"
#get '/movies/new' => "movies#new"
get '/actors' => "actors#index"

#get '/movies/search', to: "movies#search"


end
