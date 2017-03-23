Rails.application.routes.draw do

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
  resources :projects,    path: 'projets'
  resources :payments#,    path: 'paiement'
  resources :purchases,   path: 'achats'
  resources :suppliers,   path: 'fournisseurs'
  resources :customers,   path: 'clients'
  resources :orders,      path: 'commande'
  resources :quotes,      path: 'devis'
  resources :articles
  resources :order_items
  resources :units
  resources :conceptions, path: 'be'
  resources :house_modules, path: 'modules'
  resources :products, path: 'produits'

  get '/order/:order/item/new', to: 'order_items#new', as: 'new_order_item_supplier'

  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # DESTROY LINKS
  resources :order_items, only: :destroy
  resources :articles_suppliers, only: :destroy

  # FROALA (WYSIWYG
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
