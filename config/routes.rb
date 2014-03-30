Lldoc::Application.routes.draw do

  resources :samples


  
  resources :hori do
    collection do
      get 'index/:path' => 'hori#index'
      get ':path_name'  => 'hori#show'
      get 'new/:path'   => 'hori#new'
    end
  end



   get 'vert/index/:path' => 'vert#index'
   get 'vert/new/:path' => 'vert#new'
   get 'vert/edit/:path_name' => 'vert#edit'
   get 'vert/:path_name' => 'vert#show'
   get 'vert/delete/:path_name' => 'vert#destroy'
  post 'vert/update' => 'vert#update'
  resources :vert
  resources :maps do
    collection do
      post 'dir'
    end
  end

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
