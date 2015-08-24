Rails.application.routes.draw do
  resources :user_shipments
  get 'static_pages/home'
  get 'static_pages/about'
  #get 'static_pages/splash'
  get 'layouts/header'
  get 'layouts/footer'
  get 'static_pages/help'
  get 'static_pages/home'
  #get 'shipments/delete_modal'

  resources :offers
  resources :shipments
  devise_for :users

  get 'export', to: 'shipments#export', as: :shipments_export # Route pointing to export action in shipments_controller

  get "/shipments/:id/add_carrier/:carrier_id" => "shipments#add_carrier", as: :add_carrier

  get "/shipments/:id/choose_carriers" => "shipments#choose_carriers", as: :choose_carriers

  root 'shipments#index'
  #root 'static_pages#home'

  # => What is this? - Chris
  resources :memberships do
    put :accepted
    put :rejected
  end
  #get 'layouts/home'

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
