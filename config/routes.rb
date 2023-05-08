Rails.application.routes.draw do
 # get '/patients', to: 'patients#confirm', as: 'patients' 
 # get '/patients/newpatient', to: 'patients#newpatient', as: 'newpatient_patient'   
 # get '/patients/:id', to: 'patients#export', as: 'patient'  
 # post '/patients', to: 'patients#savepatient', as: 'savepatient_patient'  
 # put '/patients/:id/approve', to: 'patients#approve', as: 'approve_patient'  
 # patch '/patients/:id', to: 'patients#improve', as: 'improve_patient'  
 # delete '/patients/:id', to: 'patients#destroy', as: 'delete_patient' 
 # resources :patients
  # post '/patients', to: 'patients#child', as: 'savechild'  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'patients#confirm'
   # get '/users', to: 'users#index', as: 'users_index' 
   # get '/users', to: 'users#show', as: 'user_show'

  resources :users do
    resources :comments
  end
  
  delete 'delete_users', to: 'users#delete_users', as: :delete_users
  # resources :patients
  # You can have the root of your site routed with "root"
   # root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
   # resources :products

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