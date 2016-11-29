Rails.application.routes.draw do

  get 'customers/new'

  get 'customers/create'

  get 'customers/update'

  get 'customers/edit'

  get 'customers/destroy'

  get 'customers/index'

  get 'customers/show'

  # USERS & ADMINISTRATION
  devise_for :admins
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # HOME
  root to: 'commercials#index'
  
  # RESSOURCE
  resource :commercials
  resource :projects
  resource :clients


  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
