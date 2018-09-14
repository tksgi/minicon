Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller_name#action_name'
  root 'events#index'
  
  resources :events, only: [:index, :show] do
    resources :purchases, only: [:new, :create]
  end
  #/events/1/purchases/new
  #/events/event_id/purchases/new
  
  get '/purchases', to: 'purchases#index'
  
  namespace :admin do
    resources :event_categories
    resources :events
  end
  
end
