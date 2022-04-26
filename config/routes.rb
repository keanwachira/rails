Rails.application.routes.draw do
  post 'transactions', to: 'transaction#create'
  get 'transactions', to: 'transaction#list'
  get 'transactions/:id', to: 'transaction#show'
  root 'transaction#list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
