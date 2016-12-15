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
  resources :commercials
  resources :projects



  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
