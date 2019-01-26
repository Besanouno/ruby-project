Rails.application.routes.draw do
  get 'events/create'
  get 'events/index'
  get 'events/new'
#   get 'events/show'
  get 'events/:id' => 'events#show'
  resources :events
  root :to => "events#index"
  resources :tickets
  root :to => "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
