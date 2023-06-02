Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'email/index'
  get 'email/change'
  get 'email/create'
  post 'email/create'
  get 'email/show'
  get 'email/:email_id', to: 'email#show'
  get 'email/:email_id/destroy', to: 'email#destroy'
  post 'email/:email_id/destroy', to: 'email#destroy'
  root 'email#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
