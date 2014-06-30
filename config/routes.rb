DbcOverflow::Application.routes.draw do
  root :to => "recipes#index"
  put "/recipes/:id/upvote" => "recipes#upvote", as: 'recipe_upvote'
  put "/recipes/:id/downvote" => "recipes#downvote", as: 'recipe_downvote'
  put "/recipes/:recipe_id/comments/:id/upvote" => "comments#upvote", as: "recipe_comment_upvote"
  put "/recipes/:recipe_id/comments/:id/downvote" => "comments#downvote", as: "recipe_comment_downvote"
  get '/recipes/search' => "recipes#new_search", as: "new_search"
  post '/recipes/search' => "recipes#search", as: "search"
  get '/recipes/random_list' => "recipes#random_list", as: "random"
  get '/signin' => 'users#signin_attempt', as: "signin"
  post '/logout' => 'users#logout', as: 'logout'

  resources :recipes do
    resource :comments
  end

  resources :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
