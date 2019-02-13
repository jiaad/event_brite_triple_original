Rails.application.routes.draw do

  

  root to: "home#index"
  devise_for :users#, :controllers=>{registrations: 'registrations'}
  resources :events do 
    resources :participants
  end

  
  post "events/:id", to: "participants#create", as: "participant_create" 
  
  resources :profile, only: [:index , :show]
  resources :admin 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
