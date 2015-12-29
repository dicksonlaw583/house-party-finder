Rails.application.routes.draw do

  get '/404', :to => 'errors#not_found'
  get '/422', :to => 'errors#rejected'
  get '/500', :to => 'errors#server_error'

  root 'static_pages#home'
  get 'register_login' => 'static_pages#register_login'
  get 'privacy_policy' => 'static_pages#privacy_policy'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'site_map' => 'static_pages#site_map'
  get 'about_us' => 'static_pages#about_us'

 devise_for :users do
    resource :registration, :only => [:new, :create, :edit, :update],
      as: :user_registration do
        get :cancel
      end
  end
  
  get '/parties/featured' => 'parties#featured'
  get '/parties/streaming' => 'parties#streaming'
  get '/parties/my-parties' => 'parties#mine'
  resources :parties do
    post 'attend' => 'parties#attend', :as => :attend
    post 'unattend' => 'parties#unattend', :as => :unattend
    post 'feature' => 'parties#feature', :as => :feature
    post 'unfeature' => 'parties#unfeature', :as => :unfeature
    post 'attach' => 'parties#attach', :as => :attach
    get 'stream_in' => 'parties#stream_in', :as => :stream_in
    get 'stream_out' => 'parties#stream_out', :as => :stream_out
  end
  post '/parties/:id/rate' => 'parties#rate'
  patch '/parties/:id/complete' => 'parties#complete'
  
  resources :users do
    get 'profile' => 'users#profile', :as => :profile
    get 'activity' => 'users#activity', :as => :activity
    get 'subscribers' => 'users#subscribers', :as => :subscribers
    get 'portfolio' => 'users#portfolio', :as => :portfolio
    post 'subscribe' => 'users#subscribe', :as => :subscribe
    post 'unsubscribe' => 'users#unsubscribe', :as => :unsubscribe
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
