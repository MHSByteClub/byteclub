Rails.application.routes.draw do
  resources :members, only: [:create, :show, :edit, :update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "welcome#home"
    namespace :admin do 
      resources :members
    end
    
    
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy"
end
