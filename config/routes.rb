Rails.application.routes.draw do


  get 'messages/create'

  root :to => 'page#index'
  
  get 'page/index'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :chatrooms
  resources :messages


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  mount ActionCable.server => '/cable'

end
