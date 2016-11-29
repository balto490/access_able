Rails.application.routes.draw do
  resources :geocodes
  resources :locations
  devise_for :users,  #path_names: {sign_in: "login", sign_out: "logout"}
  					controllers: {omniauth_callbacks: "omniauth_callbacks"} 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match 'auth/:provider/callback', to: 'welcome#index'

  get '/' => 'welcome#index'
  

end
