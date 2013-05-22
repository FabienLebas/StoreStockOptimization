StoreStockOptimization::Application.routes.draw do
   
   get "reporting/best_sellers"
   get "reporting/slow_movers"
   get "reporting/end_life"

     get "pages/home"
     get "pages/contact"
     get "pages/about"
     get "pages/howitworksbusiness"    
     get "pages/howitworksanticipate"
     get "pages/quickstartguide"     
           
     post "movements/getTO" 
     post "movements/getTO2Dates"
     post "movements/getStartDate"
     
     match "en/pages/about" => "pages#about"
              
  devise_for :users
  
scope "(:locale)", :locale => /en|fr/ do 
    resources :ei_products
    resources :subscriptions
    resources :seasonalities
    resources :planned_orders
    resources :orders
    resources :movements
    resources :suppliers
    resources :articles
    resources :pages
    root :to => 'pages#home'
  end
    match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
    match 'movements/getTO', to: redirect("movements/getTO")
    match '', to: redirect("/#{I18n.default_locale}")

    resources :articles do
      collection { post :import}
    end    
    resources :suppliers do
      collection { post :import}
    end
    resources :movements do
      collection { post :import}
    end
    resources :orders do
      collection { post :import}
    end

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
