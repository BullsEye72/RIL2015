Rails.application.routes.draw do

  resources :orders
  resources :quotes
  resources :articles
  resources :suppliers
  # USERS & ADMINISTRATION
  devise_for :admins
  devise_for :users,
             :skip => [:registrations]
  as :user do
    get 'users/edit'  => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users'       => 'users/registrations#update', :as => 'user_registration'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # HOME
  root to: 'home#index'
  
  
  # RESSOURCES
  resources :commercials
  resources :projects
  resources :payments
  resources :payment_states
  resources :purchases
  resources :suppliers
  resources :customers

  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
