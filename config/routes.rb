Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }

      resource :user, only: [:update]
      get 'user/auto_login', to: 'users#auto_login'

      resources :users
      resources :pools, only: [:index]
      resources :rooms do
         resources :home_works
      end
      resources :add_to_rooms, only: [:create]
      delete 'rooms/:room_id/:user_id', to: 'add_to_rooms#destroy'
      resources :annonces
     
      

   end
end
