Rails.application.routes.draw do

  get 'participants/index'
  get 'participants/create'
  get 'participants/new'
  get 'participants/edit'
  get 'participants/show'
  get 'participants/update'
  get 'participants/destroy'
  root to: "home#index"
  devise_for :users#, :controllers=>{registrations: 'registrations'}
  resources :events do 
    resources :participants
  end
  
  resources :profile, only: [:index , :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
