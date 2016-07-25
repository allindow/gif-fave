Rails.application.routes.draw do

  resources :users, only: [:new, :index, :create, :show]
  resources :gifs, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  post '/new_favorite/:id', to: 'user/favorites#create'
  get '/new_favorite/:id', to: 'user/favorites#create'
  delete '/favorite/:id', to: 'user/favorites#destroy'
  get '/favorite/:id', to: 'user/favorites#destroy'
  get '/user/gifs/by_category'
  get '/user/favorites/by_category'
  get '/admin/gifs/:id', to: 'admin/gifs#destroy'


  root 'welcome#index'

  namespace :admin do
    resources :welcome, only: [:index]
    resources :gifs, only: [:create, :index, :destroy]
  end

  namespace :user do
    resources :favorites, only: [:create, :index]
    resources :gifs, only: [:index]
  end

  get '*path' => redirect('/')

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
