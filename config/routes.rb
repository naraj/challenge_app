# == Route Map
#
#                   Prefix Verb   URI Pattern                                      Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                         devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                         devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                        devise/sessions#destroy
# cancel_user_registration GET    /users/cancel(.:format)                          devise/registrations#cancel
#        user_registration POST   /users(.:format)                                 devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                         devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                            devise/registrations#edit
#                          PATCH  /users(.:format)                                 devise/registrations#update
#                          PUT    /users(.:format)                                 devise/registrations#update
#                          DELETE /users(.:format)                                 devise/registrations#destroy
#                     root GET    /                                                questions#index
#         question_answers POST   /questions/:question_id/answers(.:format)        answers#create
#                questions GET    /questions(.:format)                             questions#index
#                          POST   /questions(.:format)                             questions#create
#             new_question GET    /questions/new(.:format)                         questions#new
#            edit_question GET    /questions/:id/edit(.:format)                    questions#edit
#                 question GET    /questions/:id(.:format)                         questions#show
#                          PATCH  /questions/:id(.:format)                         questions#update
#                          PUT    /questions/:id(.:format)                         questions#update
#                          DELETE /questions/:id(.:format)                         questions#destroy
#                    users GET    /users(.:format)                                 users#index
#                     user GET    /users/:id(.:format)                             users#show
#    like_question_answers GET    /questions/:question_id/answers/like(.:format)   answers#like
#  accept_question_answers GET    /questions/:question_id/answers/accept(.:format) answers#accept
#                          POST   /questions/:question_id/answers(.:format)        answers#create
#     new_question_answers GET    /questions/:question_id/answers/new(.:format)    answers#new
#    edit_question_answers GET    /questions/:question_id/answers/edit(.:format)   answers#edit
#                          GET    /questions/:question_id/answers(.:format)        answers#show
#                          PATCH  /questions/:question_id/answers(.:format)        answers#update
#                          PUT    /questions/:question_id/answers(.:format)        answers#update
#                          DELETE /questions/:question_id/answers(.:format)        answers#destroy
#                          GET    /questions(.:format)                             questions#index
#                          POST   /questions(.:format)                             questions#create
#                          GET    /questions/new(.:format)                         questions#new
#                          GET    /questions/:id/edit(.:format)                    questions#edit
#                          GET    /questions/:id(.:format)                         questions#show
#                          PATCH  /questions/:id(.:format)                         questions#update
#                          PUT    /questions/:id(.:format)                         questions#update
#                          DELETE /questions/:id(.:format)                         questions#destroy
#

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations_controller: 'user/registrations' } 

  root to: 'questions#index'

  resources :questions do
    resources :answers, only: [:create]
  end

  resources :users, only: [:show, :index]
  resources :questions do
    resource :answers do
      get '/like' => 'answers#like', as: :like
      get '/accept' => 'answers#accept', as: :accept
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
