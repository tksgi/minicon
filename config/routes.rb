Rails.application.routes.draw do
  get 'purchases/index'
  get 'purchases/new'
  get 'purchases/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller_name#action_name'
  root 'events#index'
  
  namespace :admin do
    resources :event_categories
    resources :events
  end
  
end
