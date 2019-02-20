Rails.application.routes.draw do

  namespace :admin do
    get 'admin/index'
  end
  root to: "home#index"
  devise_for :users#, :controllers=>{registrations: 'registrations'}
  resources :events do 
    resources :participants
  end

  
  post "events/:id", to: "participants#create", as: "participant_create" 
  
  resources :profile, only: [:index , :show]
  
  namespace :admin do
    root :to => 'admin#index'
    resources :users, except: [:new, :create]
    resources :events, except: [:new , :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
