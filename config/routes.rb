Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users#, :controllers=>{registrations: 'registrations'}
  resources :events do 
    resources :participants
  end
  resources :profile, only: [:index , :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
