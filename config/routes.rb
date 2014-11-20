Rails.application.routes.draw do
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

  # controller :customer do
     # get "index", to: "customers#index"
     # post "index", to: "customers#index"
  # end
  
  controller :home do
    get "home/index"
    post "home/index", to: "customers#index"
  end
  controller :customers do
    get "customers", to: "customers#index"
    post "customers", to: "customers#create"
    get "customers/showcart"
    get "customers/index"
    get "customers/signin"
    post "customers/signin"
    get "customers/logout"
    get "customers/verify"
  end
  controller :products do
    get "products", to: "products#index"
    get "products/show"
    get "products/show/:id", to: "products#show"
    post "products/show", to: "carts#create"
    post "products/checkout"
  end
  controller :carts do
    get "carts/show"
    post "carts/checkout"
    get "carts/express"
    get "carts/confirm"
    post "carts/confirm"
    get "carts/purchase"
    post "carts/purchase"
  end
  
end
