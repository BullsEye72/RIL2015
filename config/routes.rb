Rails.application.routes.draw do

  get 'clients/new'

  get 'clients/create'

  get 'clients/update'

  get 'clients/edit'

  get 'clients/destroy'

  get 'clients/index'

  get 'clients/show'

  # USERS & ADMINISTRATION
  devise_for :admins
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # HOME
  root to: 'commercials#index'
  
  # RESSOURCE
  resource :commercials
  resource :projects



  # PAGE
  get '/pages/:id' => 'pages#show', as: 'page'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'
end
