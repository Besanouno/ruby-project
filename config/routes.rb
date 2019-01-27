Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'events/index'
  get 'events/new'
#   get 'events/show'
  get 'events/:id' => 'events#show'
  resources :events, :only => [:index, :new, :create, :show]
  root :to => "events#index"
  resources :tickets
  root :to => "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
