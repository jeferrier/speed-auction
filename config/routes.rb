Rails.application.routes.draw do
  get 'myaccount/index'

  get 'myaccount/edit_payment_details'
  
  post 'myaccount/edit_payment_details'

  get 'myaccount/edit_login_details'

  post 'myaccount/edit_login_details'

  get 'myaccount/view_payment_history'
  
  get 'auctions/view_auction/:auction_id' => 'auctions_controller#view_auction', as: 'view_auction'
  
  get 'auctions/view_my_auctions' => 'auctions_controller#view_my_auctions', as: 'view_my_auctions'

  post 'auctions/view_auction/flag' => 'auctions_controller#flag', as: 'flag_auction'
  
  post 'auctions/view_auction/mark_delivered' => 'auctions_controller#mark_delivered', as: 'mark_delivered'
  
  root 'home#index'

  resources :auctions

  resources :items

  resources :billing_infos

  resources :payment_details

  resources :users

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
