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
  resources :commercials, path: 'commerciaux'
  resources :projects, path: 'projets'
  resources :payments, path: 'paiement'
  resources :purchases, path: 'achats'
  resources :suppliers, path: 'fournisseurs'
  resources :customers, path: 'clients'

  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # URL CUSTOM
  delete 'order_item_destroy/:id', to: 'order_item#destroy'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
