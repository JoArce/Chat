Rails.application.routes.draw do
  get 'page/index'

  devise_for :users
  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'page#index'
end
