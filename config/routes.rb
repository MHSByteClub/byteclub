Rails.application.routes.draw do
  resources :members do
    resources :projects
  end
  resources :meeting, only: [:show, :index]
  resources :projects
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "welcome#home"
    namespace :admin do
      resources :members
      resources :meetings
      
    end
    
    
    
    get "/dashboard" => "admin#home"
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy"
    
    get "auth/:provider/callback", to: "sessions#create"
    get "auth/failure", to: redirect("/")
    get "signout", to: "sessions#destroy", as: "signout"
end
