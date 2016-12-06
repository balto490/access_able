Rails.application.routes.draw do
  resources :geocodes
  resources :locations
  devise_for :users, #path_names: {sign_in: "login", sign_out: "logout"}
  					controllers: {omniauth_callbacks: "omniauth_callbacks"} 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match 'auth/:provider/callback', to: 'welcome#index'
  devise_scope :user do  
   	get '/users/sign_out' => 'devise/sessions#destroy'     
  end


  get '/' => 'welcome#index'
  get '/show' => 'welcome#show'

  get '/locations/info', to: 'locations#info'
  post '/locations/:id' => 'comments#create'

  
  put '/locations/:id/edit' => 'locations#update'
  patch '/locations/:id/edit' => 'locations#update'

end
