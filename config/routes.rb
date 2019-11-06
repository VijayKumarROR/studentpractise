Rails.application.routes.draw do
  root "users#new"
  resources :users
  resources :questions
  resources :homes

  match "homes/create_login" => "homes#create_login", via: [:post]
  match "questions/list_question" => "questions#list_question", as: :list_question, via: [:get]
  match "homes/logout" => "homes#logout", via: [:post]
  match "questions/create_answer" => "questions#create_answer", via: [:post]
  match "questions/skip_question" => "questions#skip_question", via: [:post]
  match "questions/update_subject" => "questions#update_subject", via: [:post]
  match "questions/update_topics" => "questions#update_topics", via: [:post]
  match "questions/update_chapters" => "questions#update_chapters", via: [:post]
  match "questions/show_questions" => "questions#show_questions", via: [:post]
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

  # Example r/esource route with options:
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
